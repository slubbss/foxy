local L0_1, L1_1, L2_1, L3_1
L0_1 = lib
L0_1 = L0_1.points
L0_1 = L0_1.new
L1_1 = clConfig
L1_1 = L1_1.orderLocation
L2_1 = 5
L3_1 = {}
L0_1 = L0_1(L1_1, L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = lib
  L1_2 = L1_2.showTextUI
  L2_2 = translations
  L2_2 = L2_2.INTERACTION_OPEN_STORE
  L3_2 = {}
  L4_2 = clConfig
  L4_2 = L4_2.storeUiPosition
  L3_2.position = L4_2
  L4_2 = clConfig
  L4_2 = L4_2.storeUiIcon
  L3_2.icon = L4_2
  L1_2(L2_2, L3_2)
end
L0_1.onEnter = L1_1
function L1_1(A0_2)
  local L1_2
  L1_2 = lib
  L1_2 = L1_2.hideTextUI
  L1_2()
end
L0_1.onExit = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = clConfig
  L1_2 = L1_2.createStoreMarker
  if L1_2 then
    L1_2 = DrawMarker
    L2_2 = 2
    L3_2 = A0_2.coords
    L3_2 = L3_2.x
    L4_2 = A0_2.coords
    L4_2 = L4_2.y
    L5_2 = A0_2.coords
    L5_2 = L5_2.z
    L6_2 = 0.0
    L7_2 = 0.0
    L8_2 = 0.0
    L9_2 = 0.0
    L10_2 = 180.0
    L11_2 = 0.0
    L12_2 = 1.0
    L13_2 = 1.0
    L14_2 = 1.0
    L15_2 = 200
    L16_2 = 20
    L17_2 = 20
    L18_2 = 50
    L19_2 = false
    L20_2 = true
    L21_2 = 2
    L22_2 = nil
    L23_2 = nil
    L24_2 = false
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  end
  L1_2 = IsControlJustReleased
  L2_2 = 0
  L3_2 = 38
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = A0_2.currentDistance
    if L1_2 < 5 then
      L1_2 = TriggerServerEvent
      L2_2 = "rahe-boosting:server:requestOrders"
      L1_2(L2_2)
    else
      L1_2 = notifyPlayer
      L2_2 = translations
      L2_2 = L2_2.NOTIFICATION_GAME_STORE_TOO_FAR
      L3_2 = G_NOTIFICATION_TYPE_ERROR
      L1_2(L2_2, L3_2)
    end
  end
end
L0_1.nearby = L1_1
L1_1 = RegisterNetEvent
L2_1 = "rahe-boosting:client:showOrders"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.name
    L9_2 = {}
    L9_2.event = "rahe-boosting:client:acceptOrder"
    L10_2 = {}
    L11_2 = L7_2.itemId
    L10_2.itemId = L11_2
    L9_2.args = L10_2
    L1_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L3_2.id = "orders"
  L4_2 = translations
  L4_2 = L4_2.TEXT_STORE_MENU_TITLE
  L3_2.title = L4_2
  L3_2.options = L1_2
  L2_2(L3_2)
  L2_2 = lib
  L2_2 = L2_2.showContext
  L3_2 = "orders"
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "rahe-boosting:client:acceptOrder"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerServerEvent
  L2_2 = "rahe-boosting:server:acceptOrder"
  L3_2 = A0_2.itemId
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
