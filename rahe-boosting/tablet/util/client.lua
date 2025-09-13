local L0_1, L1_1, L2_1, L3_1
L0_1 = false
L1_1 = RegisterNUICallback
L2_1 = "getRequestInfo"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = L0_1
  if L2_2 then
    return
  end
  L2_2 = true
  L0_1 = L2_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "rb:s:getRequestInfoForPlayer"
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.action = "loadRequestKey"
    L5_2 = "?key="
    L6_2 = L2_2.key
    L7_2 = "&license="
    L8_2 = L2_2.license
    L9_2 = "&title=Boosting%20System"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    L4_2.key = L5_2
    L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1)
