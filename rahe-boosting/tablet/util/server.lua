local L0_1, L1_1, L2_1, L3_1, L4_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = TriggerClientEvent
  L4_2 = "rahe-boosting:client:infoNotification"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2 or L7_2
  if not A2_2 or not A2_2 then
    L7_2 = 5000
  end
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
notifyPlayerTablet = L0_1
function L0_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = svConfig
  L0_2 = L0_2.disableInfoPrint
  if not L0_2 then
    L0_2 = "info"
    L1_2 = {}
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = ...
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    L1_2[9] = L10_2
    L1_2[10] = L11_2
    L1_2[11] = L12_2
    L2_2 = ""
    L3_2 = ipairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L2_2
      L10_2 = " "
      L11_2 = tostring
      L12_2 = L8_2
      L11_2 = L11_2(L12_2)
      L9_2 = L9_2 .. L10_2 .. L11_2
      L2_2 = L9_2
    end
    L3_2 = "^3[%s]^0%s"
    L5_2 = L3_2
    L4_2 = L3_2.format
    L6_2 = L0_2
    L7_2 = L2_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = print
    L6_2 = L4_2
    L5_2(L6_2)
  end
end
infoPrint = L0_1
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = svConfig
  L0_2 = L0_2.minutesBetweenGenerations
  if L0_2 <= 1 then
    L0_2 = print
    L1_2 = "^1[warning]^0 Your config option ^1minutesBetweenGenerations^0 is set to ^11 or lower^0. We recommend keeping this at the default value of ^210-15 minutes^0!"
    L0_2(L1_2)
  end
  L0_2 = ipairs
  L1_2 = svConfig
  L1_2 = L1_2.vehicleClasses
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.gpsHackMinTime
    if L6_2 then
      L6_2 = L5_2.gpsHackMaxTime
      if L6_2 then
        L6_2 = L5_2.gpsHackMinTime
        L7_2 = L5_2.gpsHackMaxTime
        if L6_2 > L7_2 then
          L6_2 = print
          L7_2 = "^1[warning]^0 ^3[%s class]^0 Option ^3gpsHackMinTime^0 is higher than ^3gpsHackMaxTime^0! Please ^1fix your config^0 as minimum can't be higher than maximum!"
          L8_2 = L7_2
          L7_2 = L7_2.format
          L9_2 = L5_2.class
          L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
          L6_2(L7_2, L8_2, L9_2)
        end
      end
    end
    L6_2 = L5_2.priceMin
    L7_2 = L5_2.priceMax
    if L6_2 > L7_2 then
      L6_2 = print
      L7_2 = "^1[warning]^0 ^3[%s class]^0 Option ^3priceMin^0 is higher than ^3priceMax^0! Please ^1fix your config^0 as minimum can't be higher than maximum!"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L5_2.class
      L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = L5_2.minScratchPrice
    L7_2 = L5_2.maxScratchPrice
    if L6_2 > L7_2 then
      L6_2 = print
      L7_2 = "^1[warning]^0 ^3[%s class]^0 Option ^3minScratchPrice^0 is higher than ^3maxScratchPrice^0! Please ^1fix your config^0 as minimum can't be higher than maximum!"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L5_2.class
      L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = L5_2.rewardCashMin
    L7_2 = L5_2.rewardCashMax
    if L6_2 > L7_2 then
      L6_2 = print
      L7_2 = "^1[warning]^0 ^3[%s class]^0 Option ^3rewardCashMin^0 is higher than ^3rewardCashMax^0! Please ^1fix your config^0 as minimum can't be higher than maximum!"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L5_2.class
      L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = L5_2.rewardCryptoMin
    L7_2 = L5_2.rewardCryptoMax
    if L6_2 > L7_2 then
      L6_2 = print
      L7_2 = "^1[warning]^0 ^3[%s class]^0 Option ^3rewardCryptoMin^0 is higher than ^3rewardCryptoMax^0! Please ^1fix your config^0 as minimum can't be higher than maximum!"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L5_2.class
      L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
  end
end
L0_1(L1_1)
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = DoesPlayerExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = GetPlayerIdentifierByType
  L2_2 = A0_2
  L3_2 = "license2"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = GetPlayerIdentifierByType
    L3_2 = A0_2
    L4_2 = "license"
    L2_2 = L2_2(L3_2, L4_2)
    L1_2 = L2_2
  end
  if not L1_2 then
    return
  end
  L2_2 = svConfig
  L2_2 = L2_2.recommendedUploadWebsite
  if "https://upload.rahe.dev" ~= L2_2 then
    return
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2[L1_2]
    return L2_2
  end
  L2_2 = {}
  L3_2 = GetPasswordHash
  L4_2 = "rahe-boosting"
  L3_2 = L3_2(L4_2)
  L2_2.key = L3_2
  L2_2.license = L1_2
  L3_2 = L0_1
  L3_2[L1_2] = L2_2
  return L2_2
end
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "rb:s:getRequestInfoForPlayer"
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L2_2 = A0_2
  return L1_2(L2_2)
end
L2_1(L3_1, L4_1)
L2_1 = MySQL
L2_1 = L2_1.ready
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = GetResourceKvpString
  L1_2 = "migration-"
  L2_2 = 1
  L1_2 = L1_2 .. L2_2
  L0_2 = L0_2(L1_2)
  if L0_2 then
    return
  end
  L1_2 = SetResourceKvp
  L2_2 = "migration-1"
  L3_2 = "completed"
  L1_2(L2_2, L3_2)
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L1_2 = L1_2.await
  L2_2 = [[
    SELECT
	    COLUMN_DEFAULT
    FROM
	    INFORMATION_SCHEMA.COLUMNS
    WHERE
        TABLE_SCHEMA = DATABASE()
        AND TABLE_NAME = 'ra_boosting_user_settings'
        AND COLUMN_NAME = 'profile_picture'
    ]]
  L1_2 = L1_2(L2_2)
  if "'https://i.imgur.com/Lu9dGJH.png'" ~= L1_2 then
    return
  end
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE ra_boosting_user_settings SET profile_picture = ? WHERE profile_picture = ?"
  L4_2 = {}
  L5_2 = "https://media.rahe.dev/img/defaultprofile.webp"
  L6_2 = "https://i.imgur.com/Lu9dGJH.png"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "ALTER TABLE ra_boosting_user_settings ALTER COLUMN profile_picture SET DEFAULT ?"
  L4_2 = {}
  L5_2 = "https://media.rahe.dev/img/defaultprofile.webp"
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = print
  L3_2 = "Version 1.4.8 automatic database migration completed."
  L2_2(L3_2)
end
L2_1(L3_1)
