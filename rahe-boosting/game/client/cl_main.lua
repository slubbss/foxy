local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = nil
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:startContract"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L0_1 = A0_2
  L2_2 = A0_2.vehicleSpawned
  if not L2_2 then
    L2_2 = createVehicleSpawnPoint
    L2_2()
  end
  L2_2 = createBlips
  L3_2 = A0_2.vehicleSpawned
  L3_2 = not L3_2
  L4_2 = A0_2.areaXOffset
  L5_2 = A0_2.areaYOffset
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = createVehicleDropOffPoint
  L2_2()
  if A1_2 then
    L2_2 = translations
    L2_2 = L2_2.NOTIFICATION_TABLET_CONTRACT_STARTED
    if L2_2 then
      goto lbl_32
    end
  end
  L2_2 = A0_2.vehicleSpawned
  if not L2_2 then
    L2_2 = translations
    L3_2 = "NOTIFICATION_TABLET_CONTRACT_RECOVERED_FULLY"
    L2_2 = L2_2[L3_2]
    if L2_2 then
      goto lbl_32
    end
  end
  L2_2 = translations
  L3_2 = "NOTIFICATION_TABLET_CONTRACT_RECOVERED_PARTIALLY"
  L2_2 = L2_2[L3_2]
  ::lbl_32::
  L3_2 = TriggerEvent
  L4_2 = "rahe-boosting:client:infoNotification"
  L5_2 = L2_2
  L6_2 = 7000
  L3_2(L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = nil
L2_1 = nil
L3_1 = nil
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = deleteBlips
  L3_2()
  L3_2 = lib
  L3_2 = L3_2.points
  L3_2 = L3_2.new
  L4_2 = {}
  L5_2 = vector3
  L6_2 = L0_1.pickUpLocation
  L6_2 = L6_2.x
  L6_2 = L6_2 + A1_2
  L7_2 = L0_1.pickUpLocation
  L7_2 = L7_2.y
  L7_2 = L7_2 + A2_2
  L8_2 = L0_1.pickUpLocation
  L8_2 = L8_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2.coords = L5_2
  L5_2 = clConfig
  L5_2 = L5_2.vehicleAreaRadius
  L5_2 = L5_2 + 25
  L4_2.distance = L5_2
  L3_2 = L3_2(L4_2)
  L3_1 = L3_2
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.hasEntered
    if not L1_3 then
      A0_3.hasEntered = true
      L1_3 = TriggerServerEvent
      L2_3 = "rahe-boosting:server:enteredArea"
      L3_3 = L0_1.id
      L1_3(L2_3, L3_3)
    end
  end
  L3_1.onEnter = L3_2
  if A0_2 then
    L3_2 = L0_1.pickUpLocation
    L3_2 = L3_2.x
    L3_2 = L3_2 + A1_2
    L4_2 = L0_1.pickUpLocation
    L4_2 = L4_2.y
    L4_2 = L4_2 + A2_2
    L5_2 = AddBlipForRadius
    L6_2 = L3_2
    L7_2 = L4_2
    L8_2 = 0.0
    L9_2 = clConfig
    L9_2 = L9_2.vehicleAreaRadius
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L2_1 = L5_2
    L5_2 = SetBlipSprite
    L6_2 = L2_1
    L7_2 = 9
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipColour
    L6_2 = L2_1
    L7_2 = clConfig
    L7_2 = L7_2.pickUpAreaColor
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipAlpha
    L6_2 = L2_1
    L7_2 = 80
    L5_2(L6_2, L7_2)
  end
  L3_2 = AddBlipForCoord
  L4_2 = L0_1.deliveryLocation
  L4_2 = L4_2.x
  L5_2 = L0_1.deliveryLocation
  L5_2 = L5_2.y
  L6_2 = L0_1.deliveryLocation
  L6_2 = L6_2.z
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L1_1 = L3_2
  L3_2 = SetBlipSprite
  L4_2 = L1_1
  L5_2 = clConfig
  L5_2 = L5_2.dropOffAreaBlipSprite
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipColour
  L4_2 = L1_1
  L5_2 = clConfig
  L5_2 = L5_2.dropOffAreaBlipColor
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipAlpha
  L4_2 = L1_1
  L5_2 = 200
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipDisplay
  L4_2 = L1_1
  L5_2 = 4
  L3_2(L4_2, L5_2)
  L3_2 = BeginTextCommandSetBlipName
  L4_2 = "STRING"
  L3_2(L4_2)
  L3_2 = AddTextComponentSubstringPlayerName
  L4_2 = translations
  L4_2 = L4_2.LABEL_MAP_BLIP_DELIVER_HERE
  L3_2(L4_2)
  L3_2 = EndTextCommandSetBlipName
  L4_2 = L1_1
  L3_2(L4_2)
end
createBlips = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = DoesBlipExist
  L1_2 = L2_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = RemoveBlip
    L1_2 = L2_1
    L0_2(L1_2)
  end
  L0_2 = DoesBlipExist
  L1_2 = L1_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = RemoveBlip
    L1_2 = L1_1
    L0_2(L1_2)
  end
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L3_1
    L1_2 = L0_2
    L0_2 = L0_2.remove
    L0_2(L1_2)
  end
end
deleteBlips = L4_1
L4_1 = nil
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = lib
  L0_2 = L0_2.points
  L0_2 = L0_2.new
  L1_2 = vector3
  L2_2 = L0_1.pickUpLocation
  L2_2 = L2_2.x
  L3_2 = L0_1.pickUpLocation
  L3_2 = L3_2.y
  L4_2 = L0_1.pickUpLocation
  L4_2 = L4_2.z
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = clConfig
  L2_2 = L2_2.vehicleCreationDistance
  L3_2 = {}
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L4_1 = L0_2
  function L0_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L0_1.type
    if "PERSONAL" == L1_3 then
      L1_3 = L0_1.vehicleSpawned
      if not L1_3 then
        L0_1.vehicleSpawned = true
        L1_3 = TriggerServerEvent
        L2_3 = "rahe-boosting:server:setContractVehicleAsSpawned"
        L1_3(L2_3)
        L1_3 = spawnBoostVehicle
        L2_3 = L0_1
        L1_3(L2_3)
    end
    else
      L1_3 = L0_1.type
      if "GROUP" == L1_3 then
        L1_3 = L0_1.vehicleSpawned
        if not L1_3 then
          L1_3 = lib
          L1_3 = L1_3.callback
          L1_3 = L1_3.await
          L2_3 = "rahe-boosting:server:vehicleMarkedAsSpawned"
          L3_3 = false
          L4_3 = L0_1.id
          L1_3 = L1_3(L2_3, L3_3, L4_3)
          L0_1.vehicleSpawned = true
          if L1_3 then
            L2_3 = spawnBoostVehicle
            L3_3 = L0_1
            L2_3(L3_3)
          end
        end
      end
    end
  end
  L4_1.onEnter = L0_2
end
createVehicleSpawnPoint = L5_1
L5_1 = nil
L6_1 = nil
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = lib
  L0_2 = L0_2.points
  L0_2 = L0_2.new
  L1_2 = vector3
  L2_2 = L0_1.deliveryLocation
  L2_2 = L2_2.x
  L3_2 = L0_1.deliveryLocation
  L3_2 = L3_2.y
  L4_2 = L0_1.deliveryLocation
  L4_2 = L4_2.z
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = 20
  L3_2 = {}
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L5_1 = L0_2
  function L0_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = lib
    L1_3 = L1_3.showTextUI
    L2_3 = translations
    L2_3 = L2_3.INTERACTION_VEHICLE_DROP_OFF
    L3_3 = {}
    L4_3 = clConfig
    L4_3 = L4_3.dropOffUiPosition
    L3_3.position = L4_3
    L4_3 = clConfig
    L4_3 = L4_3.dropOffUiIcon
    L3_3.icon = L4_3
    L1_3(L2_3, L3_3)
    L1_3 = createDealer
    L1_3()
  end
  L5_1.onEnter = L0_2
  function L0_2(A0_3)
    local L1_3
    L1_3 = lib
    L1_3 = L1_3.hideTextUI
    L1_3()
    L1_3 = L6_1
    if L1_3 then
      L1_3 = destroyDealer
      L1_3()
    end
  end
  L5_1.onExit = L0_2
  L0_2 = clConfig
  L0_2 = L0_2.createDropOffMarker
  L1_2 = clConfig
  L1_2 = L1_2.dropOffKeybind
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3
    L1_3 = L0_2
    if L1_3 then
      L1_3 = DrawMarker
      L2_3 = 2
      L3_3 = A0_3.coords
      L3_3 = L3_3.x
      L4_3 = A0_3.coords
      L4_3 = L4_3.y
      L5_3 = A0_3.coords
      L5_3 = L5_3.z
      L6_3 = 0.0
      L7_3 = 0.0
      L8_3 = 0.0
      L9_3 = 0.0
      L10_3 = 180.0
      L11_3 = 0.0
      L12_3 = 1.0
      L13_3 = 1.0
      L14_3 = 1.0
      L15_3 = 200
      L16_3 = 20
      L17_3 = 20
      L18_3 = 50
      L19_3 = false
      L20_3 = true
      L21_3 = 2
      L22_3 = nil
      L23_3 = nil
      L24_3 = false
      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
    end
    L1_3 = IsControlJustReleased
    L2_3 = 0
    L3_3 = L1_2
    L1_3 = L1_3(L2_3, L3_3)
    if L1_3 then
      L1_3 = A0_3.currentDistance
      if L1_3 < 5 then
        L1_3 = deliverVehicle
        L1_3()
      else
        L1_3 = notifyPlayer
        L2_3 = translations
        L2_3 = L2_3.NOTIFICATION_GAME_DROP_OFF_TOO_FAR
        L3_3 = G_NOTIFICATION_TYPE_ERROR
        L1_3(L2_3, L3_3)
      end
    end
  end
  L5_1.nearby = L2_2
end
createVehicleDropOffPoint = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1
    L1_2 = L0_2
    L0_2 = L0_2.remove
    L0_2(L1_2)
  end
end
destroyVehicleSpawnPoint = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = L5_1
  if L0_2 then
    L0_2 = lib
    L0_2 = L0_2.hideTextUI
    L0_2()
    L0_2 = L5_1
    L1_2 = L0_2
    L0_2 = L0_2.remove
    L0_2(L1_2)
  end
end
destroyVehicleDropOffPoint = L7_1
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = clConfig
  L0_2 = L0_2.createDropOffNpc
  if not L0_2 then
    return
  end
  L0_2 = GetHashKey
  L1_2 = clConfig
  L1_2 = L1_2.dropOffNpcModels
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 1
  L4_2 = clConfig
  L4_2 = L4_2.dropOffNpcModels
  L4_2 = #L4_2
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2[L2_2]
  L0_2 = L0_2(L1_2)
  L1_2 = lib
  L1_2 = L1_2.requestModel
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = CreatePed
  L2_2 = 1
  L3_2 = L0_2
  L4_2 = L0_1.deliveryLocation
  L4_2 = L4_2.x
  L5_2 = L0_1.deliveryLocation
  L5_2 = L5_2.y
  L6_2 = L0_1.deliveryLocation
  L6_2 = L6_2.z
  L6_2 = L6_2 - 1.0
  L7_2 = L0_1.deliveryLocation
  L7_2 = L7_2.h
  L8_2 = false
  L9_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L6_1 = L1_2
  L1_2 = SetBlockingOfNonTemporaryEvents
  L2_2 = L6_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetPedTalk
  L2_2 = L6_1
  L1_2(L2_2)
  L1_2 = SetPedCanPlayAmbientAnims
  L2_2 = L6_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCanRagdollFromPlayerImpact
  L2_2 = L6_1
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityInvincible
  L2_2 = L6_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = FreezeEntityPosition
  L2_2 = L6_1
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = TaskStartScenarioInPlace
  L2_2 = L6_1
  L3_2 = clConfig
  L3_2 = L3_2.dropOffPedAnim
  L4_2 = 0
  L5_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
createDealer = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = clConfig
  L0_2 = L0_2.createDropOffNpc
  if L0_2 then
    L0_2 = L6_1
    if L0_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L0_2 = DeleteEntity
  L1_2 = L6_1
  L0_2(L1_2)
end
destroyDealer = L7_1
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = IsEntityAVehicle
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_12
    end
  end
  do return end
  ::lbl_12::
  L1_2 = SetVehicleModKit
  L2_2 = A0_2
  L3_2 = 0
  L1_2(L2_2, L3_2)
  L1_2 = ipairs
  L2_2 = clConfig
  L2_2 = L2_2.tunedVehiclePerformanceModIndices
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetNumVehicleMods
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    L7_2 = L7_2 - 1
    L8_2 = SetVehicleMod
    L9_2 = A0_2
    L10_2 = L6_2
    L11_2 = L7_2
    L12_2 = false
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L1_2 = clConfig
  L1_2 = L1_2.tunedVehicleToggleTurbo
  if L1_2 then
    L1_2 = ToggleVehicleMod
    L2_2 = A0_2
    L3_2 = 18
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = ipairs
  L2_2 = clConfig
  L2_2 = L2_2.tunedVehicleVisualModIndices
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetNumVehicleMods
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    L7_2 = L7_2 - 1
    if L7_2 >= 0 then
      L8_2 = SetVehicleMod
      L9_2 = A0_2
      L10_2 = L6_2
      L11_2 = math
      L11_2 = L11_2.random
      L12_2 = -1
      L13_2 = L7_2
      L11_2 = L11_2(L12_2, L13_2)
      L12_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
  L1_2 = SetVehicleColours
  L2_2 = A0_2
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 0
  L5_2 = 157
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2(L4_2, L5_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
applyVehicleTuning = L7_1
L7_1 = nil
L8_1 = nil
L9_1 = nil
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = L7_1
    if "INSIDE" == L1_2 then
      L1_2 = GetVehicleNumberPlateText
      L2_2 = L8_1
      L1_2 = L1_2(L2_2)
      L2_2 = unlockVehicleDoors
      L3_2 = L8_1
      L2_2(L3_2)
      L2_2 = SetNetworkIdCanMigrate
      L3_2 = VehToNet
      L4_2 = L8_1
      L3_2 = L3_2(L4_2)
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = SetEntityAsMissionEntity
      L3_2 = L8_1
      L4_2 = 0
      L5_2 = 0
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = SetVehicleHasBeenOwnedByPlayer
      L3_2 = L8_1
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = TriggerServerEvent
      L3_2 = "rahe-boosting:server:startVehicleTracking"
      L4_2 = VehToNet
      L5_2 = L8_1
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      L2_2(L3_2, L4_2, L5_2, L6_2)
      L2_2 = TriggerServerEvent
      L3_2 = "rahe-boosting:server:vehicleHacked"
      L4_2 = VehToNet
      L5_2 = L8_1
      L4_2 = L4_2(L5_2)
      L5_2 = "ENGINE"
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = L9_1
      if L2_2 then
        L2_2 = TriggerEvent
        L3_2 = "rahe-boosting:client:importantBoostStarted"
        L4_2 = GetEntityCoords
        L5_2 = PlayerPedId
        L5_2, L6_2 = L5_2()
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = GetVehiclePedIsIn
        L6_2 = PlayerPedId
        L6_2 = L6_2()
        L5_2 = L5_2(L6_2)
        L6_2 = currentHackClass
        L2_2(L3_2, L4_2, L5_2, L6_2)
        L2_2 = notifyPlayer
        L3_2 = translations
        L3_2 = L3_2.NOTIFICATION_GAME_GPS_TRACKER_INSTALLED
        L4_2 = G_NOTIFICATION_TYPE_INFORM
        L2_2(L3_2, L4_2)
      end
      L2_2 = Wait
      L3_2 = 1000
      L2_2(L3_2)
      L2_2 = TriggerEvent
      L3_2 = "rahe-boosting:client:giveKeys"
      L4_2 = L8_1
      L5_2 = L1_2
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = notifyPlayer
      L3_2 = translations
      L3_2 = L3_2.NOTIFICATION_GAME_VEHICLE_HACKED
      L4_2 = G_NOTIFICATION_TYPE_SUCCESS
      L2_2(L3_2, L4_2)
      isInEscapingCar = true
    else
      L1_2 = L7_1
      if "OUTSIDE" == L1_2 then
        L1_2 = unlockVehicleDoors
        L2_2 = L8_1
        L1_2(L2_2)
        L1_2 = TriggerServerEvent
        L2_2 = "rahe-boosting:server:vehicleHacked"
        L3_2 = VehToNet
        L4_2 = L8_1
        L3_2 = L3_2(L4_2)
        L4_2 = "DOOR"
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = notifyPlayer
        L2_2 = translations
        L2_2 = L2_2.NOTIFICATION_GAME_VEHICLE_OPENED
        L3_2 = G_NOTIFICATION_TYPE_SUCCESS
        L1_2(L2_2, L3_2)
      end
    end
  else
    L1_2 = notifyPlayer
    L2_2 = translations
    L2_2 = L2_2.NOTIFICATION_GAME_HACKING_FAILED
    L3_2 = G_NOTIFICATION_TYPE_ERROR
    L1_2(L2_2, L3_2)
    hackType = nil
  end
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = cache
  L0_2 = L0_2.ped
  L1_2 = GetVehiclePedIsUsing
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L8_1 = L1_2
  L1_2 = "INSIDE"
  L7_1 = L1_2
  L1_2 = false
  L9_1 = L1_2
  L1_2 = L8_1
  if 0 == L1_2 then
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = GetClosestVehicle
    L3_2 = L1_2.x
    L4_2 = L1_2.y
    L5_2 = L1_2.z
    L6_2 = 3.0
    L7_2 = 0
    L8_2 = 127
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L8_1 = L2_2
    L2_2 = "OUTSIDE"
    L7_1 = L2_2
  end
  L1_2 = L8_1
  if 0 == L1_2 then
    L1_2 = notifyPlayer
    L2_2 = translations
    L3_2 = "NOTIFICATION_GAME_HACKING_VEHICLE_NOT_FOUND"
    L2_2 = L2_2[L3_2]
    L3_2 = G_NOTIFICATION_TYPE_ERROR
    L1_2(L2_2, L3_2)
    L1_2 = nil
    L7_1 = L1_2
    return
  end
  L1_2 = Entity
  L2_2 = L8_1
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.state
  L1_2 = L1_2.boostingData
  if L1_2 then
    L2_2 = L1_2.advancedSystem
    if L2_2 then
      goto lbl_51
    end
  end
  do return end
  ::lbl_51::
  L2_2 = L7_1
  if "INSIDE" == L2_2 then
    L2_2 = L1_2.advancedSystemEngineHacked
    if L2_2 then
      return
    end
  end
  L2_2 = L1_2.class
  currentHackClass = L2_2
  L2_2 = true
  L9_1 = L2_2
  L2_2 = L7_1
  if "OUTSIDE" == L2_2 and nil ~= L1_2 then
    L2_2 = L1_2.npcs
    if L2_2 then
      L2_2 = L1_2.npcsSpawned
      if not L2_2 then
        L2_2 = GetHashKey
        L3_2 = clConfig
        L3_2 = L3_2.pickUpAreaNpcModels
        L4_2 = math
        L4_2 = L4_2.random
        L5_2 = 1
        L6_2 = clConfig
        L6_2 = L6_2.pickUpAreaNpcModels
        L6_2 = #L6_2
        L4_2 = L4_2(L5_2, L6_2)
        L3_2 = L3_2[L4_2]
        L2_2 = L2_2(L3_2)
        L3_2 = 5
        L4_2 = lib
        L4_2 = L4_2.requestModel
        L5_2 = L2_2
        L4_2(L5_2)
        L1_2.npcsSpawned = true
        L4_2 = Entity
        L5_2 = L8_1
        L4_2 = L4_2(L5_2)
        L4_2 = L4_2.state
        L4_2.boostingData = L1_2
        L4_2 = createVehicleGuardPeds
        L5_2 = L3_2
        L6_2 = L2_2
        L7_2 = L1_2.npcCoords
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  L2_2 = notifyPlayer
  L3_2 = translations
  L3_2 = L3_2.NOTIFICATION_GAME_HACKING_STARTING
  L4_2 = G_NOTIFICATION_TYPE_INFORM
  L2_2(L3_2, L4_2)
  L2_2 = TriggerEvent
  L3_2 = "rahe-hackingdevice:start-hacking"
  L4_2 = "NUMERIC"
  L5_2 = "NORMAL"
  L6_2 = math
  L6_2 = L6_2.random
  L7_2 = 25
  L8_2 = 30
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L10_1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
useHackingDevice = L11_1
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = 0
  L3_2 = nil
  L4_2 = nil
  L5_2 = 0
  L6_2 = 100
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = CastRayPointToPoint
    L10_2 = A0_2.x
    L11_2 = A0_2.y
    L12_2 = A0_2.z
    L13_2 = A1_2.x
    L14_2 = A1_2.y
    L15_2 = A1_2.z
    L15_2 = L15_2 + L2_2
    L16_2 = 10
    L17_2 = PlayerPedId
    L17_2 = L17_2()
    L18_2 = 0
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    L3_2 = L9_2
    L9_2 = GetRaycastResult
    L10_2 = L3_2
    L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
    L4_2 = L13_2
    d = L12_2
    c = L11_2
    b = L10_2
    a = L9_2
    L2_2 = L2_2 - 1
    if 0 ~= L4_2 then
      break
    end
  end
  L5_2 = Vdist2
  L6_2 = A0_2
  L7_2 = GetEntityCoords
  L8_2 = L4_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L7_2(L8_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  if L5_2 > 25 then
    L4_2 = nil
  end
  L6_2 = L4_2 or L6_2
  if nil == L4_2 or not L4_2 then
    L6_2 = 0
  end
  return L6_2
end
getVehicleInDirection = L11_1
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  if 0 == L0_2 then
    L1_2 = notifyPlayer
    L2_2 = translations
    L2_2 = L2_2.NOTIFICATION_GAME_NOT_IN_VEHICLE
    L3_2 = G_NOTIFICATION_TYPE_ERROR
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = GetVehicleNumberPlateText
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1.licensePlate
  if L1_2 ~= L2_2 then
    L1_2 = notifyPlayer
    L2_2 = translations
    L2_2 = L2_2.NOTIFICATION_GAME_INVALID_VEHICLE
    L3_2 = G_NOTIFICATION_TYPE_ERROR
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = TriggerServerEvent
  L2_2 = "rahe-boosting:server:requestVehicleDelivery"
  L3_2 = lib
  L3_2 = L3_2.getVehicleProperties
  L4_2 = L0_2
  L3_2, L4_2 = L3_2(L4_2)
  L1_2(L2_2, L3_2, L4_2)
end
deliverVehicle = L11_1
L11_1 = RegisterNetEvent
L12_1 = "rahe-boosting:client:resetData"
function L13_1()
  local L0_2, L1_2
  L0_2 = destroyVehicleDropOffPoint
  L0_2()
  L0_2 = destroyVehicleSpawnPoint
  L0_2()
  L0_2 = nil
  L0_1 = L0_2
  activeVehicle = nil
  L0_2 = deleteBlips
  L0_2()
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "rahe-boosting:client:successfulDelivery"
L11_1(L12_1)
L11_1 = AddEventHandler
L12_1 = "rahe-boosting:client:successfulDelivery"
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = TaskLeaveVehicle
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = L0_2
  L4_2 = 1
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L6_1
  if nil ~= L1_2 then
    L1_2 = ClearPedTasksImmediately
    L2_2 = L6_1
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1500
    L1_2(L2_2)
    L1_2 = TaskEnterVehicle
    L2_2 = L6_1
    L3_2 = L0_2
    L4_2 = 2.0
    L5_2 = -1
    L6_2 = 1
    L7_2 = 1
    L8_2 = 0
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L1_2 = SetEntityAsNoLongerNeeded
    L2_2 = L6_1
    L1_2(L2_2)
  end
  L1_2 = Wait
  L2_2 = 15000
  L1_2(L2_2)
  L1_2 = destroyDealer
  L1_2()
end
L11_1(L12_1, L13_1)
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if nil == A1_2 then
    A1_2 = 0
  end
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = ""
    L3_2 = 1
    L4_2 = A1_2 + 1
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2
      L8_2 = "    "
      L7_2 = L7_2 .. L8_2
      L2_2 = L7_2
    end
    L2_2 = "{\n"
    L3_2 = pairs
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = type
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if "number" ~= L9_2 then
        L9_2 = "\""
        L10_2 = L7_2
        L11_2 = "\""
        L9_2 = L9_2 .. L10_2 .. L11_2
        L7_2 = L9_2
      end
      L9_2 = 1
      L10_2 = A1_2
      L11_2 = 1
      for L12_2 = L9_2, L10_2, L11_2 do
        L13_2 = L2_2
        L14_2 = "    "
        L13_2 = L13_2 .. L14_2
        L2_2 = L13_2
      end
      L9_2 = L2_2
      L10_2 = "["
      L11_2 = L7_2
      L12_2 = "] = "
      L13_2 = DumpTable
      L14_2 = L8_2
      L15_2 = A1_2 + 1
      L13_2 = L13_2(L14_2, L15_2)
      L14_2 = ",\n"
      L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
      L2_2 = L9_2
    end
    L3_2 = 1
    L4_2 = A1_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2
      L8_2 = "    "
      L7_2 = L7_2 .. L8_2
      L2_2 = L7_2
    end
    L3_2 = L2_2
    L4_2 = "}"
    L3_2 = L3_2 .. L4_2
    return L3_2
  else
    L2_2 = tostring
    L3_2 = A0_2
    return L2_2(L3_2)
  end
end
DumpTable = L11_1
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetVehiclePedIsIn
  L2_2 = A0_2
  L3_2 = false
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = -2
  L3_2 = GetVehicleMaxNumberOfPassengers
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = GetPedInVehicleSeat
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 == A0_2 then
      return L5_2
    end
  end
  L2_2 = -2
  return L2_2
end
GetPedVehicleSeat = L11_1
function L11_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A3_2 or nil
  if not A3_2 then
    L4_2 = 1000
  end
  while true do
    L5_2 = A0_2
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      break
    end
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
    L4_2 = L4_2 - 1
    if L4_2 < 1 then
      L5_2 = print
      L6_2 = "Unable to load %s after %s ticks (%s)"
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = A1_2
      L9_2 = A3_2 or L9_2
      if not A3_2 then
        L9_2 = 1000
      end
      L10_2 = A2_2
      L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    end
  end
  return A2_2
end
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2 or A0_2
  if not L2_2 then
    L2_2 = joaat
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  end
  L2_2 = HasModelLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return A0_2
  end
  L2_2 = assert
  L3_2 = IsModelValid
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = "Attempted to load an invalid model (%s)"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = RequestModel
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = L11_1
  L3_2 = HasModelLoaded
  L4_2 = "model"
  L5_2 = A0_2
  L6_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
requestModel = L12_1
