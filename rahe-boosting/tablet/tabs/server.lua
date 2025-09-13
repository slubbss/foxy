local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.versionCheck
L1_1 = "edwardexo/rahe-boosting-version"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "rahe-boosting:server:loadInitialData"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = getPlayerIdentifier
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = createProfileIfNeeded
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = generateInitialContractsIfNeeded
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = checkForAbortedContract
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = updateSharedData
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = updateInitialData
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = loadHomeTabData
  L3_2 = L0_2
  L2_2(L3_2)
  L2_2 = loadLeaderboardTabData
  L3_2 = L0_2
  L2_2(L3_2)
  L2_2 = loadProfileTabData
  L3_2 = L0_2
  L2_2(L3_2)
  L2_2 = loadStoreTabData
  L3_2 = L0_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "rahe-boosting:server:tabDataRequested"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = updateSharedData
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = source
  L2_2, L3_2 = L2_2(L3_2)
  L0_2(L1_2, L2_2, L3_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = MySQL
  L2_2 = L2_2.single
  L2_2 = L2_2.await
  L3_2 = "SELECT player_identifier AS identifier, experience, crypto FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:sharedDataReceived"
  L5_2 = A0_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
updateSharedData = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = {}
  L3_2 = svConfig
  L3_2 = L3_2.currencyLocale
  L2_2.currencyLocale = L3_2
  L3_2 = svConfig
  L3_2 = L3_2.currency
  L2_2.currency = L3_2
  L3_2 = isPlayerSuperUser
  L4_2 = A1_2
  L5_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2)
  L2_2.isAdminPanelAllowed = L3_2
  L3_2 = svConfig
  L3_2 = L3_2.vehicleClasses
  L2_2.vehicleClasses = L3_2
  L3_2 = svConfig
  L3_2 = L3_2.recommendedUploadWebsite
  L2_2.recommendedUploadWebsite = L3_2
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:initialDataReceived"
  L5_2 = A0_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
updateInitialData = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:newActiveTab"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
setPlayerActiveTab = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = getPlayerRacingAlias
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "-" ~= L2_2 then
    return
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "INSERT INTO ra_boosting_user_settings (player_identifier, alias) VALUES (?, ?)"
  L4_2 = {}
  L5_2 = A1_2
  L6_2 = translations
  L6_2 = L6_2.TEXT_PROFILE_DEFAULT_NAME
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = math
  L8_2 = L8_2.random
  L9_2 = 10000
  L10_2 = 99999
  L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L2_2(L3_2, L4_2)
end
createProfileIfNeeded = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getPlayerIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT alias FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = L1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = next
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = "-"
    return L3_2
  end
  L3_2 = L2_2[1]
  L3_2 = L3_2.alias
  return L3_2
end
getPlayerRacingAlias = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT player_identifier AS identifier, alias, experience, crypto, profile_picture FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getPlayerSharedData = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = getPlayerActiveContract
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = lastStartedContractsByPlayer
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    return
  end
  L4_2 = TriggerClientEvent
  L5_2 = "rahe-boosting:client:startContract"
  L6_2 = A0_2
  L7_2 = L3_2
  L8_2 = false
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
checkForAbortedContract = L0_1
function L0_1(A0_2, A1_2)
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
DumpTable = L0_1
