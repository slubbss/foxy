local L0_1, L1_1, L2_1, L3_1
L0_1 = "history"
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
    L2_2 = loadHistoryTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = {}
  L2_2 = getPlayerCompletedContracts
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.completedContracts = L2_2
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:tabDataReceived"
  L4_2 = A0_2
  L5_2 = L0_1
  L6_2 = L1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
loadHistoryTabData = L1_1
L1_1 = [[
    SELECT
        rbc.payout_cash,
        rbc.payout_crypto,
        rbc.employer,
        rbc.vehicle_model_name,
        rbc.vehicle_license_plate,
        rbc.vehicle_class,
        rbc.is_vehicle_tuned,
        TIMESTAMPDIFF(DAY, rbc.expiration_date, CURRENT_TIMESTAMP()) AS days_ago
    FROM ra_boosting_contracts rbc
        WHERE rbc.status = 'COMPLETED' AND owner_identifier = ?
    ORDER BY rbc.expiration_date DESC
    LIMIT 100
    ]]
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = getPlayerIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = L1_1
  L4_2 = {}
  L5_2 = L1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.days_ago
    if L9_2 < 0 then
      L8_2.days_ago = 0
    end
  end
  return L2_2
end
getPlayerCompletedContracts = L2_1
