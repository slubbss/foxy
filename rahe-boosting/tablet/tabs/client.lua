local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = false
guiOpen = false
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = openGui
  L0_2()
  L0_2 = L0_1
  if not L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "rahe-boosting:server:loadInitialData"
    L0_2(L1_2)
    L0_2 = true
    L0_1 = L0_2
  else
    L0_2 = TriggerServerEvent
    L1_2 = "rahe-boosting:server:tabDataRequested"
    L2_2 = "home"
    L0_2(L1_2, L2_2)
  end
end
openTablet = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  guiOpen = true
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "showMenu"
  L0_2(L1_2)
end
openGui = L1_1
L1_1 = RegisterNUICallback
L2_1 = "closeTablet"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = closeGui
  L2_2()
  L2_2 = TriggerEvent
  L3_2 = "rahe-boosting:client:tabletClosed"
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  guiOpen = false
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "hideMenu"
  L0_2(L1_2)
end
closeGui = L1_1
L1_1 = RegisterNUICallback
L2_1 = "tabOpened"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:tabDataRequested"
  L4_2 = A0_2.tab
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:tabDataReceived"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:tabDataReceived"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "loadTabData"
  L3_2.tab = A0_2
  L3_2.data = A1_2
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:sharedDataReceived"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:sharedDataReceived"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "loadSharedData"
  L2_2.data = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:initialDataReceived"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:initialDataReceived"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "loadInitialData"
  L2_2.data = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = "showError"
L2_1 = "showInfo"
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:client:infoNotification"
L3_1(L4_1)
L3_1 = AddEventHandler
L4_1 = "rahe-boosting:client:infoNotification"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = sendNuiNotification
  L3_2 = L2_1
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:client:errorNotification"
L3_1(L4_1)
L3_1 = AddEventHandler
L4_1 = "rahe-boosting:client:errorNotification"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = sendNuiNotification
  L3_2 = L1_1
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = A0_2
  L4_2.message = A1_2
  L4_2.duration = A2_2
  L3_2(L4_2)
end
sendNuiNotification = L3_1
