local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "rahe-boosting:client:contractsUpdated"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rahe-boosting:client:contractsUpdated"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = guiOpen
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "rahe-boosting:server:tabDataRequested"
    L2_2 = "home"
    L0_2(L1_2, L2_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "acceptContract"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:acceptContract"
  L4_2 = A0_2.contractId
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "startContract"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:startContract"
  L4_2 = A0_2.contractId
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "stealContract"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = lib
  L2_2 = L2_2.callback
  L3_2 = "rahe-boosting:server:getVehicleStealPrice"
  L4_2 = false
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = lib
    L1_3 = L1_3.inputDialog
    L2_3 = string
    L2_3 = L2_3.format
    L3_3 = translations
    L3_3 = L3_3.TEXT_INPUT_DIALOG_VIN_SCRATCH
    L4_3 = A0_3
    L5_3 = translations
    L5_3 = L5_3.GENERAL_CRYPTO
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L3_3 = {}
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      return
    end
    L2_3 = TriggerServerEvent
    L3_3 = "rahe-boosting:server:startContract"
    L4_3 = A0_2.contractId
    L5_3 = "STEAL"
    L2_3(L3_3, L4_3, L5_3)
  end
  L6_2 = A0_2.contractId
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "transferContract"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = lib
  L2_2 = L2_2.inputDialog
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = translations
  L4_2 = L4_2.TEXT_INPUT_DIALOG_TRANSFER
  L3_2 = L3_2(L4_2)
  L4_2 = {}
  L5_2 = {}
  L5_2.type = "input"
  L6_2 = translations
  L6_2 = L6_2.TEXT_INPUT_DIALOG_IDENTIFIER
  L5_2.label = L6_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return
  end
  L3_2 = TriggerServerEvent
  L4_2 = "rahe-boosting:server:transferContract"
  L5_2 = A0_2.contractId
  L6_2 = L2_2[1]
  L3_2(L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "cancelContract"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:cancelContract"
  L4_2 = A0_2.contractId
  L5_2 = activeVehicle
  if L5_2 then
    L5_2 = VehToNet
    L6_2 = activeVehicle
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_16
    end
  end
  L5_2 = nil
  ::lbl_16::
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = {}
  vehicleData = L2_2
  L2_2 = destroyVehicleDropOffPoint
  L2_2()
  L2_2 = destroyVehicleSpawnPoint
  L2_2()
  L2_2 = deleteBlips
  L2_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "joinQueue"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:addPlayerCharacterToQueue"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "leaveQueue"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "rahe-boosting:server:removePlayerCharacterFromQueue"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "rahe-boosting:client:hideLeaderboard"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rahe-boosting:client:hideLeaderboard"
function L2_1()
  local L0_2, L1_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "hideLeaderboard"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "rahe-boosting:client:newActiveTab"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rahe-boosting:client:newActiveTab"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "showTab"
  L2_2.tab = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
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
DumpTable = L0_1
