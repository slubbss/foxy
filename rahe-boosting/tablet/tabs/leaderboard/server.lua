local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "leaderboard"
L1_1 = nil
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:tabDataRequested"
L3_1(L4_1)
L3_1 = AddEventHandler
L4_1 = "rahe-boosting:server:tabDataRequested"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = L0_1
  if A0_2 == L2_2 then
    L2_2 = loadLeaderboardTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    return
  end
  L1_2 = L2_1
  L1_2[A0_2] = true
  L1_2 = {}
  L2_2 = L1_1
  L1_2.leaderboardEntries = L2_2
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:tabDataReceived"
  L4_2 = A0_2
  L5_2 = L0_1
  L6_2 = L1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
loadLeaderboardTabData = L3_1
L3_1 = [[
   SELECT
        rbus.player_identifier,
        rbus.alias,
        rbus.profile_picture,
        rbus.experience
    FROM ra_boosting_user_settings rbus ORDER BY rbus.experience DESC LIMIT 500
    ]]
L4_1 = [[
    SELECT
        owner_identifier,
        COUNT(*) AS contracts_completed,
        TIMESTAMPDIFF(DAY, MAX(expiration_date), CURRENT_TIMESTAMP()) AS last_contract_days_ago
    FROM ra_boosting_contracts
        WHERE STATUS = 'COMPLETED'
        GROUP BY owner_identifier
    ]]
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2
  while true do
    L0_2 = setLeaderboard
    L0_2()
    L0_2 = {}
    L2_1 = L0_2
    L0_2 = Wait
    L1_2 = 3600000
    L0_2(L1_2)
  end
end
L5_1(L6_1)
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = L3_1
  L2_2 = {}
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = L4_1
  L3_2 = {}
  L1_2 = L1_2(L2_2, L3_2)
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = ipairs
    L2_3 = L1_2
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = L6_3.owner_identifier
      if L7_3 == A0_3 then
        return L6_3
      end
    end
    L1_3 = nil
    return L1_3
  end
  L3_2 = ipairs
  L4_2 = L0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L2_2
    L10_2 = L8_2.player_identifier
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L8_2.last_contract_days_ago = "-"
      L8_2.contract_count = 0
    else
      L10_2 = L9_2.last_contract_days_ago
      if L10_2 < 0 then
        L8_2.last_contract_days_ago = 0
      else
        L10_2 = L9_2.last_contract_days_ago
        L8_2.last_contract_days_ago = L10_2
      end
      L10_2 = L9_2.contracts_completed
      L8_2.contract_count = L10_2
    end
  end
  L1_1 = L0_2
end
setLeaderboard = L5_1
