local L0_1, L1_1, L2_1, L3_1, L4_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = A0_2
  L3_2.data = A1_2
  L2_2(L3_2)
end
SendReactMessage = L0_1
L0_1 = GetCurrentResourceName
L0_1 = L0_1()
L1_1 = GetConvarInt
L2_1 = "%s-debugMode"
L3_1 = L2_1
L2_1 = L2_1.format
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = 0
L1_1 = L1_1(L2_1, L3_1)
L1_1 = 1 == L1_1
function L2_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L1_1
  if not L0_2 then
    return
  end
  L0_2 = {}
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = ...
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  L0_2[10] = L10_2
  L0_2[11] = L11_2
  L1_2 = ""
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L1_2
    L9_2 = " "
    L10_2 = tostring
    L11_2 = L7_2
    L10_2 = L10_2(L11_2)
    L8_2 = L8_2 .. L9_2 .. L10_2
    L1_2 = L8_2
  end
  L2_2 = "^3[%s]^0%s"
  L4_2 = L2_2
  L3_2 = L2_2.format
  L5_2 = L0_1
  L6_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = print
  L5_2 = L3_2
  L4_2(L5_2)
end
debugPrint = L2_1
