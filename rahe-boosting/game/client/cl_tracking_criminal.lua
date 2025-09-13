local L0_1, L1_1, L2_1, L3_1
isInEscapingCar = false
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 1
    L3_2 = 4
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = VehToNet
    L3_2 = GetVehiclePedIsIn
    L4_2 = PlayerPedId
    L4_2, L5_2, L6_2 = L4_2()
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    L3_2 = TriggerServerEvent
    L4_2 = "rahe-boosting:server:successfulGpsHack"
    L5_2 = L2_2
    L6_2 = L1_2
    L3_2(L4_2, L5_2, L6_2)
  else
    L1_2 = notifyPlayer
    L2_2 = translations
    L2_2 = L2_2.NOTIFICATION_GAME_HACKING_FAILED
    L3_2 = G_NOTIFICATION_TYPE_ERROR
    L1_2(L2_2, L3_2)
    L1_2 = TriggerServerEvent
    L2_2 = "rahe-boosting:server:unsuccessfulGpsHack"
    L3_2 = VehToNet
    L4_2 = GetVehiclePedIsIn
    L5_2 = PlayerPedId
    L5_2, L6_2 = L5_2()
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    L1_2 = TriggerEvent
    L2_2 = "rahe-boosting:client:failedGpsHack"
    L1_2(L2_2)
  end
end
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = lib
  L1_2 = L1_2.callback
  L2_2 = "rahe-boosting:server:getVehicleBoostingData"
  L3_2 = false
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    if not A0_3 then
      L1_3 = notifyPlayer
      L2_3 = translations
      L2_3 = L2_3.NOTIFICATION_GAME_NO_GPS_DEVICE
      L3_3 = G_NOTIFICATION_TYPE_ERROR
      L1_3(L2_3, L3_3)
      return
    end
    L1_3 = A0_3.currentTime
    L2_3 = A0_3.lastHackCompletedAt
    L1_3 = L1_3 - L2_3
    L2_3 = clConfig
    L2_3 = L2_3.gpsHackingCooldown
    if L1_3 < L2_3 then
      L1_3 = notifyPlayer
      L2_3 = translations
      L2_3 = L2_3.NOTIFICATION_GAME_HACK_COOLDOWN
      L3_3 = L2_3
      L2_3 = L2_3.format
      L4_3 = clConfig
      L4_3 = L4_3.gpsHackingCooldown
      L5_3 = A0_3.currentTime
      L6_3 = A0_3.lastHackCompletedAt
      L5_3 = L5_3 - L6_3
      L4_3 = L4_3 - L5_3
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = G_NOTIFICATION_TYPE_ERROR
      L1_3(L2_3, L3_3)
      return
    end
    isInEscapingCar = true
    L1_3 = Entity
    L2_3 = L0_2
    L1_3 = L1_3(L2_3)
    L1_3 = L1_3.state
    L1_3 = L1_3.boostingData
    L2_3 = notifyPlayer
    L3_3 = translations
    L3_3 = L3_3.NOTIFICATION_GAME_HACK_STARTED
    L4_3 = G_NOTIFICATION_TYPE_INFORM
    L2_3(L3_3, L4_3)
    L2_3 = TriggerEvent
    L3_3 = "rahe-hackingdevice:start-hacking"
    L4_3 = clConfig
    L4_3 = L4_3.gpsHackingHackType
    L5_3 = clConfig
    L5_3 = L5_3.gpsHackingGameType
    L6_3 = math
    L6_3 = L6_3.random
    L7_3 = L1_3.gpsHackMinTime
    L8_3 = L1_3.gpsHackMaxTime
    L6_3 = L6_3(L7_3, L8_3)
    L7_3 = L0_1
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)
  end
  L5_2 = VehToNet
  L6_2 = L0_2
  L5_2, L6_2 = L5_2(L6_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
useGpsHackingDevice = L1_1
L1_1 = lib
L1_1 = L1_1.onCache
L2_1 = "vehicle"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "gpshackprogress"
    L3_2 = false
    L4_2 = 0
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L1_2 = NetworkGetEntityIsNetworked
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = TriggerServerEvent
    L2_2 = "rahe-boosting:server:vehicleEntered"
    L3_2 = VehToNet
    L4_2 = A0_2
    L3_2, L4_2 = L3_2(L4_2)
    L1_2(L2_2, L3_2, L4_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:boostingVehicleEntered"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:boostingVehicleEntered"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerEvent
  L2_2 = "gpshackprogress"
  L3_2 = true
  L4_2 = A0_2.hacksCompleted
  L1_2(L2_2, L3_2, L4_2)
end
L1_1(L2_1, L3_1)
