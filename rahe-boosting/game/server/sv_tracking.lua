local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = svConfig
L0_1 = L0_1.adminPrincipal
if L0_1 then
  L0_1 = lib
  L0_1 = L0_1.addAce
  L1_1 = svConfig
  L1_1 = L1_1.adminPrincipal
  L2_1 = "boosting.admin"
  L0_1(L1_1, L2_1)
end
L0_1 = {}
L1_1 = {}
L2_1 = Citizen
L2_1 = L2_1.CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = os
    L0_2 = L0_2.time
    L0_2 = L0_2()
    L1_2 = pairs
    L2_2 = L0_1
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = L0_1
        L7_2[L5_2] = nil
        L7_2 = TriggerClientEvent
        L8_2 = "rahe-boosting:client:stopVehicleTracking"
        L9_2 = -1
        L10_2 = L1_1
        L10_2 = L10_2[L5_2]
        L7_2(L8_2, L9_2, L10_2)
      else
        L7_2 = L6_2.locationLastSentAt
        L7_2 = L0_2 - L7_2
        L8_2 = L6_2.locationInterval
        if L7_2 >= L8_2 then
          L7_2 = L1_1
          L8_2 = NetworkGetNetworkIdFromEntity
          L9_2 = L5_2
          L8_2 = L8_2(L9_2)
          L7_2[L5_2] = L8_2
          L7_2 = alertPoliceLocation
          L8_2 = L5_2
          L7_2(L8_2)
          L7_2 = os
          L7_2 = L7_2.time
          L7_2 = L7_2()
          L6_2.locationLastSentAt = L7_2
        end
      end
    end
  end
end
L2_1(L3_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "rahe-boosting:server:isVehicleBeingTracked"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  L3_2 = L3_2[L2_2]
  L3_2 = nil ~= L3_2
  return L3_2
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "rahe-boosting:server:getVehicleBoostingData"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L4_2 = os
    L4_2 = L4_2.time
    L4_2 = L4_2()
    L3_2.currentTime = L4_2
    return L3_2
  end
  L3_2 = false
  return L3_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "rahe-boosting:server:vehicleHacked"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = Entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L3_2 = L3_2.boostingData
  if "DOOR" == A1_2 then
    L3_2.advancedSystemDoorsHacked = true
  elseif "ENGINE" == A1_2 then
    L3_2.advancedSystemEngineHacked = true
  end
  L4_2 = Entity
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2.state
  L4_2.boostingData = L3_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "rahe-boosting:server:requestVehicleDelivery"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = GetVehiclePedIsIn
  L3_2 = GetPlayerPed
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L3_2 = Entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L3_2 = L3_2.boostingData
  L4_2 = L3_2.advancedSystem
  if L4_2 then
    L4_2 = L3_2.advancedSystemDoorsHacked
    if not L4_2 then
      L4_2 = notifyPlayer
      L5_2 = L1_2
      L6_2 = translations
      L7_2 = "NOTIFICATION_GAME_VEHICLE_DELIVERY_DOORS_NOT_HACKED"
      L6_2 = L6_2[L7_2]
      L7_2 = G_NOTIFICATION_TYPE_ERROR
      L4_2(L5_2, L6_2, L7_2)
      return
    end
  end
  L4_2 = L3_2.advancedSystem
  if L4_2 then
    L4_2 = L3_2.advancedSystemEngineHacked
    if not L4_2 then
      L4_2 = notifyPlayer
      L5_2 = L1_2
      L6_2 = translations
      L7_2 = "NOTIFICATION_GAME_VEHICLE_DELIVERY_ENGINE_NOT_HACKED"
      L6_2 = L6_2[L7_2]
      L7_2 = G_NOTIFICATION_TYPE_ERROR
      L4_2(L5_2, L6_2, L7_2)
      return
    end
  end
  L4_2 = L0_1
  L4_2 = L4_2[L2_2]
  if nil ~= L4_2 then
    L4_2 = notifyPlayer
    L5_2 = L1_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_GAME_NOT_HACKED
    L7_2 = G_NOTIFICATION_TYPE_ERROR
    L4_2(L5_2, L6_2, L7_2)
    return
  end
  L4_2 = completeContract
  L5_2 = GetVehicleEngineHealth
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L6_2 = A0_2
  L4_2(L5_2, L6_2)
  L4_2 = TriggerClientEvent
  L5_2 = "rahe-boosting:client:successfulDelivery"
  L6_2 = L1_2
  L4_2(L5_2, L6_2)
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 15000
    L0_3(L1_3)
    L0_3 = deleteDropOffVehicle
    L1_3 = L2_2
    L0_3(L1_3)
  end
  L4_2(L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:enteredArea"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = L2_1
    L4_2 = {}
    L3_2[A0_2] = L4_2
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L3_2[L2_2] = true
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = getGroupDataForPlayer
  L5_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2)
  if L4_2 then
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM ra_boosting_contracts WHERE id = ? AND CURRENT_TIMESTAMP() > expiration_date AND status != 'COMPLETED'"
    L8_2 = {}
    L9_2 = L4_2.contract
    L9_2 = L9_2.id
    L8_2[1] = L9_2
    L6_2(L7_2, L8_2)
    L6_2 = MySQL
    L6_2 = L6_2.single
    L6_2 = L6_2.await
    L7_2 = "SELECT * FROM ra_boosting_contracts bc WHERE id = ? AND status IN('IN_PROGRESS', 'IN_PROGRESS_VIN')"
    L8_2 = {}
    L9_2 = L4_2.contract
    L9_2 = L9_2.id
    L8_2[1] = L9_2
    L6_2 = L6_2(L7_2, L8_2)
    L5_2 = L6_2
    L6_2 = resetGroupClientData
    L7_2 = L4_2.contract
    L7_2 = L7_2.id
    L6_2(L7_2)
  else
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM ra_boosting_contracts WHERE owner_identifier = ? AND CURRENT_TIMESTAMP() > expiration_date AND status != 'COMPLETED'"
    L8_2 = {}
    L9_2 = L3_2
    L8_2[1] = L9_2
    L6_2(L7_2, L8_2)
    L6_2 = MySQL
    L6_2 = L6_2.single
    L6_2 = L6_2.await
    L7_2 = "SELECT * FROM ra_boosting_contracts bc WHERE owner_identifier = ? AND status IN('IN_PROGRESS', 'IN_PROGRESS_VIN')"
    L8_2 = {}
    L9_2 = L3_2
    L8_2[1] = L9_2
    L6_2 = L6_2(L7_2, L8_2)
    L5_2 = L6_2
    L6_2 = TriggerClientEvent
    L7_2 = "rahe-boosting:client:resetData"
    L8_2 = L2_2
    L6_2(L7_2, L8_2)
  end
  if not L5_2 then
    L6_2 = notifyPlayer
    L7_2 = L2_2
    L8_2 = translations
    L8_2 = L8_2.NOTIFICATION_GAME_LATE_DELIVERY
    L9_2 = G_NOTIFICATION_TYPE_ERROR
    L6_2(L7_2, L8_2, L9_2)
    if L4_2 then
      L6_2 = removeGroupContract
      L7_2 = L4_2.contract
      L7_2 = L7_2.id
      L6_2(L7_2)
    end
    return
  end
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE ra_boosting_contracts SET status = 'COMPLETED' WHERE id = ? AND status IN('IN_PROGRESS', 'IN_PROGRESS_VIN')"
  L8_2 = {}
  L9_2 = L5_2.id
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  if 0 == L6_2 then
    return
  end
  L7_2 = contractHasGroup
  L8_2 = L5_2.id
  L7_2 = L7_2(L8_2)
  L8_2 = L5_2.status
  if "IN_PROGRESS_VIN" == L8_2 then
    L8_2 = notifyPlayer
    L9_2 = L2_2
    L10_2 = translations
    L11_2 = "NOTIFICATION_GAME_SUCCESSFUL_VIN_DELIVERY"
    L10_2 = L10_2[L11_2]
    L11_2 = G_NOTIFICATION_TYPE_SUCCESS
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = TriggerEvent
    L9_2 = "rahe-boosting:server:vinScratchSuccessful"
    L10_2 = L2_2
    L11_2 = L5_2.vehicle_model
    L12_2 = L5_2.vehicle_model_name
    L13_2 = L5_2.vehicle_license_plate
    L14_2 = A1_2
    L15_2 = L5_2.owner_identifier
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    if L7_2 then
      L8_2 = removeGroupContract
      L9_2 = L5_2.id
      L8_2(L9_2)
    end
  elseif L7_2 then
    L8_2 = giveGroupPayout
    L9_2 = L5_2.id
    L10_2 = L5_2.vehicle_class
    L11_2 = L5_2.owner_identifier
    L12_2 = L5_2.price
    L13_2 = L5_2.payout_cash
    L14_2 = L5_2.payout_crypto
    L15_2 = L5_2.experience_gain
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L8_2 = removeGroupContract
    L9_2 = L5_2.id
    L8_2(L9_2)
  else
    L8_2 = giveSoloPayout
    L9_2 = L2_2
    L10_2 = L3_2
    L11_2 = L5_2.payout_cash
    L12_2 = L5_2.payout_crypto
    L13_2 = L5_2.experience_gain
    L14_2 = A0_2
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L8_2 = TriggerEvent
  L9_2 = "rahe-boosting:server:contractFinished"
  L10_2 = L2_2
  L11_2 = L5_2
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = lastStartedContractsByPlayer
  L9_2 = L5_2.owner_identifier
  L8_2[L9_2] = nil
end
completeContract = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getGroupPlayerIds
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = TriggerClientEvent
    L9_2 = "rahe-boosting:client:resetData"
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
end
resetGroupClientData = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2 * 100
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 / 100
  return L1_2
end
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L7_2 = getGroupPlayerIds
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L8_2 = A5_2 - A3_2
  L9_2 = 0
  if L8_2 < 0 then
    L9_2 = A5_2
    L8_2 = 0
  else
    L9_2 = A3_2
  end
  L10_2 = math
  L10_2 = L10_2.ceil
  L11_2 = #L7_2
  L11_2 = L8_2 / L11_2
  L10_2 = L10_2(L11_2)
  L11_2 = math
  L11_2 = L11_2.ceil
  L12_2 = #L7_2
  L12_2 = A4_2 / L12_2
  L11_2 = L11_2(L12_2)
  L12_2 = getVehicleClassFromId
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L13_2 = nil
  L14_2 = nil
  L15_2 = nil
  L16_2 = svConfig
  L16_2 = L16_2.splitExperienceInGroups
  if L16_2 then
    L16_2 = #L7_2
    if L16_2 > 1 then
      L16_2 = L12_2.bonusExperienceMultiplier
      if L16_2 > 1 then
        L16_2 = #L7_2
        L17_2 = L12_2.bonusExperienceMinimumMembers
        if L16_2 >= L17_2 then
          L16_2 = L12_2.bonusExperienceMultiplier
          if L16_2 then
            goto lbl_47
            L13_2 = L16_2 or L13_2
          end
        end
      end
    end
    L13_2 = 1
    ::lbl_47::
    L14_2 = A6_2 * L13_2
    L16_2 = L3_1
    L17_2 = #L7_2
    L17_2 = L14_2 / L17_2
    L16_2 = L16_2(L17_2)
    L15_2 = L16_2
  end
  L16_2 = ipairs
  L17_2 = L7_2
  L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
  for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
    L22_2 = GetPlayerPing
    L23_2 = L21_2
    L22_2 = L22_2(L23_2)
    if 0 ~= L22_2 then
      L22_2 = CreateThread
      function L23_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L0_3 = TriggerClientEvent
        L1_3 = "rahe-boosting:client:resetData"
        L2_3 = L21_2
        L0_3(L1_3, L2_3)
        L0_3 = getPlayerIdentifier
        L1_3 = L21_2
        L0_3 = L0_3(L1_3)
        L1_3 = svConfig
        L1_3 = L1_3.groupActivityCheck
        if L1_3 then
          L2_3 = A0_2
          L1_3 = L2_1
          L1_3 = L1_3[L2_3]
          if L1_3 then
            L2_3 = A0_2
            L1_3 = L2_1
            L1_3 = L1_3[L2_3]
            L1_3 = L1_3[L0_3]
            if L1_3 then
              goto lbl_29
            end
          end
          L1_3 = notifyPlayer
          L2_3 = L21_2
          L3_3 = translations
          L3_3 = L3_3.NOTIFICATION_GAME_NO_ACTIVITY
          L1_3(L2_3, L3_3)
          return
        end
        ::lbl_29::
        L1_3 = A2_2
        if L0_3 == L1_3 then
          L1_3 = L10_2
          L2_3 = L9_2
          L1_3 = L1_3 + L2_3
          if L1_3 then
            goto lbl_39
          end
        end
        L1_3 = L10_2
        ::lbl_39::
        L2_3 = givePlayerMoney
        L3_3 = L21_2
        L4_3 = L11_2
        L2_3(L3_3, L4_3)
        L2_3 = MySQL
        L2_3 = L2_3.update
        L2_3 = L2_3.await
        L3_3 = "UPDATE ra_boosting_user_settings SET crypto = crypto + ? WHERE player_identifier = ?"
        L4_3 = {}
        L5_3 = L1_3
        L6_3 = L0_3
        L4_3[1] = L5_3
        L4_3[2] = L6_3
        L2_3(L3_3, L4_3)
        L2_3 = notifyPlayer
        L3_3 = L21_2
        L4_3 = translations
        L4_3 = L4_3.NOTIFICATION_GAME_SUCCESSFUL_DELIVERY
        L5_3 = L4_3
        L4_3 = L4_3.format
        L6_3 = L11_2
        L7_3 = L1_3
        L8_3 = translations
        L8_3 = L8_3.GENERAL_CRYPTO
        L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
        L5_3 = G_NOTIFICATION_TYPE_SUCCESS
        L2_3(L3_3, L4_3, L5_3)
        L2_3 = svConfig
        L2_3 = L2_3.splitExperienceInGroups
        if not L2_3 then
          L2_3 = A2_2
          if L0_3 == L2_3 then
            L2_3 = MySQL
            L2_3 = L2_3.update
            L3_3 = "UPDATE ra_boosting_user_settings SET experience = experience + ? WHERE player_identifier = ?"
            L4_3 = {}
            L5_3 = A6_2
            L6_3 = A2_2
            L4_3[1] = L5_3
            L4_3[2] = L6_3
            L2_3(L3_3, L4_3)
          end
        else
          L2_3 = MySQL
          L2_3 = L2_3.update
          L3_3 = "UPDATE ra_boosting_user_settings SET experience = experience + ? WHERE player_identifier = ?"
          L4_3 = {}
          L5_3 = L15_2
          L6_3 = L0_3
          L4_3[1] = L5_3
          L4_3[2] = L6_3
          L2_3(L3_3, L4_3)
        end
      end
      L22_2(L23_2)
    end
  end
end
giveGroupPayout = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2 / 1000
  L2_2 = 1
  L1_2 = L2_2 - L1_2
  L2_2 = 0.2
  if L1_2 > L2_2 then
    L2_2 = math
    L2_2 = L2_2.ceil
    L3_2 = svConfig
    L3_2 = L3_2.maximumEngineDamagePenalty
    L3_2 = L1_2 * L3_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_19
    end
  end
  L2_2 = 0
  ::lbl_19::
  return L2_2
end
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A5_2 < 0 then
    A5_2 = 0
  end
  L6_2 = svConfig
  L6_2 = L6_2.penalizeForDamagedEngine
  if L6_2 then
    L6_2 = L4_1
    L7_2 = A5_2
    L6_2 = L6_2(L7_2)
    if L6_2 > 0 then
      A2_2 = A2_2 - L6_2
      L7_2 = notifyPlayer
      L8_2 = A0_2
      L9_2 = translations
      L9_2 = L9_2.NOTIFICATION_GAME_PENALIZED_DELIVERY
      L10_2 = L9_2
      L9_2 = L9_2.format
      L11_2 = L6_2
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = G_NOTIFICATION_TYPE_ERROR
      L7_2(L8_2, L9_2, L10_2)
    end
  end
  L6_2 = givePlayerMoney
  L7_2 = A0_2
  L8_2 = A2_2
  L6_2(L7_2, L8_2)
  L6_2 = MySQL
  L6_2 = L6_2.update
  L7_2 = "UPDATE ra_boosting_user_settings SET crypto = crypto + ? WHERE player_identifier = ?"
  L8_2 = {}
  L9_2 = A3_2
  L10_2 = A1_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = notifyPlayer
    L1_3 = A0_2
    L2_3 = translations
    L2_3 = L2_3.NOTIFICATION_GAME_SUCCESSFUL_DELIVERY
    L3_3 = L2_3
    L2_3 = L2_3.format
    L4_3 = A2_2
    L5_3 = A3_2
    L6_3 = translations
    L6_3 = L6_3.GENERAL_CRYPTO
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
    L3_3 = G_NOTIFICATION_TYPE_SUCCESS
    L0_3(L1_3, L2_3, L3_3)
  end
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = MySQL
  L6_2 = L6_2.update
  L7_2 = "UPDATE ra_boosting_user_settings SET experience = experience + ? WHERE player_identifier = ?"
  L8_2 = {}
  L9_2 = A4_2
  L10_2 = A1_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2(L7_2, L8_2)
end
giveSoloPayout = L5_1
L5_1 = RegisterNetEvent
L6_1 = "rahe-boosting:server:vehicleEntered"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    if nil ~= L3_2 then
      L3_2 = L0_1
      L3_2 = L3_2[L2_2]
      L4_2 = os
      L4_2 = L4_2.time
      L4_2 = L4_2()
      L3_2.currentTime = L4_2
      L4_2 = TriggerClientEvent
      L5_2 = "rahe-boosting:client:boostingVehicleEntered"
      L6_2 = L1_2
      L7_2 = L3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterServerEvent
L6_1 = "rahe-boosting:server:startVehicleTracking"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rahe-boosting:server:startVehicleTracking"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = Entity
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L2_2 = L2_2.boostingData
  L3_2 = getVehicleClassFromId
  L4_2 = L2_2.class
  L3_2 = L3_2(L4_2)
  L4_2 = L0_1
  L5_2 = {}
  L5_2.hacksCompleted = 0
  L6_2 = L3_2.gpsHacksRequired
  L5_2.hacksRequired = L6_2
  L5_2.lastHackCompletedAt = 0
  L5_2.locationLastSentAt = 0
  L5_2.locationInterval = 5
  L4_2[L1_2] = L5_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterServerEvent
L6_1 = "rahe-boosting:server:successfulGpsHack"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rahe-boosting:server:successfulGpsHack"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = source
  L3_2 = NetworkGetEntityFromNetworkId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L0_1
  L4_2 = L4_2[L3_2]
  L5_2 = L0_1
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.locationInterval
  L5_2 = L5_2 + A1_2
  L4_2.locationInterval = L5_2
  L4_2 = L0_1
  L4_2 = L4_2[L3_2]
  L5_2 = L0_1
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.hacksCompleted
  L5_2 = L5_2 + 1
  L4_2.hacksCompleted = L5_2
  L4_2 = L0_1
  L4_2 = L4_2[L3_2]
  L5_2 = os
  L5_2 = L5_2.time
  L5_2 = L5_2()
  L4_2.lastHackCompletedAt = L5_2
  L4_2 = L0_1
  L4_2 = L4_2[L3_2]
  L4_2 = L4_2.hacksCompleted
  L5_2 = L0_1
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.hacksRequired
  if L4_2 >= L5_2 then
    L4_2 = L0_1
    L4_2[L3_2] = nil
    L4_2 = notifyPlayer
    L5_2 = L2_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_GAME_GPS_STOPPED
    L7_2 = G_NOTIFICATION_TYPE_SUCCESS
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = TriggerClientEvent
    L5_2 = "rahe-boosting:client:stopVehicleTracking"
    L6_2 = -1
    L7_2 = NetworkGetNetworkIdFromEntity
    L8_2 = L3_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  else
    L4_2 = TriggerClientEvent
    L5_2 = "rahe-boosting:client:successfulGpsHack"
    L6_2 = L2_2
    L7_2 = L0_1
    L7_2 = L7_2[L3_2]
    L7_2 = L7_2.hacksCompleted
    L8_2 = L0_1
    L8_2 = L8_2[L3_2]
    L8_2 = L8_2.hacksRequired
    L9_2 = A1_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterServerEvent
L6_1 = "rahe-boosting:server:unsuccessfulGpsHack"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rahe-boosting:server:unsuccessfulGpsHack"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2[L1_2]
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L2_2.lastHackCompletedAt = L3_2
  end
end
L5_1(L6_1, L7_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetEntityCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:receiveTrackingPosition"
  L4_2 = -1
  L5_2 = L1_2
  L6_2 = NetworkGetNetworkIdFromEntity
  L7_2 = A0_2
  L6_2, L7_2 = L6_2(L7_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
alertPoliceLocation = L5_1
