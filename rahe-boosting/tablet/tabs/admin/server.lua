local L0_1, L1_1, L2_1, L3_1
L0_1 = "admin"
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:tabDataRequested"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:server:tabDataRequested"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = L0_1
  if A0_2 == L2_2 then
    L2_2 = loadAdminTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = {}
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:tabDataReceived"
  L4_2 = A0_2
  L5_2 = L0_1
  L6_2 = L1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
loadAdminTabData = L1_1
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:startGenerator"
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = source
  L1_2 = getPlayerIdentifier
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = isPlayerSuperUser
  L3_2 = L1_2
  L4_2 = L0_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return
  end
  L2_2 = generateContracts
  L3_2 = true
  L2_2(L3_2)
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:infoNotification"
  L4_2 = L0_2
  L5_2 = translations
  L5_2 = L5_2.NOTIFICATION_TABLET_INFO_ADMIN_GENERATED
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = playersInQueue
  L7_2 = #L7_2
  L8_2 = playersInQueue
  L8_2 = #L8_2
  if 1 == L8_2 then
    L8_2 = translations
    L8_2 = L8_2.GENERAL_PERSON_SINGULAR
    if L8_2 then
      goto lbl_33
    end
  end
  L8_2 = translations
  L8_2 = L8_2.GENERAL_PERSON_PLURAL
  ::lbl_33::
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = 5000
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:generateContract"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = isPlayerSuperUser
  L5_2 = L3_2
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    return
  end
  if not A0_2 or "" == A0_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "rahe-boosting:client:errorNotification"
    L6_2 = L2_2
    L7_2 = translations
    L8_2 = "NOTIFICATION_TABLET_ERROR_ADMIN_CONTRACT_IDENTIFIER_MISSING"
    L7_2 = L7_2[L8_2]
    L8_2 = 5000
    L4_2(L5_2, L6_2, L7_2, L8_2)
    return
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L5_2 = "SELECT 1 FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L6_2 = {}
  L7_2 = A0_2
  L6_2[1] = L7_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    if not A0_3 then
      L1_3 = TriggerClientEvent
      L2_3 = "rahe-boosting:client:errorNotification"
      L3_3 = L2_2
      L4_3 = translations
      L5_3 = "NOTIFICATION_TABLET_ERROR_ADMIN_IDENTIFIER_INVALID"
      L4_3 = L4_3[L5_3]
      L5_3 = 5000
      L1_3(L2_3, L3_3, L4_3, L5_3)
      return
    end
    L1_3 = getClassContractForPlayer
    L2_3 = A0_2
    L3_3 = getVehicleClassFromId
    L4_3 = A1_2
    L3_3 = L3_3(L4_3)
    L4_3 = false
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L2_3 = insertContracts
    L3_3 = {}
    L4_3 = L1_3
    L3_3[1] = L4_3
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = TriggerClientEvent
    L3_3 = "rahe-boosting:client:infoNotification"
    L4_3 = L2_2
    L5_3 = translations
    L6_3 = "NOTIFICATION_TABLET_INFO_ADMIN_CONTRACT_GIVEN"
    L5_3 = L5_3[L6_3]
    L6_3 = L5_3
    L5_3 = L5_3.format
    L7_3 = A0_2
    L8_3 = A1_2
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L6_3 = 5000
    L2_3(L3_3, L4_3, L5_3, L6_3)
  end
  L4_2(L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ipairs
  L2_2 = svConfig
  L2_2 = L2_2.vehicleClasses
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.class
    if L7_2 == A0_2 then
      return L6_2
    end
  end
end
getVehicleClassFromId = L1_1
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:loadPlayerData"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = isPlayerSuperUser
  L4_2 = L2_2
  L5_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    return
  end
  if not A0_2 or "" == A0_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "rahe-boosting:client:errorNotification"
    L5_2 = L1_2
    L6_2 = translations
    L7_2 = "NOTIFICATION_TABLET_ERROR_ADMIN_DATA_IDENTIFIER_MISSING"
    L6_2 = L6_2[L7_2]
    L7_2 = 5000
    L3_2(L4_2, L5_2, L6_2, L7_2)
    return
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L4_2 = "SELECT alias, experience, crypto FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    if not A0_3 then
      L1_3 = TriggerClientEvent
      L2_3 = "rahe-boosting:client:errorNotification"
      L3_3 = L1_2
      L4_3 = translations
      L5_3 = "NOTIFICATION_TABLET_ERROR_ADMIN_IDENTIFIER_INVALID"
      L4_3 = L4_3[L5_3]
      L5_3 = 5000
      L1_3(L2_3, L3_3, L4_3, L5_3)
      return
    end
    L1_3 = TriggerClientEvent
    L2_3 = "rahe-boosting:client:tabDataReceived"
    L3_3 = L1_2
    L4_3 = L0_1
    L5_3 = {}
    L5_3.loadedPlayerData = A0_3
    L1_3(L2_3, L3_3, L4_3, L5_3)
    L1_3 = TriggerClientEvent
    L2_3 = "rahe-boosting:client:infoNotification"
    L3_3 = L1_2
    L4_3 = translations
    L5_3 = "NOTIFICATION_TABLET_INFO_ADMIN_DATA_LOADED"
    L4_3 = L4_3[L5_3]
    L5_3 = L4_3
    L4_3 = L4_3.format
    L6_3 = A0_2
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = 5000
    L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  L3_2(L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:savePlayerData"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = source
  L4_2 = getPlayerIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = isPlayerSuperUser
  L6_2 = L4_2
  L7_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    return
  end
  if not A0_2 or "" == A0_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "rahe-boosting:client:errorNotification"
    L7_2 = L3_2
    L8_2 = translations
    L9_2 = "NOTIFICATION_TABLET_ERROR_ADMIN_DATA_IDENTIFIER_MISSING"
    L8_2 = L8_2[L9_2]
    L9_2 = 5000
    L5_2(L6_2, L7_2, L8_2, L9_2)
    return
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L6_2 = "UPDATE ra_boosting_user_settings SET experience = ?, crypto = ? WHERE player_identifier = ?"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A1_2
  L10_2 = A0_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = TriggerClientEvent
    L2_3 = "rahe-boosting:client:infoNotification"
    L3_3 = L3_2
    L4_3 = translations
    L5_3 = "NOTIFICATION_TABLET_INFO_ADMIN_DATA_SAVED"
    L4_3 = L4_3[L5_3]
    L5_3 = L4_3
    L4_3 = L4_3.format
    L6_3 = A0_2
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = 5000
    L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  L5_2(L6_2, L7_2, L8_2)
end
L1_1(L2_1, L3_1)
