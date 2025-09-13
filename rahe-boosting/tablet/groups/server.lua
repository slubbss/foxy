local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = 4
L2_1 = 15
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "rahe-boosting:server:requestJoinGroup"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = getPlayerIdentifier
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = isGroupJoinRequestValid
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = addPlayerToGroup
  L4_2 = A1_2
  L5_2 = A0_2
  L6_2 = L2_2
  L7_2 = "MEMBER"
  L8_2 = "REQUEST"
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = true
  return L3_2
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L0_1
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L4_2 = notifyPlayerTablet
    L5_2 = A0_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_TABLET_GROUP_NO_GROUP_FOUND
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.participants
  L4_2 = #L4_2
  L5_2 = L1_1
  if L4_2 >= L5_2 then
    L4_2 = notifyPlayerTablet
    L5_2 = A0_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_TABLET_GROUP_FULL
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.status
  if "WAITING" ~= L4_2 then
    L4_2 = notifyPlayerTablet
    L5_2 = A0_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_TABLET_GROUP_CANT_JOIN
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = getPlayerGroup
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = notifyPlayerTablet
    L6_2 = A0_2
    L7_2 = translations
    L7_2 = L7_2.NOTIFICATION_TABLET_GROUP_OTHER_ACTIVE
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = true
  return L5_2
end
isGroupJoinRequestValid = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = isPlayerGroupParticipant
    L8_2 = A0_2
    L9_2 = L6_2.participants
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      return L5_2
    end
  end
  L1_2 = nil
  return L1_2
end
getPlayerGroup = L3_1
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.identifier
    if L8_2 == A0_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
isPlayerGroupParticipant = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.participants
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = GetPlayerPing
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    if 0 ~= L8_2 then
      L8_2 = loadHomeTabData
      L9_2 = L7_2.id
      L8_2(L9_2)
    end
  end
end
syncGroupData = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = loadHomeTabData
  L2_2 = A0_2
  L1_2(L2_2)
end
syncPlayerData = L3_1
L3_1 = RegisterNetEvent
L4_1 = "changeContractGroupType"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = canPlayerChangeGroup
  L5_2 = A0_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    return
  end
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = startGroupContract
    L5_2 = L2_2
    L6_2 = L3_2
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  else
    L4_2 = endGroupContract
    L5_2 = L2_2
    L6_2 = L3_2
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = createGroup
  L4_2 = A2_2
  L5_2 = A0_2
  L6_2 = A1_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:infoNotification"
  L5_2 = A0_2
  L6_2 = translations
  L6_2 = L6_2.NOTIFICATION_TABLET_GROUP_MADE_PUBLIC
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = A2_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = 8000
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
startGroupContract = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = destroyGroup
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:infoNotification"
  L5_2 = A0_2
  L6_2 = translations
  L6_2 = L6_2.NOTIFICATION_TABLET_GROUP_MADE_PRIVATE
  L7_2 = 5000
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
endGroupContract = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = L0_1
  L4_2 = {}
  L4_2.ownerIdentifier = A2_2
  L5_2 = getOwnedContract
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L4_2.contract = L5_2
  L4_2.status = "WAITING"
  L5_2 = {}
  L4_2.participants = L5_2
  L3_2[A0_2] = L4_2
  L3_2 = addPlayerToGroup
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  L7_2 = "OWNER"
  L8_2 = "JOINED"
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = syncGroupData
  L4_2 = A0_2
  L3_2(L4_2)
end
createGroup = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2.participants
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = table
    L9_2 = L9_2.insert
    L10_2 = L2_2
    L11_2 = L8_2.id
    L9_2(L10_2, L11_2)
  end
  L3_2 = L0_1
  L3_2[A0_2] = nil
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = loadHomeTabData
    L10_2 = L8_2
    L9_2(L10_2)
  end
end
destroyGroup = L3_1
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:requestResponse"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = getPlayerIdentifier
  L4_2 = source
  L3_2 = L3_2(L4_2)
  L4_2 = canPlayerChangeGroup
  L5_2 = A0_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    return
  end
  if A2_2 then
    L4_2 = changePlayerGroupStatus
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = "JOINED"
    L4_2(L5_2, L6_2, L7_2)
  else
    L4_2 = removePlayerFromGroup
    L5_2 = A0_2
    L6_2 = A1_2
    L4_2(L5_2, L6_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:kickParticipant"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = getPlayerIdentifier
  L3_2 = source
  L2_2 = L2_2(L3_2)
  L3_2 = canPlayerChangeGroup
  L4_2 = A0_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    return
  end
  L3_2 = removePlayerFromGroup
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = getContractDbData
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.owner_identifier
  if A1_2 == L3_2 then
    L3_2 = L2_2.status
    if "BOUGHT" == L3_2 then
      goto lbl_12
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_12::
  L3_2 = true
  return L3_2
end
canPlayerChangeGroup = L3_1
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = getPlayerSharedData
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L6_2 = {}
  L6_2.id = A1_2
  L6_2.identifier = A2_2
  L6_2.status = A4_2
  L6_2.role = A3_2
  L7_2 = os
  L7_2 = L7_2.time
  L7_2 = L7_2()
  L6_2.joinTime = L7_2
  L7_2 = L5_2.alias
  L6_2.name = L7_2
  L7_2 = L5_2.profile_picture
  L6_2.pictureUrl = L7_2
  L7_2 = getPlayerGroup
  L8_2 = A2_2
  L7_2 = L7_2(L8_2)
  if L7_2 then
    return
  end
  L7_2 = table
  L7_2 = L7_2.insert
  L8_2 = L0_1
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.participants
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = notifyPlayerTablet
  L8_2 = A1_2
  L9_2 = translations
  L9_2 = L9_2.NOTIFICATION_TABLET_GROUP_ADDED
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = A0_2
  L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = syncGroupData
  L8_2 = A0_2
  L7_2(L8_2)
  if "REQUEST" == A4_2 then
    L7_2 = checkForRequestExpiration
    L8_2 = A0_2
    L9_2 = A2_2
    L7_2(L8_2, L9_2)
  end
end
addPlayerToGroup = L3_1
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.participants
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.identifier
    if L9_2 == A1_2 then
      L9_2 = table
      L9_2 = L9_2.remove
      L10_2 = L0_1
      L10_2 = L10_2[A0_2]
      L10_2 = L10_2.participants
      L11_2 = L7_2
      L9_2(L10_2, L11_2)
      L9_2 = syncPlayerData
      L10_2 = L8_2.id
      L9_2(L10_2)
      L9_2 = notifyPlayerTablet
      L10_2 = L8_2.id
      L11_2 = translations
      L11_2 = L11_2.NOTIFICATION_TABLET_GROUP_REMOVED
      L12_2 = L11_2
      L11_2 = L11_2.format
      L13_2 = A0_2
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = syncGroupData
      L10_2 = A0_2
      L9_2(L10_2)
      return
    end
  end
end
removePlayerFromGroup = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.participants
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.identifier
    if L10_2 == A1_2 then
      L9_2.status = A2_2
      L10_2 = notifyPlayerTablet
      L11_2 = L9_2.id
      L12_2 = translations
      L12_2 = L12_2.NOTIFICATION_TABLET_GROUP_ACCEPTED
      L13_2 = L12_2
      L12_2 = L12_2.format
      L14_2 = A0_2
      L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)
      L10_2(L11_2, L12_2, L13_2, L14_2)
      L10_2 = syncGroupData
      L11_2 = A0_2
      L10_2(L11_2)
      return
    end
  end
end
changePlayerGroupStatus = L3_1
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L2_2 = L0_1
    L2_2 = L2_2[A0_2]
    if not L2_2 then
      return
    end
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
    L3_2 = ipairs
    L4_2 = L0_1
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.participants
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.identifier
      if L9_2 ~= A1_2 then
      else
        L9_2 = L8_2.status
        if "JOINED" == L9_2 then
          return
        end
        L9_2 = L8_2.joinTime
        L9_2 = L2_2 - L9_2
        L10_2 = L2_1
        if L9_2 > L10_2 then
          L9_2 = removePlayerFromGroup
          L10_2 = A0_2
          L11_2 = A1_2
          L9_2(L10_2, L11_2)
          return
        end
      end
    end
    L3_2 = Wait
    L4_2 = 1000
    L3_2(L4_2)
  end
end
checkForRequestExpiration = L3_1
function L3_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.contract
  L1_2 = L1_2.vehicleSpawned
  return L1_2
end
isGroupVehicleSpawned = L3_1
function L3_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.contract
  L1_2.vehicleSpawned = true
end
setGroupVehicleAsSpawned = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.participants
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = L7_2.id
    L8_2(L9_2, L10_2)
  end
  return L1_2
end
getGroupPlayerIds = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.participants
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.identifier
    L1_2[L8_2] = true
  end
  return L1_2
end
getGroupPlayerIdentifiers = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L2_2 = L1_2.contract
  L2_2.status = "IN_PROGRESS"
  L1_2.status = "STARTED"
end
setGroupContractAsStarted = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = syncGroupData
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L0_1
  L1_2[A0_2] = nil
end
removeGroupContract = L3_1
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.participants
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = TriggerClientEvent
    L10_2 = "rahe-boosting:client:startContract"
    L11_2 = L8_2.id
    L12_2 = A1_2
    L13_2 = true
    L9_2(L10_2, L11_2, L12_2, L13_2)
  end
end
sendGroupContract = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = getPlayerGroupId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  return L2_2
end
getGroupDataForPlayer = L3_1
function L3_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L1_2 = nil ~= L1_2
  return L1_2
end
contractHasGroup = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ipairs
    L8_2 = L6_2.participants
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.identifier
      if L13_2 == A0_2 then
        return L5_2
      end
    end
  end
  L1_2 = nil
  return L1_2
end
getPlayerGroupId = L3_1
