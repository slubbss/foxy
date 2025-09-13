local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "changeName"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:nameChanged"
  L4_2 = A0_2.name
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "changePicture"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:pictureChanged"
  L4_2 = A0_2.picture
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
