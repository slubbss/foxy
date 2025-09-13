local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "requestJoinGroup"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = A0_2.contractId
  if L2_2 and "" ~= L2_2 then
    L3_2 = tonumber
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_22
    end
  end
  L3_2 = TriggerEvent
  L4_2 = "rahe-boosting:client:errorNotification"
  L5_2 = translations
  L6_2 = "NOTIFICATION_TABLET_GROUP_NO_NUMBER_INSERTED"
  L5_2 = L5_2[L6_2]
  L6_2 = 5000
  L3_2(L4_2, L5_2, L6_2)
  do return end
  ::lbl_22::
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "rahe-boosting:server:requestJoinGroup"
  L5_2 = false
  L6_2 = tonumber
  L7_2 = A0_2.contractId
  L6_2, L7_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "requestResponse"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:requestResponse"
  L4_2 = A0_2.contractId
  L5_2 = A0_2.participantIdentifier
  L6_2 = A0_2.requestResponse
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "kick"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:kickParticipant"
  L4_2 = A0_2.contractId
  L5_2 = A0_2.participantIdentifier
  L2_2(L3_2, L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "changeContractGroupType"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "changeContractGroupType"
  L4_2 = A0_2.contractId
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
