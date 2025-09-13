local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = "home"
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
    L2_2 = loadHomeTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getPlayerBoostingData
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = L1_2.ownedContract
  if L3_2 then
    L3_2 = L1_2.ownedContract
    if L3_2 then
      goto lbl_13
    end
  end
  L3_2 = ""
  ::lbl_13::
  L2_2.ownedContract = L3_2
  L3_2 = L1_2.availableContracts
  L2_2.availableContracts = L3_2
  L3_2 = getPlayerLevelPercentage
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2.levelPercentage = L3_2
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:tabDataReceived"
  L5_2 = A0_2
  L6_2 = L0_1
  L7_2 = L2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
loadHomeTabData = L1_1
L1_1 = {}
L2_1 = {}
lastStartedContractsByPlayer = L2_1
playersInQueue = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2
  while true do
    L0_2 = Wait
    L1_2 = svConfig
    L1_2 = L1_2.minutesBetweenGenerations
    L1_2 = 60000 * L1_2
    L0_2(L1_2)
    L0_2 = generateContracts
    L1_2 = false
    L0_2(L1_2)
  end
end
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "playerDropped"
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = removePlayerFromQueue
  L2_2 = source
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getOnDutyPoliceAmount
  L1_2 = L1_2()
  L2_2 = infoPrint
  L3_2 = "Starting the ^3contract generator^0 (^3%s^0 trigger). There are currently ^3%d^0 police online (^3%d^0 is required for ^3isImportant^0 classes to generate)."
  L4_2 = L3_2
  L3_2 = L3_2.format
  if A0_2 then
    L5_2 = "manual"
    if L5_2 then
      goto lbl_12
    end
  end
  L5_2 = "automatic"
  ::lbl_12::
  L6_2 = L1_2
  L7_2 = svConfig
  L7_2 = L7_2.requiredPoliceAmount
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = "SELECT * FROM ra_boosting_contracts WHERE owner_identifier IN (?) AND (status IN('AVAILABLE', 'BOUGHT', 'IN_PROGRESS', 'IN_PROGRESS_VIN'))"
  L3_2 = {}
  L4_2 = playersInQueue
  if L4_2 then
    L4_2 = next
    L5_2 = playersInQueue
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = MySQL
      L4_2 = L4_2.query
      L5_2 = L2_2
      L6_2 = {}
      L7_2 = playersInQueue
      L6_2[1] = L7_2
      function L7_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3
        L1_3 = "SELECT player_identifier, experience FROM ra_boosting_user_settings WHERE player_identifier IN (?)"
        L2_2 = L1_3
        L1_3 = MySQL
        L1_3 = L1_3.query
        L2_3 = L2_2
        L3_3 = {}
        L4_3 = playersInQueue
        L3_3[1] = L4_3
        function L4_3(A0_4)
          local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4
          if not A0_4 then
            L1_4 = {}
            A0_4 = L1_4
          end
          L1_4 = {}
          L2_4 = getContractsSortedByCharacter
          L3_4 = A0_3
          L2_4 = L2_4(L3_4)
          L3_4 = ipairs
          L4_4 = playersInQueue
          L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)
          for L7_4, L8_4 in L3_4, L4_4, L5_4, L6_4 do
            L9_4 = L3_2
            L9_4 = L9_4[L8_4]
            if not L9_4 then
              L9_4 = getContractsForPlayer
              L10_4 = L8_4
              L11_4 = L2_4[L8_4]
              L12_4 = getPlayerBoostingExperience
              L13_4 = L8_4
              L14_4 = A0_4
              L12_4 = L12_4(L13_4, L14_4)
              L13_4 = L1_2
              L9_4 = L9_4(L10_4, L11_4, L12_4, L13_4)
              L10_4 = next
              L11_4 = L9_4
              L10_4 = L10_4(L11_4)
              if L10_4 then
                L10_4 = ipairs
                L11_4 = L9_4
                L10_4, L11_4, L12_4, L13_4 = L10_4(L11_4)
                for L14_4, L15_4 in L10_4, L11_4, L12_4, L13_4 do
                  L16_4 = table
                  L16_4 = L16_4.insert
                  L17_4 = L1_4
                  L18_4 = L15_4
                  L16_4(L17_4, L18_4)
                end
              end
              L10_4 = L3_2
              L10_4[L8_4] = true
            end
          end
          L3_4 = insertContracts
          L4_4 = L1_4
          L5_4 = true
          L3_4(L4_4, L5_4)
        end
        L1_3(L2_3, L3_3, L4_3)
      end
      L4_2(L5_2, L6_2, L7_2)
  end
  else
    L4_2 = infoPrint
    L5_2 = "The ^3contract generator^0 stopped as there are no players in the queue."
    L4_2(L5_2)
  end
end
generateContracts = L5_1
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = {}
  L5_2 = os
  L5_2 = L5_2.time
  L5_2 = L5_2()
  L6_2 = pairs
  L7_2 = svConfig
  L7_2 = L7_2.vehicleClasses
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.timeBetweenGenerations
    if 0 ~= L12_2 then
      L13_2 = L11_2.class
      L12_2 = L1_1
      L12_2 = L12_2[L13_2]
      if L12_2 then
        L13_2 = L11_2.class
        L12_2 = L1_1
        L12_2 = L12_2[L13_2]
        L12_2 = L5_2 - L12_2
        L13_2 = L11_2.timeBetweenGenerations
        L13_2 = L13_2 * 60
        if L12_2 < L13_2 then
      end
    end
    else
      L12_2 = L11_2.isImportant
      if L12_2 then
        L12_2 = svConfig
        L12_2 = L12_2.requiredPoliceAmount
        if A3_2 < L12_2 then
      end
      else
        L12_2 = L11_2.maxContractsPerSession
        if 0 ~= L12_2 then
          L12_2 = L2_1
          L12_2 = L12_2[A0_2]
          if nil ~= L12_2 then
            L12_2 = L2_1
            L12_2 = L12_2[A0_2]
            L13_2 = L11_2.class
            L12_2 = L12_2[L13_2]
            if nil ~= L12_2 then
              L12_2 = L2_1
              L12_2 = L12_2[A0_2]
              L13_2 = L11_2.class
              L12_2 = L12_2[L13_2]
              L13_2 = L11_2.maxContractsPerSession
              if L12_2 >= L13_2 then
            end
          end
        end
        else
          L12_2 = L11_2.xpRequired
          if A2_2 < L12_2 then
          else
            L12_2 = getContractTypeAmount
            L13_2 = A1_2
            L14_2 = L11_2.class
            L12_2 = L12_2(L13_2, L14_2)
            L13_2 = L11_2.maxContractsOfType
            if L12_2 >= L13_2 then
            else
              L13_2 = getClassContractForPlayer
              L14_2 = A0_2
              L15_2 = L11_2
              L16_2 = true
              L13_2 = L13_2(L14_2, L15_2, L16_2)
              if L13_2 then
                L14_2 = table
                L14_2 = L14_2.insert
                L15_2 = L4_2
                L16_2 = L13_2
                L14_2(L15_2, L16_2)
              end
            end
          end
        end
      end
    end
  end
  return L4_2
end
getContractsForPlayer = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A2_2 then
    L3_2 = math
    L3_2 = L3_2.random
    L4_2 = 1
    L5_2 = 100
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = A1_2.generationPercentage
    if L3_2 > L4_2 then
      L3_2 = nil
      return L3_2
    end
  end
  L4_2 = A1_2.class
  L3_2 = L1_1
  L5_2 = os
  L5_2 = L5_2.time
  L5_2 = L5_2()
  L3_2[L4_2] = L5_2
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = L2_1
    L4_2 = {}
    L3_2[A0_2] = L4_2
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L4_2 = A1_2.class
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[A0_2]
    L4_2 = A1_2.class
    L3_2[L4_2] = 0
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L4_2 = A1_2.class
  L5_2 = L2_1
  L5_2 = L5_2[A0_2]
  L6_2 = A1_2.class
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2 + 1
  L3_2[L4_2] = L5_2
  L3_2 = getRandomVehicleForClass
  L4_2 = A1_2.class
  L3_2 = L3_2(L4_2)
  L4_2 = generateContractForPlayer
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = A1_2.isImportant
  if L5_2 then
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = 60
    L7_2 = 90
    L5_2 = L5_2(L6_2, L7_2)
    L4_2.expirationMinutes = L5_2
  end
  return L4_2
end
getClassContractForPlayer = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = nil
  L2_2 = svConfig
  L2_2 = L2_2.isBls
  if L2_2 then
    L2_2 = exports
    L2_2 = L2_2.veh_shop
    L3_2 = L2_2
    L2_2 = L2_2.getVehicleList
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L1_2 = supportedVehicles
  end
  L2_2 = {}
  L3_2 = svConfig
  L3_2 = L3_2.isBls
  if L3_2 then
    L3_2 = ipairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.class
      if L9_2 == A0_2 then
        L9_2 = L8_2.type
        if "CAR" == L9_2 then
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = L8_2
          L9_2(L10_2, L11_2)
        end
      end
    end
  else
    L3_2 = ipairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.class
      if L9_2 == A0_2 then
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = L2_2
        L11_2 = L8_2
        L9_2(L10_2, L11_2)
      end
    end
  end
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = #L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L2_2[L3_2]
  return L3_2
end
getRandomVehicleForClass = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = 0
  if nil == A0_2 then
    L3_2 = 0
    return L3_2
  end
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.vehicle_class
    if L9_2 == A1_2 then
      L2_2 = L2_2 + 1
    end
  end
  return L2_2
end
getContractTypeAmount = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.player_identifier
    if L8_2 == A0_2 then
      L8_2 = L7_2.experience
      return L8_2
    end
  end
  L2_2 = 0
  return L2_2
end
getPlayerBoostingExperience = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.owner_identifier
    L8_2 = L1_2[L8_2]
    if not L8_2 then
      L8_2 = L7_2.owner_identifier
      L9_2 = {}
      L1_2[L8_2] = L9_2
    end
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L7_2.owner_identifier
    L9_2 = L1_2[L9_2]
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  return L1_2
end
getContractsSortedByCharacter = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getPlayerIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT id FROM ra_boosting_contracts WHERE owner_identifier = ? AND CURRENT_TIMESTAMP() > expiration_date AND status != 'COMPLETED'"
  L4_2 = {}
  L5_2 = L1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = next
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = MySQL
    L3_2 = L3_2.query
    L3_2 = L3_2.await
    L4_2 = "DELETE FROM ra_boosting_contracts WHERE owner_identifier = ? AND CURRENT_TIMESTAMP() > expiration_date AND status != 'COMPLETED'"
    L5_2 = {}
    L6_2 = L1_2
    L5_2[1] = L6_2
    L3_2(L4_2, L5_2)
    L3_2 = ipairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = removeGroupContract
      L10_2 = L8_2.id
      L9_2(L10_2)
    end
  end
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "SELECT bc.*, TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date) AS hours_to, TIMESTAMPDIFF(MINUTE, CURRENT_TIMESTAMP(), bc.expiration_date) - (60 * TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date)) AS minutes_to FROM ra_boosting_contracts bc WHERE status = 'AVAILABLE' AND owner_identifier = ? ORDER BY expiration_date ASC"
  L5_2 = {}
  L6_2 = L1_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = getGroupDataForPlayer
  L5_2 = L1_2
  L4_2, L5_2 = L4_2(L5_2)
  if L4_2 then
    L6_2 = getGroupOwnedContract
    L7_2 = L4_2.contract
    L7_2 = L7_2.id
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
    if not L5_2 then
      goto lbl_111
    end
    L6_2 = L5_2.hours_to
    if not (L6_2 < 0) then
      L6_2 = L5_2.minutes_to
      if not (L6_2 < 0) then
        goto lbl_78
      end
    end
    L6_2 = MySQL
    L6_2 = L6_2.query
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM ra_boosting_contracts WHERE id = ?"
    L8_2 = {}
    L9_2 = L5_2.id
    L8_2[1] = L9_2
    L6_2(L7_2, L8_2)
    L6_2 = removeGroupContract
    L7_2 = L5_2.id
    L6_2(L7_2)
    L5_2 = nil
    goto lbl_111
    ::lbl_78::
    L6_2 = getVehicleClassFromId
    L7_2 = L5_2.vehicle_class
    L6_2 = L6_2(L7_2)
    L7_2 = {}
    L8_2 = L4_2.ownerIdentifier
    L8_2 = L8_2 == L1_2
    L7_2.isPlayerOwner = L8_2
    L8_2 = svConfig
    L8_2 = L8_2.splitExperienceInGroups
    if L8_2 then
      L8_2 = L6_2.bonusExperienceMultiplier
      L8_2 = L8_2 > 1
    end
    L7_2.bonusAvailable = L8_2
    L8_2 = L6_2.bonusExperienceMinimumMembers
    L7_2.bonusMinimumMembers = L8_2
    L8_2 = L6_2.bonusExperienceMultiplier
    L7_2.bonusMultiplier = L8_2
    L8_2 = L4_2.participants
    L7_2.participants = L8_2
    L5_2.groupData = L7_2
  else
    L6_2 = getOwnedContract
    L7_2 = L1_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
  end
  ::lbl_111::
  if not L5_2 or not L5_2 then
    L5_2 = ""
  end
  L6_2 = {}
  L6_2.availableContracts = L3_2
  L6_2.ownedContract = L5_2
  return L6_2
end
getPlayerBoostingData = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT bc.*, TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date) AS hours_to, TIMESTAMPDIFF(MINUTE, CURRENT_TIMESTAMP(), bc.expiration_date) - (60 * TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date)) AS minutes_to FROM ra_boosting_contracts bc WHERE (status = 'IN_PROGRESS' OR status = 'BOUGHT' OR status = 'IN_PROGRESS_VIN') AND id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getGroupOwnedContract = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT bc.*, TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date) AS hours_to, TIMESTAMPDIFF(MINUTE, CURRENT_TIMESTAMP(), bc.expiration_date) - (60 * TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), bc.expiration_date)) AS minutes_to FROM ra_boosting_contracts bc WHERE (status = 'IN_PROGRESS' OR status = 'BOUGHT' OR status = 'IN_PROGRESS_VIN') AND owner_identifier = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getOwnedContract = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = getPlayerIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = MySQL
  L2_2 = L2_2.single
  L2_2 = L2_2.await
  L3_2 = "SELECT experience FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = L1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2.experience
  L4_2 = ipairs
  L5_2 = svConfig
  L5_2 = L5_2.vehicleClasses
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.xpRequired
    if L3_2 >= L10_2 then
      if 1 == L8_2 then
        L10_2 = 100
        return L10_2
      end
      L10_2 = svConfig
      L10_2 = L10_2.vehicleClasses
      L11_2 = L8_2 - 1
      L10_2 = L10_2[L11_2]
      L11_2 = math
      L11_2 = L11_2.floor
      L12_2 = L9_2.xpRequired
      L12_2 = L3_2 - L12_2
      L13_2 = L10_2.xpRequired
      L14_2 = L9_2.xpRequired
      L13_2 = L13_2 - L14_2
      L12_2 = L12_2 / L13_2
      L12_2 = L12_2 * 100
      return L11_2(L12_2)
    end
  end
end
getPlayerLevelPercentage = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = MySQL
  L2_2 = L2_2.scalar
  L2_2 = L2_2.await
  L3_2 = "SELECT is_initialized FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if 0 == L2_2 then
    L3_2 = MySQL
    L3_2 = L3_2.update
    L3_2 = L3_2.await
    L4_2 = "UPDATE ra_boosting_user_settings SET is_initialized = 1 WHERE player_identifier = ?"
    L5_2 = {}
    L6_2 = A1_2
    L5_2[1] = L6_2
    L3_2(L4_2, L5_2)
    L3_2 = insertContracts
    L4_2 = generatePlayerStarterContracts
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    L5_2 = false
    L3_2(L4_2, L5_2)
  end
end
generateInitialContractsIfNeeded = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2 = svConfig
  L2_2 = L2_2.vehicleClasses
  L3_2 = svConfig
  L3_2 = L3_2.vehicleClasses
  L3_2 = #L3_2
  L2_2 = L2_2[L3_2]
  L3_2 = 1
  L4_2 = svConfig
  L4_2 = L4_2.initialContractAmount
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = getRandomVehicleForClass
    L8_2 = L2_2.class
    L7_2 = L7_2(L8_2)
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = generateContractForPlayer
    L11_2 = A0_2
    L12_2 = L2_2
    L13_2 = L7_2
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  return L1_2
end
generatePlayerStarterContracts = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = {}
  L3_2.playerIdentifier = A0_2
  L3_2.status = "AVAILABLE"
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = A1_2.priceMin
  L6_2 = A1_2.priceMax
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.price = L4_2
  L4_2 = A1_2.experiencePerJob
  L3_2.experienceGain = L4_2
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = A1_2.rewardCashMin
  L6_2 = A1_2.rewardCashMax
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.rewardCash = L4_2
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = A1_2.rewardCryptoMin
  L6_2 = A1_2.rewardCryptoMax
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.rewardCrypto = L4_2
  L4_2 = A2_2.model
  L3_2.vehicleModel = L4_2
  L4_2 = A2_2.name
  L3_2.vehicleModelName = L4_2
  L4_2 = generateLicensePlate
  L4_2 = L4_2()
  L3_2.vehicleLicensePlate = L4_2
  L4_2 = A1_2.class
  L3_2.vehicleClass = L4_2
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 1
  L6_2 = 100
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = A1_2.tuningChance
  if L4_2 <= L5_2 then
    L4_2 = 1
    if L4_2 then
      goto lbl_46
    end
  end
  L4_2 = 0
  ::lbl_46::
  L3_2.isTuned = L4_2
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 60
  L6_2 = 180
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.expirationMinutes = L4_2
  return L3_2
end
generateContractForPlayer = L5_1
L5_1 = "INSERT INTO ra_boosting_contracts (owner_identifier, status, price, experience_gain, payout_cash, payout_crypto, vehicle_model, vehicle_model_name, vehicle_license_plate, vehicle_class, is_vehicle_tuned, expiration_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TIMESTAMPADD(MINUTE, ?, CURRENT_TIMESTAMP()))"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = #A0_2
  if L2_2 > 0 then
    L3_2 = {}
    L4_2 = 1
    L5_2 = L2_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = A0_2[L7_2]
      L9_2 = #L3_2
      L9_2 = L9_2 + 1
      L10_2 = {}
      L11_2 = L8_2.playerIdentifier
      L12_2 = L8_2.status
      L13_2 = L8_2.price
      L14_2 = L8_2.experienceGain
      L15_2 = L8_2.rewardCash
      L16_2 = L8_2.rewardCrypto
      L17_2 = L8_2.vehicleModel
      L18_2 = L8_2.vehicleModelName
      L19_2 = L8_2.vehicleLicensePlate
      L20_2 = L8_2.vehicleClass
      L21_2 = L8_2.isTuned
      L22_2 = L8_2.expirationMinutes
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L10_2[4] = L14_2
      L10_2[5] = L15_2
      L10_2[6] = L16_2
      L10_2[7] = L17_2
      L10_2[8] = L18_2
      L10_2[9] = L19_2
      L10_2[10] = L20_2
      L10_2[11] = L21_2
      L10_2[12] = L22_2
      L3_2[L9_2] = L10_2
    end
    L4_2 = MySQL
    L4_2 = L4_2.prepare
    L5_2 = L5_1
    L6_2 = L3_2
    function L7_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3
      if A0_3 then
        L1_3 = infoPrint
        L2_3 = "Successfully inserted ^3%s^0 boosting %s into the database."
        L3_3 = L2_3
        L2_3 = L2_3.format
        L4_3 = L2_2
        L5_3 = L2_2
        if L5_3 > 1 then
          L5_3 = "contracts"
          if L5_3 then
            goto lbl_14
          end
        end
        L5_3 = "contract"
        ::lbl_14::
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3, L5_3)
        L1_3(L2_3, L3_3, L4_3, L5_3)
        L1_3 = A1_2
        if L1_3 then
          L1_3 = TriggerClientEvent
          L2_3 = "rahe-boosting:client:contractsUpdated"
          L3_3 = -1
          L1_3(L2_3, L3_3)
        end
      end
    end
    L4_2(L5_2, L6_2, L7_2)
  else
    L3_2 = infoPrint
    L4_2 = "No contracts were generated by the ^3contract generator^0."
    L3_2(L4_2)
  end
end
insertContracts = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM ra_boosting_contracts WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getContractDbData = L6_1
L6_1 = RegisterNetEvent
L7_1 = "rahe-boosting:server:acceptContract"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = getPlayerActiveContract
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = getPlayerGroupId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      goto lbl_23
    end
  end
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:errorNotification"
  L5_2 = L1_2
  L6_2 = translations
  L6_2 = L6_2.NOTIFICATION_TABLET_ALREADY_ACTIVE
  L7_2 = 5000
  L3_2(L4_2, L5_2, L6_2, L7_2)
  do return end
  ::lbl_23::
  L3_2 = getContractDbData
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = removePlayerCrypto
  L5_2 = L1_2
  L6_2 = L2_2
  L7_2 = L3_2.price
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if not L4_2 then
    return
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L5_2 = "UPDATE ra_boosting_contracts SET status = 'BOUGHT' WHERE id = ?"
  L6_2 = {}
  L7_2 = A0_2
  L6_2[1] = L7_2
  function L7_2()
    local L0_3, L1_3
    L0_3 = loadHomeTabData
    L1_3 = L1_2
    L0_3(L1_3)
  end
  L4_2(L5_2, L6_2, L7_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rahe-boosting:server:startContract"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = getContractDbData
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.owner_identifier
  if L3_2 == L5_2 then
    L5_2 = L4_2.status
    if "BOUGHT" == L5_2 then
      goto lbl_15
    end
  end
  do return end
  ::lbl_15::
  if "STEAL" == A1_2 then
    L5_2 = svConfig
    L5_2 = L5_2.vinScratchingEnabled
    if not L5_2 then
      L5_2 = notifyPlayerTablet
      L6_2 = L2_2
      L7_2 = translations
      L8_2 = "NOTIFICATION_TABLET_VIN_SCRATCHING_NOT_AVAILABLE"
      L7_2 = L7_2[L8_2]
      L5_2(L6_2, L7_2)
      return
    end
  end
  L5_2 = contractHasGroup
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = "GROUP"
    if L5_2 then
      goto lbl_37
    end
  end
  L5_2 = "PERSONAL"
  ::lbl_37::
  if "STEAL" == A1_2 then
    L6_2 = L3_1
    L6_2 = L6_2[A0_2]
    L7_2 = getPlayerCryptoAmount
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    if L6_2 > L7_2 then
      L7_2 = TriggerClientEvent
      L8_2 = "rahe-boosting:client:errorNotification"
      L9_2 = L2_2
      L10_2 = translations
      L10_2 = L10_2.NOTIFICATION_TABLET_NO_CRYPTO
      L11_2 = 5000
      L7_2(L8_2, L9_2, L10_2, L11_2)
      return
    end
    L7_2 = removePlayerCrypto
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
  end
  if "STEAL" == A1_2 then
    L6_2 = "IN_PROGRESS_VIN"
    if L6_2 then
      goto lbl_65
    end
  end
  L6_2 = "IN_PROGRESS"
  ::lbl_65::
  L7_2 = MySQL
  L7_2 = L7_2.update
  L7_2 = L7_2.await
  L8_2 = "UPDATE ra_boosting_contracts SET status = ? WHERE id = ?"
  L9_2 = {}
  L10_2 = L6_2
  L11_2 = A0_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2(L8_2, L9_2)
  L7_2 = startGameContract
  L8_2 = L2_2
  L9_2 = L4_2
  L10_2 = L3_2
  L11_2 = L5_2
  L7_2(L8_2, L9_2, L10_2, L11_2)
end
L6_1(L7_1, L8_1)
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT experience FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getPlayerAlias = L6_1
L6_1 = RegisterNetEvent
L7_1 = "rahe-boosting:server:transferContract"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = getContractDbData
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.owner_identifier
  if L5_2 ~= L3_2 or not L4_2 then
    return
  end
  L5_2 = MySQL
  L5_2 = L5_2.single
  L6_2 = "SELECT player_identifier, experience FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
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
    L1_3 = A1_2
    L2_3 = L1_3
    L1_3 = L1_3.lower
    L1_3 = L1_3(L2_3)
    L2_3 = L3_2
    L3_3 = L2_3
    L2_3 = L2_3.lower
    L2_3 = L2_3(L3_3)
    if L1_3 == L2_3 then
      return
    end
    L1_3 = getVehicleClassFromId
    L2_3 = L4_2.vehicle_class
    L1_3 = L1_3(L2_3)
    L2_3 = A0_3.experience
    L3_3 = L1_3.xpRequired
    if L2_3 < L3_3 then
      L2_3 = TriggerClientEvent
      L3_3 = "rahe-boosting:client:errorNotification"
      L4_3 = L2_2
      L5_3 = translations
      L6_3 = "NOTIFICATION_TABLET_ERROR_RECIPIENT_LEVEL"
      L5_3 = L5_3[L6_3]
      L6_3 = 5000
      L2_3(L3_3, L4_3, L5_3, L6_3)
      return
    end
    L2_3 = MySQL
    L2_3 = L2_3.update
    L3_3 = "UPDATE ra_boosting_contracts SET status = 'AVAILABLE', price = 0, owner_identifier = ? WHERE id = ?"
    L4_3 = {}
    L5_3 = A0_3.player_identifier
    L6_3 = A0_2
    L4_3[1] = L5_3
    L4_3[2] = L6_3
    function L5_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
      L0_4 = TriggerClientEvent
      L1_4 = "rahe-boosting:client:infoNotification"
      L2_4 = L2_2
      L3_4 = translations
      L4_4 = "NOTIFICATION_TABLET_INFO_CONTRACT_TRANSFERRED"
      L3_4 = L3_4[L4_4]
      L4_4 = L3_4
      L3_4 = L3_4.format
      L5_4 = A1_2
      L3_4 = L3_4(L4_4, L5_4)
      L4_4 = 5000
      L0_4(L1_4, L2_4, L3_4, L4_4)
      L0_4 = loadHomeTabData
      L1_4 = L2_2
      L0_4(L1_4)
    end
    L2_3(L3_3, L4_3, L5_3)
  end
  L5_2(L6_2, L7_2, L8_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rahe-boosting:server:cancelContract"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = getPlayerIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = getContractDbData
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = L4_2.owner_identifier
    if L3_2 == L5_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "DELETE FROM ra_boosting_contracts WHERE id = ?"
  L7_2 = {}
  L8_2 = A0_2
  L7_2[1] = L8_2
  function L8_2()
    local L0_3, L1_3
    L0_3 = lastStartedContractsByPlayer
    L1_3 = L3_2
    L0_3[L1_3] = nil
    L0_3 = removeGroupContract
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = loadHomeTabData
    L1_3 = L2_2
    L0_3(L1_3)
  end
  L5_2(L6_2, L7_2, L8_2)
  if A1_2 then
    L5_2 = NetworkGetEntityFromNetworkId
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = DeleteEntity
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = lib
L6_1 = L6_1.callback
L6_1 = L6_1.register
L7_1 = "rahe-boosting:server:getVehicleStealPrice"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L3_1
  L2_2 = L2_2[A1_2]
  if L2_2 then
    L2_2 = L3_1
    L2_2 = L2_2[A1_2]
    return L2_2
  end
  L2_2 = getContractDbData
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.vehicle_class
  L3_2 = getVehicleClassFromId
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_1
  L5_2 = math
  L5_2 = L5_2.random
  L6_2 = L3_2.minScratchPrice
  L7_2 = L3_2.maxScratchPrice
  L5_2 = L5_2(L6_2, L7_2)
  L4_2[A1_2] = L5_2
  L4_2 = L3_1
  L4_2 = L4_2[A1_2]
  return L4_2
end
L6_1(L7_1, L8_1)
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = getPlayerCryptoAmount
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if A2_2 > L3_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "rahe-boosting:client:errorNotification"
    L5_2 = A0_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_TABLET_NO_CRYPTO
    L7_2 = 5000
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE ra_boosting_user_settings SET crypto = crypto - ? WHERE player_identifier = ?"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = true
  return L3_2
end
removePlayerCrypto = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L1_2 = L1_2.await
  L2_2 = "SELECT crypto FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getPlayerCryptoAmount = L6_1
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = getVehicleClassFromId
  L4_2 = A0_2.vehicle_class
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.riskChances
  L5_2 = {}
  L5_2.doorsLocked = false
  L5_2.advancedLock = false
  L5_2.advancedSystem = false
  L5_2.npcs = false
  L6_2 = nil
  L7_2 = nil
  L8_2 = shConfig
  L8_2 = L8_2.deliveryCoords
  L9_2 = math
  L9_2 = L9_2.random
  L10_2 = 1
  L11_2 = shConfig
  L11_2 = L11_2.deliveryCoords
  L11_2 = #L11_2
  L9_2 = L9_2(L10_2, L11_2)
  L8_2 = L8_2[L9_2]
  L9_2 = L3_2.isImportant
  if L9_2 then
    L9_2 = math
    L9_2 = L9_2.random
    L10_2 = 1
    L11_2 = shConfig
    L11_2 = L11_2.advancedVehicleCoords
    L11_2 = #L11_2
    L9_2 = L9_2(L10_2, L11_2)
    L6_2 = L9_2
    L9_2 = shConfig
    L9_2 = L9_2.advancedVehicleCoords
    L9_2 = L9_2[L6_2]
    L7_2 = L9_2.carCoords
  else
    L9_2 = math
    L9_2 = L9_2.random
    L10_2 = 1
    L11_2 = shConfig
    L11_2 = L11_2.vehicleCoords
    L11_2 = #L11_2
    L9_2 = L9_2(L10_2, L11_2)
    L6_2 = L9_2
    L9_2 = shConfig
    L9_2 = L9_2.vehicleCoords
    L7_2 = L9_2[L6_2]
  end
  L9_2 = math
  L9_2 = L9_2.random
  L10_2 = 0
  L11_2 = 100
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L4_2.advancedSystemChance
  if L9_2 < L10_2 then
    L5_2.advancedSystem = true
  end
  L9_2 = math
  L9_2 = L9_2.random
  L10_2 = 0
  L11_2 = 100
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L4_2.npcChance
  if L9_2 < L10_2 then
    L9_2 = L3_2.isImportant
    if L9_2 then
      L5_2.npcs = true
      L9_2 = shConfig
      L9_2 = L9_2.advancedVehicleCoords
      L9_2 = L9_2[L6_2]
      L9_2 = L9_2.peds
      L5_2.npcCoords = L9_2
    end
  end
  L9_2 = math
  L9_2 = L9_2.random
  L10_2 = 0
  L11_2 = 100
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L4_2.doorsLocked
  if L9_2 < L10_2 then
    L5_2.doorsLocked = true
  end
  L9_2 = math
  L9_2 = L9_2.random
  L10_2 = 0
  L11_2 = 100
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L4_2.advancedLockChance
  if L9_2 < L10_2 then
    L5_2.advancedLock = true
  end
  L9_2 = {}
  L10_2 = A0_2.id
  L9_2.id = L10_2
  L9_2.ownerIdentifier = A1_2
  L10_2 = A0_2.vehicle_license_plate
  L9_2.licensePlate = L10_2
  L10_2 = A0_2.is_vehicle_tuned
  L9_2.isVehicleTuned = L10_2
  L9_2.pickUpLocation = L7_2
  L10_2 = math
  L10_2 = L10_2.random
  L11_2 = svConfig
  L11_2 = L11_2.vehicleAreaMaximumOffset
  L11_2 = -L11_2
  L12_2 = svConfig
  L12_2 = L12_2.vehicleAreaMaximumOffset
  L10_2 = L10_2(L11_2, L12_2)
  L9_2.areaXOffset = L10_2
  L10_2 = math
  L10_2 = L10_2.random
  L11_2 = svConfig
  L11_2 = L11_2.vehicleAreaMaximumOffset
  L11_2 = -L11_2
  L12_2 = svConfig
  L12_2 = L12_2.vehicleAreaMaximumOffset
  L10_2 = L10_2(L11_2, L12_2)
  L9_2.areaYOffset = L10_2
  L9_2.deliveryLocation = L8_2
  L10_2 = A0_2.vehicle_model
  L9_2.vehicleModel = L10_2
  L10_2 = A0_2.vehicle_model_name
  L9_2.vehicleModelName = L10_2
  L10_2 = A0_2.vehicle_class
  L9_2.vehicleClass = L10_2
  L9_2.risks = L5_2
  L9_2.type = A2_2
  L9_2.vehicleSpawned = false
  return L9_2
end
getGameContractData = L6_1
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = getGameContractData
  L5_2 = A1_2
  L6_2 = A2_2
  L7_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = lastStartedContractsByPlayer
  L5_2[A2_2] = L4_2
  if "GROUP" ~= A3_2 then
    L5_2 = loadHomeTabData
    L6_2 = A0_2
    L5_2(L6_2)
    L5_2 = TriggerClientEvent
    L6_2 = "rahe-boosting:client:startContract"
    L7_2 = A0_2
    L8_2 = L4_2
    L9_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2)
  else
    L5_2 = setGroupContractAsStarted
    L6_2 = A1_2.id
    L5_2(L6_2)
    L5_2 = syncGroupData
    L6_2 = A1_2.id
    L5_2(L6_2)
    L5_2 = sendGroupContract
    L6_2 = A1_2.id
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
  end
end
startGameContract = L6_1
L6_1 = lib
L6_1 = L6_1.callback
L6_1 = L6_1.register
L7_1 = "rahe-boosting:server:vehicleMarkedAsSpawned"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = isGroupVehicleSpawned
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L2_2 = not L2_2
  if L2_2 then
    L3_2 = setGroupVehicleAsSpawned
    L4_2 = A1_2
    L3_2(L4_2)
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rahe-boosting:server:setContractVehicleAsSpawned"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = getPlayerIdentifier
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = lastStartedContractsByPlayer
  L2_2 = L2_2[L1_2]
  L2_2.vehicleSpawned = true
end
L6_1(L7_1, L8_1)
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L1_2 = L1_2.await
  L2_2 = "SELECT 1 FROM ra_boosting_contracts WHERE owner_identifier = ? AND (status = 'BOUGHT' or status = 'IN_PROGRESS' or status = 'IN_PROGRESS_VIN')"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  return L1_2(L2_2, L3_2)
end
getPlayerActiveContract = L6_1
function L6_1(A0_2, A1_2)
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
DumpTable = L6_1
L6_1 = RegisterServerEvent
L7_1 = "rahe-boosting:server:setEntityData"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rahe-boosting:server:setEntityData"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L2_2 = DoesEntityExist
    L3_2 = NetworkGetEntityFromNetworkId
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2)
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = getVehicleClassFromId
  L4_2 = A1_2.vehicleClass
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  L5_2 = contractHasGroup
  L6_2 = A1_2.id
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = getGroupPlayerIdentifiers
    L6_2 = A1_2.id
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  end
  L5_2 = Entity
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.state
  L6_2 = {}
  L7_2 = A1_2.ownerIdentifier
  L6_2.cid = L7_2
  L6_2.groupIdentifiers = L4_2
  L7_2 = A1_2.vehicleClass
  L6_2.class = L7_2
  L7_2 = L3_2.isImportant
  L6_2.isImportant = L7_2
  L7_2 = L3_2.gpsHackMinTime
  L6_2.gpsHackMinTime = L7_2
  L7_2 = L3_2.gpsHackMaxTime
  L6_2.gpsHackMaxTime = L7_2
  L7_2 = A1_2.risks
  L7_2 = L7_2.advancedLock
  L6_2.advancedLock = L7_2
  L7_2 = A1_2.risks
  L7_2 = L7_2.advancedSystem
  L6_2.advancedSystem = L7_2
  L6_2.advancedSystemDoorsHacked = false
  L6_2.advancedSystemEngineHacked = false
  L7_2 = A1_2.risks
  L7_2 = L7_2.npcs
  L6_2.npcs = L7_2
  L7_2 = A1_2.risks
  L7_2 = L7_2.npcCoords
  L6_2.npcCoords = L7_2
  L6_2.npcsSpawned = false
  L5_2.boostingData = L6_2
end
L6_1(L7_1, L8_1)
L6_1 = RegisterServerEvent
L7_1 = "rahe-boosting:server:addPlayerCharacterToQueue"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rahe-boosting:server:addPlayerCharacterToQueue"
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = getPlayerIdentifier
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = getCharacterQueueIndex
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if -1 == L2_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = playersInQueue
    L5_2 = L1_2
    L3_2(L4_2, L5_2)
    L3_2 = TriggerClientEvent
    L4_2 = "rahe-boosting:client:infoNotification"
    L5_2 = L0_2
    L6_2 = translations
    L6_2 = L6_2.NOTIFICATION_TABLET_IN_QUEUE
    L7_2 = 3000
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterServerEvent
L7_1 = "rahe-boosting:server:removePlayerCharacterFromQueue"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rahe-boosting:server:removePlayerCharacterFromQueue"
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = removePlayerFromQueue
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = TriggerClientEvent
  L2_2 = "rahe-boosting:client:infoNotification"
  L3_2 = L0_2
  L4_2 = translations
  L4_2 = L4_2.NOTIFICATION_TABLET_OUT_OF_QUEUE
  L5_2 = 3000
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
L6_1(L7_1, L8_1)
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getPlayerIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = getCharacterQueueIndex
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if -1 == L2_2 then
    return
  end
  L3_2 = table
  L3_2 = L3_2.remove
  L4_2 = playersInQueue
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
removePlayerFromQueue = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ipairs
  L2_2 = playersInQueue
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      return L5_2
    end
  end
  L1_2 = -1
  return L1_2
end
getCharacterQueueIndex = L6_1
