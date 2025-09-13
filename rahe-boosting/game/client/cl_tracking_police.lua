local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:receiveTrackingPosition"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:receiveTrackingPosition"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = isPlayerPolice
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = DoesBlipExist
      L3_2 = L0_1
      L3_2 = L3_2[A1_2]
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = RemoveBlip
        L3_2 = L0_1
        L3_2 = L3_2[A1_2]
        L2_2(L3_2)
      end
    end
    L2_2 = L0_1
    L3_2 = AddBlipForCoord
    L4_2 = A0_2.x
    L5_2 = A0_2.y
    L6_2 = A0_2.z
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2[A1_2] = L3_2
    L2_2 = SetBlipScale
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = 1.0
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipAsShortRange
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipSprite
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = 645
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipColour
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = 1
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipAlpha
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = 180
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipHighDetail
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L4_2 = 1
    L2_2(L3_2, L4_2)
    L2_2 = BeginTextCommandSetBlipName
    L3_2 = "STRING"
    L2_2(L3_2)
    L2_2 = AddTextComponentString
    L3_2 = translations
    L3_2 = L3_2.LABEL_MAP_VEHICLE_LOCATION
    L2_2(L3_2)
    L2_2 = EndTextCommandSetBlipName
    L3_2 = L0_1
    L3_2 = L3_2[A1_2]
    L2_2(L3_2)
    L2_2 = PlaySound
    L3_2 = -1
    L4_2 = clConfig
    L4_2 = L4_2.gpsNotificationSoundName
    L5_2 = clConfig
    L5_2 = L5_2.gpsNotificationSoundRef
    L6_2 = 0
    L7_2 = 0
    L8_2 = 1
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  else
    L2_2 = isInEscapingCar
    if L2_2 then
      L2_2 = GetVehiclePedIsIn
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
      if nil ~= L2_2 then
        L3_2 = lib
        L3_2 = L3_2.callback
        L4_2 = "rahe-boosting:server:isVehicleBeingTracked"
        L5_2 = false
        function L6_2(A0_3)
          local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
          if A0_3 then
            L1_3 = PlaySound
            L2_3 = -1
            L3_3 = clConfig
            L3_3 = L3_3.gpsNotificationSoundName
            L4_3 = clConfig
            L4_3 = L4_3.gpsNotificationSoundRef
            L5_3 = 0
            L6_3 = 0
            L7_3 = 1
            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
          end
        end
        L7_2 = VehToNet
        L8_2 = L2_2
        L7_2, L8_2 = L7_2(L8_2)
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:stopVehicleTracking"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:stopVehicleTracking"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = isPlayerPolice
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = L0_1
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L1_2 = DoesBlipExist
      L2_2 = L0_1
      L2_2 = L2_2[A0_2]
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = RemoveBlip
        L2_2 = L0_1
        L2_2 = L2_2[A0_2]
        L1_2(L2_2)
        L1_2 = notifyPlayer
        L2_2 = translations
        L2_2 = L2_2.NOTIFICATION_GAME_POLICE_GPS_STOPPED
        L3_2 = G_NOTIFICATION_TYPE_ERROR
        L1_2(L2_2, L3_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
