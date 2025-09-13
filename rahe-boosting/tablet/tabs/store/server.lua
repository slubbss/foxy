local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = "store"
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
    L2_2 = loadStoreTabData
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = {}
  L2_2 = svConfig
  L2_2 = L2_2.storeItems
  L1_2.storeItems = L2_2
  L2_2 = TriggerClientEvent
  L3_2 = "rahe-boosting:client:tabDataReceived"
  L4_2 = A0_2
  L5_2 = L0_1
  L6_2 = L1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
loadStoreTabData = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:buyItem"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = svConfig
  L3_2 = L3_2.storeItems
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    return
  end
  L3_2 = svConfig
  L3_2 = L3_2.storeItems
  L3_2 = L3_2[A0_2]
  L4_2 = L3_2.cashRequired
  L5_2 = getPlayerMoney
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L4_2 > L5_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "rahe-boosting:client:errorNotification"
    L6_2 = L1_2
    L7_2 = translations
    L7_2 = L7_2.NOTIFICATION_TABLET_NO_MONEY_FOR_ORDER
    L8_2 = 5000
    L4_2(L5_2, L6_2, L7_2, L8_2)
    return
  end
  L4_2 = playerAlreadyHasItemOrder
  L5_2 = L2_2
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "rahe-boosting:client:errorNotification"
    L6_2 = L1_2
    L7_2 = translations
    L7_2 = L7_2.NOTIFICATION_TABLET_ITEM_ALREADY_ORDERED
    L8_2 = 5000
    L4_2(L5_2, L6_2, L7_2, L8_2)
    return
  end
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "SELECT crypto FROM ra_boosting_user_settings WHERE player_identifier = ?"
  L6_2 = {}
  L7_2 = L2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2[1]
  L4_2 = L4_2.crypto
  L5_2 = L3_2.cryptoRequired
  if L4_2 < L5_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "rahe-boosting:client:errorNotification"
    L7_2 = L1_2
    L8_2 = translations
    L8_2 = L8_2.NOTIFICATION_TABLET_NO_CRYPTO_FOR_ORDER
    L9_2 = 5000
    L5_2(L6_2, L7_2, L8_2, L9_2)
    return
  end
  L5_2 = L2_1
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    L5_2 = L2_1
    L5_2[A0_2] = 1
  else
    L5_2 = L2_1
    L6_2 = L2_1
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2 + 1
    L5_2[A0_2] = L6_2
  end
  L5_2 = L2_1
  L5_2 = L5_2[A0_2]
  L6_2 = svConfig
  L6_2 = L6_2.storeItems
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2.availablePerRestart
  if L5_2 >= L6_2 then
    L5_2 = svConfig
    L5_2 = L5_2.storeItems
    L5_2 = L5_2[A0_2]
    L5_2.isSoldOut = true
  end
  L5_2 = removePlayerMoney
  L6_2 = L1_2
  L7_2 = L3_2.cashRequired
  L5_2(L6_2, L7_2)
  L5_2 = removePlayerCrypto
  L6_2 = L1_2
  L7_2 = L2_2
  L8_2 = L3_2.cryptoRequired
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = TriggerClientEvent
  L6_2 = "rahe-boosting:client:infoNotification"
  L7_2 = L1_2
  L8_2 = translations
  L8_2 = L8_2.NOTIFICATION_TABLET_ORDER_SUCCESSFUL
  L9_2 = 7000
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = updateSharedData
  L6_2 = L1_2
  L7_2 = L2_2
  L5_2(L6_2, L7_2)
  L5_2 = loadStoreTabData
  L6_2 = L1_2
  L5_2(L6_2)
  L5_2 = table
  L5_2 = L5_2.insert
  L6_2 = L1_1
  L7_2 = {}
  L7_2.owner = L2_2
  L7_2.itemId = A0_2
  L8_2 = L3_2.title
  L7_2.name = L8_2
  L5_2(L6_2, L7_2)
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.owner
    if L8_2 == A0_2 then
      L8_2 = L7_2.itemId
      if L8_2 == A1_2 then
        L8_2 = true
        return L8_2
      end
    end
  end
  L2_2 = false
  return L2_2
end
playerAlreadyHasItemOrder = L3_1
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:requestOrders"
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = source
  L1_2 = getPlayerIdentifier
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = getPlayerOrders
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = #L2_2
  if 0 == L3_2 then
    L3_2 = notifyPlayer
    L4_2 = L0_2
    L5_2 = translations
    L5_2 = L5_2.NOTIFICATION_GAME_NO_ORDERS
    L6_2 = G_NOTIFICATION_TYPE_INFORM
    L3_2(L4_2, L5_2, L6_2)
    return
  end
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:showOrders"
  L5_2 = L0_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "rahe-boosting:server:acceptOrder"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = getPlayerIdentifier
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = ipairs
  L4_2 = L1_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.owner
    if L9_2 == L2_2 then
      L9_2 = L8_2.itemId
      if L9_2 == A0_2 then
        L9_2 = giveOrder
        L10_2 = L1_2
        L11_2 = A0_2
        L9_2(L10_2, L11_2)
        L9_2 = notifyPlayer
        L10_2 = L1_2
        L11_2 = translations
        L11_2 = L11_2.NOTIFICATION_GAME_ORDER_ACCEPTED
        L12_2 = G_NOTIFICATION_TYPE_SUCCESS
        L9_2(L10_2, L11_2, L12_2)
        L9_2 = table
        L9_2 = L9_2.remove
        L10_2 = L1_1
        L11_2 = L7_2
        L9_2(L10_2, L11_2)
        return
      end
    end
  end
end
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = ipairs
  L3_2 = svConfig
  L3_2 = L3_2.storeItems
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2.receiveItemIds
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = giveItem
    L9_2 = A0_2
    L10_2 = L7_2
    L11_2 = 1
    L8_2(L9_2, L10_2, L11_2)
  end
end
giveOrder = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.owner
    if L8_2 == A0_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
  end
  return L1_2
end
getPlayerOrders = L3_1
