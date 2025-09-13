local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "buyItem"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:buyItem"
  L4_2 = A0_2.item
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
