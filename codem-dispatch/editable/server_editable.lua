function GetPlayer(source)
    local Player = nil
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function GetPlayerJob(xPlayer)
    if not xPlayer then return end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return xPlayer.getJob().name
    else
        return xPlayer.PlayerData.job.name
    end
end

function notifyEMS(source, data)
    local text = Config.DispatchLocales['Notify']['Forwarded'] .. data.type .. ' - ' .. data.zone

    Notification(text, 'success', true, source)
end

function GetCharacterName(source)
    local xPlayer = GetPlayer(source)
    if not xPlayer then return {firstName = 'Unknown', lastName = 'Unknown'} end
    local firstName, lastName
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        if xPlayer.get and xPlayer.get("firstName") and xPlayer.get("lastName") then
            firstName = xPlayer.get("firstName") or 'Unknown'
            lastName = xPlayer.get("lastName") or 'Unknown'
        else
            local name = ExecuteSql("SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier", {["@identifier"] = GetIdentifier(source)})
            firstName, lastName = name[1]?.firstname or GetPlayerName(source), name[1]?.lastname or ""
        end
    else
        firstName = xPlayer.PlayerData.charinfo.firstname or 'Unknown'
        lastName = xPlayer.PlayerData.charinfo.lastname or 'Unknown'
    end
    return {firstName = firstName, lastName = lastName}
end

function isResourceStartedOrStarting(resource)
    local state = GetResourceState(resource)
    return state == "started" or state == "starting"
end

function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil

    Config.SQL = isResourceStartedOrStarting("oxmysql") and "oxmysql" or isResourceStartedOrStarting("ghmattimysql") and "ghmattimysql" or isResourceStartedOrStarting("mysql-async") and "mysql-async" or "oxmysql"

    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

RegisterNetEvent('codem-dispatch:server:requestEMS', function()
    local src = source
    local PlayerName = GetCharacterName(src)
    local Players = GetPlayers()

    for _,v in pairs(Players) do
        local Player = GetPlayer(tonumber(v))
        local PlayerJob = GetPlayerJob(Player)
        if Player and PlayerJob then
            if Config.EmsJobs[PlayerJob] then
                local text = PlayerName.firstName .. ' ' .. PlayerName.lastName .. ' ' .. "is requesting EMS assistance"
                Notification(text, 'success', true, tonumber(v))
                TriggerClientEvent('codem-dispatch:client:addBlip', tonumber(v), PlayerName.firstName .. ' ' .. PlayerName.lastName, 'EMS Request', GetEntityCoords(GetPlayerPed(src)), 153, 1, 0.8, 30000)
            end
        end
    end
end)

function HasItem(source, itemName, itemAmount)
    local Player = GetPlayer(source)
    itemAmount = tonumber(itemAmount) or 1
    local framework = Config.Framework
    local inventoryType = Config.Inventory.Inventory
    
    if framework == 'esx' or framework == 'oldesx' then
        if inventoryType == 'codem-inventory' then
            local exportExists, result = pcall(exports["codem-inventory"].CheckItemValid, source, itemName, itemAmount)
            return exportExists and (result or 0) > 0

        elseif inventoryType == 'qs-inventory' then
            local totalAmount = exports['qs-inventory']:GetItemTotalAmount(source, itemName)

            return totalAmount >= itemAmount
        else
            local playerItem = Player.getInventoryItem(itemName)
            if playerItem then
                local amount = playerItem.count or playerItem.amount
                return tonumber(amount) >= itemAmount
            end
        end
    else
        if inventoryType == 'codem-inventory' then
            local exportExists, result = pcall(exports["codem-inventory"].CheckItemValid, source, itemName, itemAmount)
            return exportExists and result

        elseif inventoryType == 'qs-inventory' then
            local totalAmount = exports['qs-inventory']:GetItemTotalAmount(source, itemName)
            return totalAmount >= itemAmount
        else
            return Core.Functions.HasItem(source, itemName, itemAmount)
        end
    end

    return false
end

RegisterCallback('codem-dispatch:hasPhone', function(source)
    return HasItem(source, 'phone')
end)