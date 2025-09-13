local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
hackingCallback = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = SetNuiFocus
  L5_2 = A0_2
  L6_2 = A0_2
  L4_2(L5_2, L6_2)
  L4_2 = {}
  message = L4_2
  L4_2 = message
  L4_2.show = A0_2
  L4_2 = message
  L4_2.hackType = A1_2
  L4_2 = message
  L4_2.gameType = A2_2
  L4_2 = message
  L4_2.duration = A3_2
  L4_2 = SendReactMessage
  L5_2 = "setVisible"
  L6_2 = message
  L4_2(L5_2, L6_2)
end
L1_1 = false
L2_1 = RegisterNetEvent
L3_1 = "rahe-hackingdevice:start-hacking"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = TriggerEvent
  L5_2 = "client:newStress"
  L6_2 = true
  L7_2 = 50
  L4_2(L5_2, L6_2, L7_2)
  hackingCallback = A3_2
  L4_2 = L0_1
  L5_2 = true
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = debugPrint
  L5_2 = "Show NUI frame"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = false
  L1_1 = L4_2
end
L2_1(L3_1, L4_1)
L2_1 = AddEventHandler
L3_1 = "rahe-hackingdevice:fail-hack"
function L4_1()
  local L0_2, L1_2
  L0_2 = {}
  hackingCallback = L0_2
  L0_2 = true
  L1_1 = L0_2
  L0_2 = L0_1
  L1_2 = false
  L0_2(L1_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "close-frame"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  L3_2 = false
  L2_2(L3_2)
  L2_2 = debugPrint
  L3_2 = "Hide rahe-hackingdevice frame"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = L1_1
  if not L2_2 then
    L2_2 = true
    L1_1 = L2_2
    L2_2 = hackingCallback
    L3_2 = A0_2
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = {}
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
