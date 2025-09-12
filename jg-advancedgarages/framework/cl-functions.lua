--
-- Core Functions
--
function Framework.Client.TriggerCallback(cbRef, cb, ...)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.TriggerCallback(cbRef, function(res)
      cb(res)
    end, ...)
  elseif Config.Framework == "ESX" then
    return ESX.TriggerServerCallback(cbRef, function(res)
      cb(res)
    end, ...)
  end
end

function Framework.Client.ShowTextUI(text)
  if Config.DrawText == "jg-textui" then
    exports['jg-textui']:DrawText(text)
  elseif Config.DrawText == "qb-DrawText" then
    exports["qb-core"]:DrawText(text)
  elseif Config.DrawText == "okokTextUI" then
    exports['okokTextUI']:Open(text, 'lightblue', 'left')
  elseif Config.DrawText == "ox_lib" then
    exports['ox_lib']:showTextUI(text, {
      position = "left-center"
    })
  elseif Config.DrawText == "ps-ui" then
    exports['ps-ui']:DisplayText(text, "primary")
  end
end

function Framework.Client.HideTextUI()
  if Config.DrawText == "jg-textui" then
    exports['jg-textui']:HideText()
  elseif Config.DrawText == "qb-DrawText" then
    exports["qb-core"]:HideText()
  elseif Config.DrawText == "okokTextUI" then
    exports['okokTextUI']:Close()
  elseif Config.DrawText == "ox_lib" then
    exports['ox_lib']:hideTextUI()
  elseif Config.DrawText == "ps-ui" then
    exports['ps-ui']:HideText()
  end
end

function Framework.Client.Notify(msg, type, time)
  type = type or 'success'
  time = time or 5000

  if Config.Notifications == "okokNotify" then
    exports['okokNotify']:Alert('Garages', msg, time, type)
  elseif Config.Notifications == "ox_lib" then
    exports['ox_lib']:notify({
      title = 'Garages',
      description = msg,
      type = type
    })
  elseif Config.Notifications == "ps-ui" then
    exports['ps-ui']:Notify(msg, type, time)
  else
    if Config.Framework == "QBCore" then
      return QBCore.Functions.Notify(msg, type, time)
    elseif Config.Framework == "ESX" then
      return ESX.ShowNotification(msg, type)
    end
  end
end

RegisterNetEvent("jg-advancedgarages:client:Notify", function(...)
  Framework.Client.Notify(...)
end)

--
-- Player Functions
--
function Framework.Client.GetPlayerIdentifier()
  if Config.Framework == "QBCore" then
    return Globals.PlayerData.citizenid
  elseif Config.Framework == "ESX" then
    return Globals.PlayerData.identifier
  end
end

function Framework.Client.GetBankBalance()
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetPlayerData().money.bank
  elseif Config.Framework == "ESX" then
    for i, acc in pairs(ESX.GetPlayerData().accounts) do
      if acc.name == "bank" then
        return acc.money
      end
    end

    return 0
  end
end

function Framework.Client.GetPlayerJob()
  local player = Globals.PlayerData

  if not player or not player.job then
    return {}
  end

  if Config.Framework == "QBCore" then
    return {
      name = player.job.name,
      grade = player.job.grade.level
    }
  elseif Config.Framework == "ESX" then
    return {
      name = player.job.name,
      grade = player.job.grade
    }
  end
end

function Framework.Client.GetPlayerGang()
  if Config.Framework == "QBCore" then
    local player = QBCore.Functions.GetPlayerData()

    if not player or not player.gang then
      return {}
    end

    return {
      name = player.gang.name,
      grade = player.gang.grade.level
    }
  elseif Config.Framework == "ESX" then
    error("ESX does not natively support gangs.");
  end
end

function Framework.Client.IsPlayerDead()
  if Config.Framework == "QBCore" then
    local player = QBCore.Functions.GetPlayerData()

    if player.metadata.isdead or player.metadata.inlaststand then
      return true
    end
  elseif Config.Framework == "ESX" then
    return IsEntityDead(GetPlayerPed(-1))
  end
end

--
-- Vehicle Functions
--
function Framework.Client.VehicleGetFuel(vehicle)
  if (Config.FuelSystem == "LegacyFuel" or Config.FuelSystem == "ps-fuel" or Config.FuelSystem == "lj-fuel" or Config.FuelSystem == "cdn-fuel" or Config.FuelSystem == "hyon_gas_station") then
    return exports[Config.FuelSystem]:GetFuel(vehicle)
  elseif Config.FuelSystem == "ox_fuel" then
    return GetVehicleFuelLevel(vehicle)
  else
    return 65 -- or set up custom fuel system here...
  end
end

function Framework.Client.VehicleSetFuel(vehicle, fuel)
  if (Config.FuelSystem == "LegacyFuel" or Config.FuelSystem == "ps-fuel" or Config.FuelSystem == "lj-fuel" or Config.FuelSystem == "cdn-fuel" or Config.FuelSystem == "hyon_gas_station") then
    exports[Config.FuelSystem]:SetFuel(vehicle, fuel)
  elseif Config.FuelSystem == "ox_fuel" then
    Entity(vehicle).state.fuel = fuel
  else
    -- Setup custom fuel system here
  end
end

function Framework.Client.VehicleGiveKeys(plate, vehicleModel, vehicleEntity)
  if Config.VehicleKeys == "qb-vehiclekeys" then
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
  elseif Config.VehicleKeys == "jaksam-vehicles-keys" then
    TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
  elseif Config.VehicleKeys == "mk_vehiclekeys" then
    exports["mk_vehiclekeys"]:AddKey(vehicleEntity)
  elseif Config.VehicleKeys == "qs-vehiclekeys" then
    local model = GetDisplayNameFromVehicleModel(vehicleModel):lower()
    TriggerServerEvent('vehiclekeys:server:givekey', plate, model)
  else
    -- Setup custom key system here...
  end
end

function Framework.Client.GetModsColumn(vehicle)
  if Config.Framework == "QBCore" then
    return json.decode(vehicle.mods)
  elseif Config.Framework == "ESX" then
    return json.decode(vehicle.vehicle)
  end
end

function Framework.Client.GetModelColumn(vehicle)
  if Config.Framework == "QBCore" then
    return GetHashKey(vehicle.vehicle)
  elseif Config.Framework == "ESX" then
    return json.decode(vehicle.vehicle).model
  end
end

function Framework.Client.GetVehicleProperties(vehicle)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetVehicleProperties(vehicle)
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetVehicleProperties(vehicle)
  end
end

function Framework.Client.SetVehicleProperties(vehicle, props)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.SetVehicleProperties(vehicle, props)
  elseif Config.Framework == "ESX" then
    return ESX.Game.SetVehicleProperties(vehicle, props)
  end
end

function Framework.Client.GetPlate(vehicle)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetPlate(vehicle)
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetVehicleProperties(vehicle).plate
  end
end

function Framework.Client.GetVehicleLabel(modelhash)
  local modelName = GetLabelText(GetDisplayNameFromVehicleModel(modelhash))

  if modelName == "NULL" then
    modelName = GetDisplayNameFromVehicleModel(modelhash)
  end

  if Config.Framework == "QBCore" then
    local vehShared = QBCore.Shared.Vehicles[modelName]

    if vehShared then
      modelName = vehShared.brand .. " " .. vehShared.name
    end
  end

  return modelName
end

function Framework.Client.GetVehiclesInArea(coords, maxDistance)
  if Config.Framework == "QBCore" then
    local entities = QBCore.Functions.GetVehicles()

    local nearbyEntities = {}
    coords = vector3(coords.x, coords.y, coords.z)

    for k, entity in pairs(entities) do
      local distance = #(coords - GetEntityCoords(entity))
      if distance <= maxDistance then
        nearbyEntities[#nearbyEntities + 1] = entity
      end
    end

    return nearbyEntities
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetVehiclesInArea(coords, maxDistance)
  end
end

function Framework.Client.GetClosestVehicle()
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetClosestVehicle()
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetClosestVehicle()
  end
end
