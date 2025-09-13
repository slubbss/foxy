local L0_1, L1_1, L2_1, L3_1
L0_1 = "profile"
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
    L2_2 = loadProfileTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getProfileData
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = L1_2.alias
  L2_2.name = L3_2
  L3_2 = L1_2.profile_picture
  L2_2.picture = L3_2
  L3_2 = L1_2.created_at
  L2_2.date = L3_2
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:tabDataReceived"
  L5_2 = A0_2
  L6_2 = L0_1
  L7_2 = L2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
loadProfileTabData = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT alias, profile_picture, DATE_FORMAT(created_at, '%d.%m.%Y') AS created_at FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L3_2 = {}
  L4_2 = getPlayerIdentifier
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2[1]
  return L1_2
end
getProfileData = L1_1
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:nameChanged"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:server:nameChanged"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = #A0_2
  if not (L2_2 < 3) then
    L2_2 = #A0_2
    if not (L2_2 > 20) then
      goto lbl_16
    end
  end
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:errorNotification"
  L4_2 = L1_2
  L5_2 = translations
  L5_2 = L5_2.NOTIFICATION_TABLET_ERROR_NAME_LENGTH
  L6_2 = 5000
  L2_2(L3_2, L4_2, L5_2, L6_2)
  do return end
  ::lbl_16::
  L2_2 = MySQL
  L2_2 = L2_2.query
  L3_2 = "UPDATE ra_boosting_user_settings SET alias = ? WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = getPlayerIdentifier
  L7_2 = L1_2
  L6_2, L7_2 = L6_2(L7_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerClientEvent
    L1_3 = "rahe-boosting:client:infoNotification"
    L2_3 = L1_2
    L3_3 = translations
    L3_3 = L3_3.NOTIFICATION_TABLET_INFO_NAME_CHANGED
    L4_3 = 5000
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:server:pictureChanged"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:server:pictureChanged"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = isPictureUrlValid
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "rahe-boosting:client:errorNotification"
    L4_2 = L1_2
    L5_2 = translations
    L5_2 = L5_2.NOTIFICATION_TABLET_ERROR_PICTURE_FORMAT
    L6_2 = 5000
    L2_2(L3_2, L4_2, L5_2, L6_2)
    return
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L3_2 = "UPDATE ra_boosting_user_settings SET profile_picture = ? WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = getPlayerIdentifier
  L7_2 = L1_2
  L6_2, L7_2 = L6_2(L7_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerClientEvent
    L1_3 = "rahe-boosting:client:infoNotification"
    L2_3 = L1_2
    L3_3 = translations
    L3_3 = L3_3.NOTIFICATION_TABLET_INFO_PICTURE_CHANGED
    L4_3 = 5000
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
