RegisterNetEvent('codem-dispatch:client:sendMessage', function(data, type, anonymous)
    if not IsCallAllowed(data) then return end
    PhoneAnimation()
    
    local Data = {
        type = 'SosCall',
        type2 = type,
        header = anonymous and Config.DispatchLocales['Dispatch']['Anonymous'] .. ' - ' .. type or cache.playerName .. ' - ' .. type,
        text = data,
        code = Config.DispatchTypes['SosCall'].code,
    }

    exports['codem-dispatch']:CustomDispatch(Data)
end)

function CustomDispatch(data)
    local coords = data.coords and data.coords or GetEntityCoords(cache.ped)

    local Data = {
        type = data.type,
        type2 = data.type2,
        header = data.header,
        text = data.text,
        code = data.code,
        zone = GetStreetAndZone(coords),
        coords = coords,
        job = data.job,
    }

    TriggerServerEvent('codem-dispatch:server:SendAlert', Data, Key)
end

exports('CustomDispatch', CustomDispatch)

function jobControl(job)
    local playerData = GetPlayerData()

    if not playerData.job then return false end

    if type(job) == 'table' then
        for k, v in pairs(job) do
            if v == playerData.job.name then
                return true
            end
        end
    else
        if job == playerData.job.name then
            return true
        end
    end

    return false
end

function showDispatchs()
    if not checkUIAccess() then
        if not isJobValid() then return end
    end    
    
    if Config.OnDutyOnly and not isOnDuty() then return end

    checkNUI()
    NuiMessage('SHOW_DISPATCHS')

    DispatchState = not DispatchState

    if DispatchState then
        onMenuOpen()
    else
        onMenuClose()
    end
end

if Config.EnableRegisterKeyMapping then
    RegisterKeyMapping('showDispatchs', 'Show Dispatchs', 'keyboard', Config.Keys.ShowDispatchs)

    RegisterCommand('showDispatchs', function()
        showDispatchs()
    end)

    RegisterKeyMapping('cursor', 'Open Cursor', 'keyboard', Config.Keys.Cursor)

    RegisterCommand('cursor', function()
        cursorHandle()
    end)

    RegisterKeyMapping('accept', 'Accept Call', 'keyboard', Config.Keys.Accept)

    RegisterCommand('accept', function()
        takeNUICall()
    end)
else
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            if IsControlJustPressed(0, Config.Keys.ShowDispatchs) then
                showDispatchs()
            end

            if IsControlJustPressed(0, Config.Keys.Cursor) then
                cursorHandle()
            end

            if IsControlJustPressed(0, Config.Keys.Accept) then
                takeNUICall()
            end
        end
    end)
end

function isJobValid(forceJob)
    if not GetPlayerData().job then return false end
    if forceJob and not jobControl(forceJob) then return false end
    if not forceJob and not Config.Jobs[GetPlayerData().job.name] then return false end

    return true
end

function checkUIAccess()
    if not Config.UIAccess then return true end
    if Config.UIAccess and Config.UIAccess[GetPlayerData().job.name] then return true end

    return false
end

function GetPlayerData()
    waitCore()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx'  then
        return Core.GetPlayerData()
    else
        return Core.Functions.GetPlayerData()
    end
end

function isOnDuty()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return true
    else
        local playerData = GetPlayerData()
        return playerData.job.onduty 
    end
end

function GetIsHandcuffed()
    -- Your hand cuff check code here
    return false
end

function HasPhone()
    local hasPhone = TriggerCallback('codem-dispatch:hasPhone')
end

function requestAnimDict(dict, time)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
    Wait(time)
end

function PhoneAnimation()
   -- Your phone animation code here
end

RegisterNetEvent('codem-dispatch:client:addBlip', function(name, label, type, coords, sprite, color, scale, duration)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
end)