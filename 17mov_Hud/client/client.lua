local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
IsInintialized = false
ForceDisplayRadar = false
NuiLoaded = false
HiddenByExport = false
RadarHiddenByCinematic = false
IsMapLoopEnabled = true
L0_1 = Config
L0_1 = L0_1.UseMPH
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.DefaultSettings
  L0_1.SpeedUnits = "mph"
end
L0_1 = Config
L0_1 = L0_1.UseMPH
if L0_1 then
  L0_1 = 2.23694
  if L0_1 then
    goto lbl_23
  end
end
L0_1 = 3.6
::lbl_23::
SpeedMultiplier = L0_1
L0_1 = {}
L1_1 = {}
L1_1.Health = 1
L1_1.Vest = 0
L1_1.Hunger = 1
L1_1.Thirst = 1
L1_1.Stress = 0
L1_1.Oxygen = 1
L1_1.Stamina = 1
MyStatus = L1_1
L1_1 = {}
L1_1.healthAndVest = 50
L1_1.oxygen = 50
L1_1.stamina = 50
L1_1.stress = 50
L1_1.food = 50
L1_1.Map = true
L1_1.location = true
L1_1.CinematicMode = false
ComponentsVariables = L1_1
L1_1 = {}
L1_1.health = true
L1_1.healthAndVest = false
L1_1.oxygen = false
L1_1.stamina = true
L1_1.food = true
L1_1.stress = false
L1_1.radio = true
L1_1.weapon = true
L1_1.ammo = true
L1_1.voice = true
L1_1.cash = true
L1_1.dirt_money = true
L1_1.society_money = false
L1_1.bank = true
L1_1.time = true
L1_1.map = true
L1_1.location = true
L1_1.serverId = true
L1_1.job = true
L1_1.CinematicMode = false
L2_1 = GetCurrentResourceName
L2_1 = L2_1()
if "17mov_Hud" ~= L2_1 then
  L2_1 = CreateThread
  function L3_1()
    local L0_2, L1_2
    while true do
      L0_2 = print
      L1_2 = "^5[ERROR]:^0 Because of the auto-installation feature resource name must be 17mov_Hud. Change resource name and try again."
      L0_2(L1_2)
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
    end
  end
  L2_1(L3_1)
  return
end
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = MyStatus
  L1_2.Frequency = A0_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = 100
    L0_3(L1_3)
    L0_3 = MyStatus
    L0_3 = L0_3.Frequency
    if 0 == L0_3 then
      L0_3 = HideComponent
      L1_3 = "radio"
      L0_3(L1_3)
    else
      L0_3 = Config
      L0_3 = L0_3.CurrentSettings
      L0_3 = L0_3.radio
      if true == L0_3 then
        L0_3 = ShowComponent
        L1_3 = "radio"
        L2_3 = true
        L0_3(L1_3, L2_3)
      end
    end
  end
  L1_2(L2_2)
end
UpdateRadio = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  if 0 ~= L0_2 then
    L1_2 = math
    L1_2 = L1_2.ceil
    L2_2 = GetEntitySpeed
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    L3_2 = SpeedMultiplier
    L2_2 = L2_2 * L3_2
    return L1_2(L2_2)
  else
    L1_2 = 0
    return L1_2
  end
end
GetMySpeed = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = NuiLoaded
  if not L2_2 then
    return
  end
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  if not L2_2 and nil == A1_2 then
    return
  end
  L2_2 = L1_1
  L2_2[A0_2] = false
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "HideComponent"
  L3_2.component = A0_2
  L2_2(L3_2)
end
HideComponent = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = NuiLoaded
  if not L2_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.Components
  L2_2 = L2_2[A0_2]
  if false == L2_2 then
    return
  end
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  if L2_2 and nil == A1_2 then
    return
  end
  L2_2 = L1_1
  L2_2[A0_2] = true
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "ShowComponent"
  L3_2.component = A0_2
  L2_2(L3_2)
end
ShowComponent = L2_1
L2_1 = false
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = NuiLoaded
  if not L1_2 then
    return
  end
  L1_2 = L2_1
  if L1_2 then
    return
  end
  L1_2 = true
  L2_1 = L1_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3
    while true do
      L0_3 = IsPedSwimming
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        L0_3 = IsEntityInWater
        L1_3 = A0_2
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          break
        end
      end
      L0_3 = MyStatus
      L1_3 = GetPlayerUnderwaterTimeRemaining
      L2_3 = PlayerId
      L2_3 = L2_3()
      L1_3 = L1_3(L2_3)
      L2_3 = Config
      L2_3 = L2_3.MaxUnderwaterTime
      L1_3 = L1_3 / L2_3
      L0_3.Oxygen = L1_3
      L0_3 = MyStatus
      L0_3 = L0_3.Oxygen
      if L0_3 > 1 then
        L0_3 = MyStatus
        L0_3.Oxygen = 1
      else
        L0_3 = MyStatus
        L0_3 = L0_3.Oxygen
        if L0_3 < 0 then
          L0_3 = MyStatus
          L0_3.Oxygen = 0
        end
      end
      L0_3 = ComponentsVariables
      L0_3 = L0_3.oxygen
      L1_3 = MyStatus
      L1_3 = L1_3.Oxygen
      if L0_3 > L1_3 then
        L0_3 = ShowComponent
        L1_3 = "oxygen"
        L2_3 = true
        L0_3(L1_3, L2_3)
      else
        L0_3 = HideComponent
        L1_3 = "oxygen"
        L2_3 = true
        L0_3(L1_3, L2_3)
      end
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 100
      L0_3(L1_3)
    end
    L0_3 = false
    L2_1 = L0_3
    L0_3 = HideComponent
    L1_3 = "oxygen"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
StartOxygenThread = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = DeepCopy
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L1_2[L6_2] = L8_2
    else
      L1_2[L6_2] = L7_2
    end
  end
  return L1_2
end
DeepCopy = L3_1
function L3_1(A0_2)
  local L1_2, L2_2
  if A0_2 < 10 then
    L1_2 = "0"
    L2_2 = A0_2
    L1_2 = L1_2 .. L2_2
    if L1_2 then
      goto lbl_11
    end
  end
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  ::lbl_11::
  return L1_2
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = NuiLoaded
  if not L0_2 then
    return
  end
  L0_2 = {}
  L1_2 = GetActiveScreenResolution
  L1_2, L2_2 = L1_2()
  L3_2 = GetAspectRatio
  L4_2 = true
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  L5_2 = nil
  L6_2 = SetScriptGfxAlign
  L7_2 = string
  L7_2 = L7_2.byte
  L8_2 = "L"
  L7_2 = L7_2(L8_2)
  L8_2 = string
  L8_2 = L8_2.byte
  L9_2 = "B"
  L8_2, L9_2 = L8_2(L9_2)
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = IsBigmapActive
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = GetScriptGfxPosition
    L7_2 = -0.003975
    L8_2 = -0.43841666599999995
    L6_2, L7_2 = L6_2(L7_2, L8_2)
    L5_2 = L7_2
    L4_2 = L6_2
    L6_2 = 2.4 * L3_2
    L6_2 = L1_2 / L6_2
    L0_2.width = L6_2
  else
    L6_2 = GetScriptGfxPosition
    L7_2 = -0.0045
    L8_2 = -0.186888
    L6_2, L7_2 = L6_2(L7_2, L8_2)
    L5_2 = L7_2
    L4_2 = L6_2
    L6_2 = 3.76 * L3_2
    L6_2 = L1_2 / L6_2
    L0_2.width = L6_2
  end
  L6_2 = ResetScriptGfxAlign
  L6_2()
  L6_2 = L1_2 * L4_2
  L0_2.x = L6_2
  L6_2 = L2_2 * L5_2
  L0_2.y = L6_2
  L6_2 = IsRadarHidden
  L6_2 = L6_2()
  if L6_2 then
    L0_2.y = 20
  else
    L6_2 = L0_2.y
    L6_2 = L2_2 - L6_2
    L0_2.y = L6_2
  end
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.action = "NotifyPosition"
  L8_2 = L0_2.x
  L7_2.x = L8_2
  L8_2 = L0_2.y
  L7_2.y = L8_2
  L8_2 = L0_2.width
  L7_2.width = L8_2
  L6_2(L7_2)
end
UpdateNotifyPosition = L4_1
L4_1 = {}
L5_1 = false
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = L5_1
  if L0_2 then
    return
  end
  L0_2 = true
  L5_1 = L0_2
  L0_2 = GetGameTimer
  L0_2 = L0_2()
  while true do
    L1_2 = NuiLoaded
    if L1_2 then
      break
    end
    L1_2 = GetGameTimer
    L1_2 = L1_2()
    L1_2 = L1_2 - L0_2
    L2_2 = 5000
    if L1_2 > L2_2 then
      L1_2 = print
      L2_2 = "Waiting for NUI load. THIS IS NOT ERROR! Report it ONLY if HUD doens't work!"
      L1_2(L2_2)
    end
    L1_2 = Wait
    L2_2 = 200
    L1_2(L2_2)
  end
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 1000
    L0_3(L1_3)
    L0_3 = UpdateNotifyPosition
    L0_3()
  end
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "ShowDateWithTime"
  L3_2 = Config
  L3_2 = L3_2.ShowDateIfTimeIsReal
  L2_2.value = L3_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SetupMaxNotifications"
  L3_2 = Config
  L3_2 = L3_2.MaxNotifyStack
  L2_2.value = L3_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SetupDefaultSettings"
  L3_2 = Config
  L3_2 = L3_2.DefaultSettings
  L2_2.defaultSettings = L3_2
  L3_2 = Config
  L3_2 = L3_2.Settings
  L2_2.settings = L3_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SetupDefaultPositions"
  L3_2 = Config
  L3_2 = L3_2.DefaultPositions
  L2_2.value = L3_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SetupDefaultColors"
  L3_2 = Config
  L3_2 = L3_2.DefaultColors
  L2_2.value = L3_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "DisableComponents"
  L3_2 = Config
  L3_2 = L3_2.Components
  L2_2.value = L3_2
  L1_2(L2_2)
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Components
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if not L6_2 then
      L7_2 = HideComponent
      L8_2 = L5_2
      L9_2 = true
      L7_2(L8_2, L9_2)
    end
  end
  L1_2 = {}
  L2_2 = pairs
  L3_2 = Config
  L3_2 = L3_2.Lang
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.sub
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = string
    L11_2 = L11_2.len
    L12_2 = "NUI_"
    L11_2, L12_2 = L11_2(L12_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if "NUI_" == L8_2 then
      L8_2 = string
      L8_2 = L8_2.sub
      L9_2 = L6_2
      L10_2 = string
      L10_2 = L10_2.len
      L11_2 = "NUI_"
      L10_2 = L10_2(L11_2)
      L10_2 = L10_2 + 1
      L8_2 = L8_2(L9_2, L10_2)
      L1_2[L8_2] = L7_2
    end
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "SetupLang"
  L3_2.value = L1_2
  L2_2(L3_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    IsInintialized = true
    while true do
      L0_3 = PlayerId
      L0_3 = L0_3()
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityHealth
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L2_3 = L2_3 - 100
      L3_3 = GetEntityMaxHealth
      L4_3 = L1_3
      L3_3 = L3_3(L4_3)
      L3_3 = L3_3 - 100
      L2_3 = L2_3 / L3_3
      L3_3 = IsEntityInWater
      L4_3 = L1_3
      L3_3 = L3_3(L4_3)
      if L3_3 then
        L3_3 = StartOxygenThread
        L4_3 = L1_3
        L3_3(L4_3)
      else
        L3_3 = HideComponent
        L4_3 = "oxygen"
        L3_3(L4_3)
      end
      L3_3 = ComponentsVariables
      L3_3 = L3_3.location
      if true ~= L3_3 then
        L3_3 = ComponentsVariables
        L3_3 = L3_3.location
        if "inCar" ~= L3_3 then
          goto lbl_48
        end
        L3_3 = IsPedInAnyVehicle
        L4_3 = L1_3
        L5_3 = false
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 then
          goto lbl_48
        end
      end
      L3_3 = ShowComponent
      L4_3 = "location"
      L3_3(L4_3)
      goto lbl_51
      ::lbl_48::
      L3_3 = HideComponent
      L4_3 = "location"
      L3_3(L4_3)
      ::lbl_51::
      L3_3 = false
      L4_3 = Config
      L4_3 = L4_3.Framework
      if "QBCore" == L4_3 then
        L4_3 = Core
        L4_3 = L4_3.Functions
        L4_3 = L4_3.GetPlayerData
        L4_3 = L4_3()
        L5_3 = L4_3
        if L5_3 then
          L5_3 = L5_3.metadata
        end
        if L5_3 then
          L5_3 = L4_3.metadata
          L5_3 = L5_3.isdead
          L3_3 = L5_3 or L3_3
          if not L5_3 then
            L5_3 = L4_3.metadata
            L3_3 = L5_3.inlaststand
          end
        end
      end
      L4_3 = MyStatus
      L5_3 = GetServerId
      L5_3 = L5_3()
      L4_3.ServerId = L5_3
      L4_3 = MyStatus
      if L3_3 then
        L5_3 = 0
      end
      L5_3 = L2_3 or L5_3
      if not L5_3 and (not (L2_3 <= 1) or not L2_3) then
        L5_3 = 1
      end
      L4_3.Health = L5_3
      L4_3 = MyStatus
      L5_3 = MyStatus
      L5_3 = L5_3.Health
      L4_3.Health2 = L5_3
      L4_3 = MyStatus
      L5_3 = GetPedArmour
      L6_3 = L1_3
      L5_3 = L5_3(L6_3)
      L6_3 = GetPlayerMaxArmour
      L7_3 = L0_3
      L6_3 = L6_3(L7_3)
      L5_3 = L5_3 / L6_3
      L4_3.Vest = L5_3
      L4_3 = MyStatus
      L4_3 = L4_3.Vest
      L4_3 = L4_3 * 100
      if L4_3 > 0 then
        L5_3 = ComponentsVariables
        L5_3 = L5_3.healthAndVest
        if L4_3 < L5_3 then
          L5_3 = ShowComponent
          L6_3 = "healthAndVest"
          L5_3(L6_3)
          L5_3 = HideComponent
          L6_3 = "health"
          L5_3(L6_3)
      end
      else
        if L4_3 <= 0 then
          L5_3 = ComponentsVariables
          L5_3 = L5_3.healthAndVest
          L6_3 = MyStatus
          L6_3 = L6_3.Health
          if L5_3 > L6_3 then
            L5_3 = HideComponent
            L6_3 = "healthAndVest"
            L5_3(L6_3)
            L5_3 = ShowComponent
            L6_3 = "health"
            L5_3(L6_3)
        end
        else
          L5_3 = HideComponent
          L6_3 = "healthAndVest"
          L5_3(L6_3)
          L5_3 = HideComponent
          L6_3 = "health"
          L5_3(L6_3)
        end
      end
      L5_3 = ComponentsVariables
      L5_3 = L5_3.stress
      L6_3 = MyStatus
      L6_3 = L6_3.Stress
      if L5_3 < L6_3 then
        L5_3 = ShowComponent
        L6_3 = "stress"
        L7_3 = true
        L5_3(L6_3, L7_3)
      else
        L5_3 = HideComponent
        L6_3 = "stress"
        L7_3 = true
        L5_3(L6_3, L7_3)
      end
      L5_3 = ComponentsVariables
      L5_3 = L5_3.food
      L6_3 = MyStatus
      L6_3 = L6_3.Thirst
      if not (L5_3 > L6_3) then
        L5_3 = ComponentsVariables
        L5_3 = L5_3.food
        L6_3 = MyStatus
        L6_3 = L6_3.Hunger
        if not (L5_3 > L6_3) then
          goto lbl_171
        end
      end
      L5_3 = ShowComponent
      L6_3 = "food"
      L5_3(L6_3)
      goto lbl_174
      ::lbl_171::
      L5_3 = HideComponent
      L6_3 = "food"
      L5_3(L6_3)
      ::lbl_174::
      L5_3 = ComponentsVariables
      L5_3 = L5_3.CinematicMode
      if L5_3 then
        RadarHiddenByCinematic = true
        L5_3 = ShowComponent
        L6_3 = "cinematic"
        L5_3(L6_3)
      else
        RadarHiddenByCinematic = false
        L5_3 = HideComponent
        L6_3 = "cinematic"
        L5_3(L6_3)
      end
      L5_3 = MyStatus
      L5_3 = L5_3.SocietyMoney
      if nil ~= L5_3 then
        L5_3 = ShowComponent
        L6_3 = "society_money"
        L5_3(L6_3)
      else
        L5_3 = HideComponent
        L6_3 = "society_money"
        L5_3(L6_3)
      end
      L5_3 = 1
      L6_3 = Config
      L6_3 = L6_3.StatusNotifications
      L6_3 = #L6_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = MyStatus
        L10_3 = Config
        L10_3 = L10_3.StatusNotifications
        L10_3 = L10_3[L8_3]
        L10_3 = L10_3.status
        L9_3 = L9_3[L10_3]
        if nil ~= L9_3 then
          L9_3 = false
          L10_3 = type
          L11_3 = Config
          L11_3 = L11_3.StatusNotifications
          L11_3 = L11_3[L8_3]
          L11_3 = L11_3.lowerThan
          L10_3 = L10_3(L11_3)
          if "number" == L10_3 then
            L10_3 = MyStatus
            L11_3 = Config
            L11_3 = L11_3.StatusNotifications
            L11_3 = L11_3[L8_3]
            L11_3 = L11_3.status
            L10_3 = L10_3[L11_3]
            L11_3 = Config
            L11_3 = L11_3.StatusNotifications
            L11_3 = L11_3[L8_3]
            L11_3 = L11_3.lowerThan
            L11_3 = L11_3 / 100
            if L10_3 <= L11_3 then
              L9_3 = true
            else
              L10_3 = Config
              L10_3 = L10_3.StatusNotifications
              L10_3 = L10_3[L8_3]
              L10_3.send = false
            end
          end
          L10_3 = type
          L11_3 = Config
          L11_3 = L11_3.StatusNotifications
          L11_3 = L11_3[L8_3]
          L11_3 = L11_3.biggerThan
          L10_3 = L10_3(L11_3)
          if "number" == L10_3 then
            L10_3 = MyStatus
            L11_3 = Config
            L11_3 = L11_3.StatusNotifications
            L11_3 = L11_3[L8_3]
            L11_3 = L11_3.status
            L10_3 = L10_3[L11_3]
            L11_3 = Config
            L11_3 = L11_3.StatusNotifications
            L11_3 = L11_3[L8_3]
            L11_3 = L11_3.biggerThan
            L11_3 = L11_3 / 100
            if L10_3 >= L11_3 then
              L9_3 = true
            else
              L10_3 = Config
              L10_3 = L10_3.StatusNotifications
              L10_3 = L10_3[L8_3]
              L10_3.send = false
            end
          end
          if L9_3 then
            L10_3 = Config
            L10_3 = L10_3.StatusNotifications
            L10_3 = L10_3[L8_3]
            L10_3 = L10_3.send
            if not L10_3 then
              L10_3 = Config
              L10_3 = L10_3.StatusNotifications
              L10_3 = L10_3[L8_3]
              L10_3.send = true
              L10_3 = Notify
              L11_3 = Config
              L11_3 = L11_3.StatusNotifications
              L11_3 = L11_3[L8_3]
              L11_3 = L11_3.notifyMessage
              L12_3 = "info"
              L13_3 = Config
              L13_3 = L13_3.StatusNotifications
              L13_3 = L13_3[L8_3]
              L13_3 = L13_3.notifyTitle
              L10_3(L11_3, L12_3, L13_3)
            end
          end
        end
      end
      L5_3 = L0_1
      L6_3 = 500
      L5_3[L6_3] = true
      L5_3 = Citizen
      L5_3 = L5_3.Wait
      L6_3 = 500
      L5_3(L6_3)
    end
  end
  L2_2(L3_2)
  L2_2 = {}
  L3_2 = "N"
  L4_2 = "NE"
  L5_2 = "E"
  L6_2 = "SE"
  L7_2 = "S"
  L8_2 = "SW"
  L9_2 = "W"
  L10_2 = "NW"
  L11_2 = "N"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    while true do
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = GetStreetNameAtCoord
      L3_3 = L1_3.x
      L4_3 = L1_3.y
      L5_3 = L1_3.z
      L2_3, L3_3 = L2_3(L3_3, L4_3, L5_3)
      L4_3 = MyStatus
      L5_3 = GetStreetNameFromHashKey
      L6_3 = L2_3
      L5_3 = L5_3(L6_3)
      L4_3.Street1 = L5_3
      L4_3 = MyStatus
      L5_3 = GetStreetNameFromHashKey
      L6_3 = L3_3
      L5_3 = L5_3(L6_3)
      L4_3.Street2 = L5_3
      L4_3 = string
      L4_3 = L4_3.len
      L5_3 = MyStatus
      L5_3 = L5_3.Street2
      L4_3 = L4_3(L5_3)
      if L4_3 < 1 then
        L4_3 = MyStatus
        L5_3 = Config
        L5_3 = L5_3.Lang
        L5_3 = L5_3.Location
        L4_3.Street2 = L5_3
      end
      L4_3 = MyStatus
      L4_3 = L4_3.Frequency
      if 0 ~= L4_3 then
        L4_3 = MyStatus
        L4_3 = L4_3.Frequency
        if nil ~= L4_3 then
          goto lbl_45
        end
      end
      L4_3 = HideComponent
      L5_3 = "radio"
      L4_3(L5_3)
      goto lbl_54
      ::lbl_45::
      L4_3 = Config
      L4_3 = L4_3.CurrentSettings
      L4_3 = L4_3.radio
      if true == L4_3 then
        L4_3 = ShowComponent
        L5_3 = "radio"
        L6_3 = true
        L4_3(L5_3, L6_3)
      end
      ::lbl_54::
      L4_3 = GetClockHours
      L4_3 = L4_3()
      L5_3 = GetClockMinutes
      L5_3 = L5_3()
      L6_3 = L4_3 * 60
      L6_3 = L6_3 + L5_3
      L7_3 = Config
      L7_3 = L7_3.DarkModeStartsAt
      L8_3 = L7_3
      L7_3 = L7_3.match
      L9_3 = "^(%d+):(%d+)$"
      L7_3, L8_3 = L7_3(L8_3, L9_3)
      L9_3 = Config
      L9_3 = L9_3.DarkModeEndsAt
      L10_3 = L9_3
      L9_3 = L9_3.match
      L11_3 = "^(%d+):(%d+)$"
      L9_3, L10_3 = L9_3(L10_3, L11_3)
      L11_3 = tonumber
      L12_3 = L7_3
      L11_3 = L11_3(L12_3)
      L11_3 = L11_3 * 60
      L12_3 = tonumber
      L13_3 = L8_3
      L12_3 = L12_3(L13_3)
      L11_3 = L11_3 + L12_3
      L12_3 = tonumber
      L13_3 = L9_3
      L12_3 = L12_3(L13_3)
      L12_3 = L12_3 * 60
      L13_3 = tonumber
      L14_3 = L10_3
      L13_3 = L13_3(L14_3)
      L12_3 = L12_3 + L13_3
      if L11_3 < L12_3 then
        L13_3 = MyStatus
        L14_3 = L6_3 >= L11_3 and L6_3 <= L12_3
        L13_3.DarkMode = L14_3
      else
        L13_3 = MyStatus
        L14_3 = L6_3 >= L11_3 or L6_3 <= L12_3
        L13_3.DarkMode = L14_3
      end
      L13_3 = MyStatus
      L14_3 = MyStatus
      L14_3 = L14_3.DarkMode
      L14_3 = not L14_3
      L13_3.DarkMode = L14_3
      L13_3 = MyStatus
      L14_3 = L3_1
      L15_3 = L4_3
      L14_3 = L14_3(L15_3)
      L15_3 = ":"
      L16_3 = L3_1
      L17_3 = L5_3
      L16_3 = L16_3(L17_3)
      L14_3 = L14_3 .. L15_3 .. L16_3
      L13_3.Time = L14_3
      L13_3 = L0_1
      L14_3 = 1000
      L13_3[L14_3] = true
      L13_3 = Citizen
      L13_3 = L13_3.Wait
      L14_3 = 1000
      L13_3(L14_3)
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    while true do
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetSelectedPedWeapon
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = Config
      L2_3 = L2_3.Weapons
      L2_3 = L2_3[L1_3]
      if L2_3 then
        L2_3 = Config
        L2_3 = L2_3.CurrentSettings
        if L2_3 then
          L2_3 = Config
          L2_3 = L2_3.CurrentSettings
          L2_3 = L2_3.weapon
          if L2_3 then
            L2_3 = MyStatus
            L3_3 = Config
            L3_3 = L3_3.Weapons
            L3_3 = L3_3[L1_3]
            L3_3 = L3_3.label
            L2_3.Weapon = L3_3
            L2_3 = Config
            L2_3 = L2_3.Weapons
            L2_3 = L2_3[L1_3]
            L2_3 = L2_3.displayAmmo
            if L2_3 then
              L2_3 = ShowComponent
              L3_3 = "ammo"
              L2_3(L3_3)
              L2_3 = GetAmmoInClip
              L3_3 = L0_3
              L4_3 = L1_3
              L2_3, L3_3 = L2_3(L3_3, L4_3)
              L4_3 = MyStatus
              L4_3.ClipAmmo = L3_3
              L4_3 = GetAmmoInPedWeapon
              L5_3 = L0_3
              L6_3 = L1_3
              L4_3 = L4_3(L5_3, L6_3)
              L5_3 = MyStatus
              L5_3 = L5_3.ClipAmmo
              if L4_3 == L5_3 then
                L5_3 = MyStatus
                L5_3.TotalAmmo = 0
              else
                L5_3 = MyStatus
                L6_3 = L4_3 - L3_3
                L5_3.TotalAmmo = L6_3
              end
            else
              L2_3 = HideComponent
              L3_3 = "ammo"
              L2_3(L3_3)
            end
            L2_3 = ShowComponent
            L3_3 = "weapon"
            L2_3(L3_3)
        end
      end
      else
        L2_3 = HideComponent
        L3_3 = "weapon"
        L2_3(L3_3)
        L2_3 = HideComponent
        L3_3 = "ammo"
        L2_3(L3_3)
      end
      L2_3 = nil
      L3_3 = Config
      L3_3 = L3_3.CompassFollowGameCam
      if L3_3 then
        L3_3 = Round
        L4_3 = GetGameplayCamRot
        L5_3 = 0
        L4_3 = L4_3(L5_3)
        L4_3 = L4_3.z
        L4_3 = L4_3 + 360.0
        L4_3 = L4_3 % 360.0
        L5_3 = 360.0
        L4_3 = L5_3 - L4_3
        L3_3 = L3_3(L4_3)
        L2_3 = L3_3
      else
        L3_3 = Round
        L4_3 = GetEntityHeading
        L5_3 = L0_3
        L4_3 = L4_3(L5_3)
        L5_3 = 360.0
        L4_3 = L5_3 - L4_3
        L3_3 = L3_3(L4_3)
        L2_3 = L3_3
      end
      if 360 == L2_3 then
        L2_3 = 0
      end
      L3_3 = MyStatus
      L4_3 = math
      L4_3 = L4_3.floor
      L5_3 = L2_3 + 22.5
      L5_3 = L5_3 % 360
      L5_3 = L5_3 / 45
      L4_3 = L4_3(L5_3)
      L5_3 = L4_3 + 1
      L4_3 = L2_2
      L4_3 = L4_3[L5_3]
      L3_3.Compass = L4_3
      L3_3 = MyStatus
      L4_3 = IsPauseMenuActive
      L4_3 = L4_3()
      L3_3.IsInPausemenu = L4_3
      L3_3 = MyStatus
      L4_3 = NetworkIsPlayerTalking
      L5_3 = PlayerId
      L5_3, L6_3 = L5_3()
      L4_3 = L4_3(L5_3, L6_3)
      if L4_3 then
        L4_3 = 1
        if L4_3 then
          goto lbl_132
        end
      end
      L4_3 = 0
      ::lbl_132::
      L3_3.IsTalking = L4_3
      L3_3 = IsPlayerFreeAiming
      L4_3 = PlayerId
      L4_3, L5_3, L6_3 = L4_3()
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      if L3_3 then
        L3_3 = L0_1
        L4_3 = 300
        L3_3[L4_3] = nil
        L3_3 = L0_1
        L3_3[100] = true
        L3_3 = Citizen
        L3_3 = L3_3.Wait
        L4_3 = 100
        L3_3(L4_3)
      else
        L3_3 = L0_1
        L3_3[100] = nil
        L3_3 = L0_1
        L4_3 = 300
        L3_3[L4_3] = true
        L3_3 = Citizen
        L3_3 = L3_3.Wait
        L4_3 = 300
        L3_3(L4_3)
      end
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = 1000
      L1_3 = GetVehiclePedIsIn
      L2_3 = PlayerPedId
      L2_3 = L2_3()
      L3_3 = false
      L1_3 = L1_3(L2_3, L3_3)
      if 0 ~= L1_3 then
        L2_3 = ShouldDisplaySpeedometer
        L3_3 = L1_3
        L2_3 = L2_3(L3_3)
        if L2_3 then
          L2_3 = L0_1
          L2_3[200] = true
          L2_3 = L0_1
          L3_3 = 1000
          L2_3[L3_3] = nil
          L0_3 = 200
          L2_3 = MyStatus
          L2_3.IsInVehicle = true
          L2_3 = MyStatus
          L3_3 = Config
          L3_3 = L3_3.UseMPH
          if L3_3 then
            L3_3 = "mph"
            if L3_3 then
              goto lbl_31
            end
          end
          L3_3 = "kmh"
          ::lbl_31::
          L2_3.VehicleSpeedUnit = L3_3
          L2_3 = MyStatus
          L3_3 = GetEntitySpeed
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L2_3.VehicleSpeed = L3_3
          L2_3 = MyStatus
          L3_3 = MyStatus
          L3_3 = L3_3.VehicleSpeed
          L4_3 = GetVehicleEstimatedMaxSpeed
          L5_3 = L1_3
          L4_3 = L4_3(L5_3)
          L5_3 = SpeedMultiplier
          L4_3 = L4_3 * L5_3
          L4_3 = L4_3 / 0.8
          L3_3 = L3_3 / L4_3
          L2_3.VehicleSpeedStatus = L3_3
          L2_3 = MyStatus
          L3_3 = GetIsVehicleEngineRunning
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          if L3_3 then
            L3_3 = GetVehicleCurrentRpm
            L4_3 = L1_3
            L3_3 = L3_3(L4_3)
            if L3_3 then
              goto lbl_63
            end
          end
          L3_3 = 0
          ::lbl_63::
          L2_3.RPM = L3_3
          L2_3 = MyStatus
          L3_3 = FuelGetter
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L2_3.Fuel = L3_3
          L2_3 = MyStatus
          L3_3 = GetCurrentGear
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L2_3.CurrentGear = L3_3
          L2_3 = MyStatus
          L3_3 = GetMaxGear
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L2_3.HighGear = L3_3
          L2_3 = MyStatus
          L3_3 = GetVehicleEngineHealth
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L3_3 = L3_3 / 1000
          L2_3.Damage = L3_3
          L2_3 = MyStatus
          L3_3 = GetIsVehicleEngineRunning
          L4_3 = L1_3
          L3_3 = L3_3(L4_3)
          L3_3 = 1 == L3_3
          L2_3.VehicleEngineState = L3_3
          L2_3 = GetVehicleLightsState
          L3_3 = L1_3
          L2_3, L3_3, L4_3 = L2_3(L3_3)
          L5_3 = MyStatus
          L6_3 = 1 == L4_3
          L5_3.VehicleLightsState = L6_3
          L5_3 = MyStatus
          L6_3 = GetVehicleDoorLockStatus
          L7_3 = L1_3
          L6_3 = L6_3(L7_3)
          L6_3 = 2 == L6_3
          L5_3.VehicleDoorsLocked = L6_3
      end
      else
        L2_3 = MyStatus
        L2_3.IsInVehicle = false
        L2_3 = MyStatus
        L2_3.BeltsState = false
        L2_3 = L0_1
        L3_3 = 1000
        L2_3[L3_3] = true
        L2_3 = L0_1
        L2_3[200] = nil
      end
      L2_3 = Citizen
      L2_3 = L2_3.Wait
      L3_3 = L0_3
      L2_3(L3_3)
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = 2000
      L1_3 = pairs
      L2_3 = L0_1
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        if L5_3 <= L0_3 and L0_3 > 0 then
          L0_3 = L5_3
        end
      end
      L1_3 = {}
      L2_3 = pairs
      L3_3 = MyStatus
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = L4_1
        L8_3 = L8_3[L6_3]
        if L7_3 ~= L8_3 then
          L1_3[L6_3] = L7_3
        end
      end
      L2_3 = DeepCopy
      L3_3 = MyStatus
      L2_3 = L2_3(L3_3)
      L4_1 = L2_3
      L2_3 = 0
      L3_3 = pairs
      L4_3 = L1_3
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L2_3 = L2_3 + 1
        if "Cash" == L7_3 or "Bank" == L7_3 or "DirtMoney" == L7_3 or "SocietyMoney" == L7_3 then
          L9_3 = FormatMoney
          L10_3 = L8_3
          L9_3 = L9_3(L10_3)
          L1_3[L7_3] = L9_3
        end
      end
      if L2_3 > 0 then
        L3_3 = Config
        L3_3 = L3_3.EnableSpeedometer
        if not L3_3 then
          L3_3 = L1_3.IsInVehicle
          if nil ~= L3_3 then
            L1_3.IsInVehicle = nil
          end
        end
        L3_3 = SendNUIMessage
        L4_3 = {}
        L4_3.action = "update"
        L4_3.status = L1_3
        L3_3(L4_3)
      end
      if nil ~= L0_3 and L0_3 > 0 then
        L3_3 = Citizen
        L3_3 = L3_3.Wait
        L4_3 = L0_3
        L3_3(L4_3)
      else
        L3_3 = Citizen
        L3_3 = L3_3.Wait
        L4_3 = 200
        L3_3(L4_3)
      end
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = 500
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = PlayerId
      L2_3 = L2_3()
      L3_3 = GetPlayerSprintStaminaRemaining
      L4_3 = L2_3
      L3_3 = L3_3(L4_3)
      L4_3 = 100
      L3_3 = L4_3 - L3_3
      if 0 ~= L3_3 then
        L4_3 = maxStamina
        if 0 ~= L4_3 then
          L4_3 = MyStatus
          L5_3 = L3_3 / 100
          L4_3.Stamina = L5_3
        end
      end
      L4_3 = ComponentsVariables
      L4_3 = L4_3.stamina
      L5_3 = MyStatus
      L5_3 = L5_3.Stamina
      if L4_3 > L5_3 then
        L4_3 = ShowComponent
        L5_3 = "stamina"
        L4_3(L5_3)
      else
        L4_3 = HideComponent
        L5_3 = "stamina"
        L4_3(L5_3)
      end
      L4_3 = IsPedRunning
      L5_3 = L1_3
      L4_3 = L4_3(L5_3)
      if not L4_3 then
        L4_3 = IsPedSwimming
        L5_3 = L1_3
        L4_3 = L4_3(L5_3)
        if not L4_3 then
          goto lbl_45
        end
      end
      L0_3 = 200
      ::lbl_45::
      L4_3 = Wait
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    while true do
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = Config
      L0_3 = L0_3.ComponentsToHide
      L1_3 = 1
      L2_3 = #L0_3
      L3_3 = 1
      for L4_3 = L1_3, L2_3, L3_3 do
        L5_3 = HideHudComponentThisFrame
        L6_3 = L0_3[L4_3]
        L5_3(L6_3)
      end
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = false
    L1_3 = RequestScaleformMovie
    L2_3 = "minimap"
    L1_3 = L1_3(L2_3)
    L2_3 = SetRadarBigmapEnabled
    L3_3 = true
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = SetRadarBigmapEnabled
    L3_3 = false
    L4_3 = false
    L2_3(L3_3, L4_3)
    while true do
      L2_3 = IsMapLoopEnabled
      if L2_3 then
        L2_3 = PlayerPedId
        L2_3 = L2_3()
        L3_3 = BeginScaleformMovieMethod
        L4_3 = L1_3
        L5_3 = "SETUP_HEALTH_ARMOUR"
        L3_3(L4_3, L5_3)
        L3_3 = ScaleformMovieMethodAddParamInt
        L4_3 = 3
        L3_3(L4_3)
        L3_3 = EndScaleformMovieMethod
        L3_3()
        L3_3 = Config
        L3_3 = L3_3.BigRadarKey
        if L3_3 then
          L3_3 = IsControlPressed
          L4_3 = 0
          L5_3 = Config
          L5_3 = L5_3.BigRadarKey
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            if not L0_3 then
              L0_3 = true
              L3_3 = Config
              L3_3 = L3_3.ShowRadarIfHidden
              if L3_3 then
                ForceDisplayRadar = true
              end
            end
          elseif L0_3 then
            L0_3 = false
            L3_3 = Config
            L3_3 = L3_3.ShowRadarIfHidden
            if L3_3 then
              ForceDisplayRadar = false
            end
          end
        end
        L3_3 = false
        L4_3 = ComponentsVariables
        L4_3 = L4_3.Map
        if true ~= L4_3 then
          L4_3 = ComponentsVariables
          L4_3 = L4_3.Map
          if "inCar" ~= L4_3 then
            goto lbl_71
          end
          L4_3 = IsPedInAnyVehicle
          L5_3 = L2_3
          L6_3 = false
          L4_3 = L4_3(L5_3, L6_3)
          if not L4_3 then
            goto lbl_71
          end
        end
        L3_3 = true
        ::lbl_71::
        L4_3 = ForceDisplayRadar
        if not L4_3 then
          L4_3 = L3_3
        end
        L5_3 = IsRadarHidden
        L5_3 = L5_3()
        L6_3 = IsBigmapActive
        L6_3 = L6_3()
        L7_3 = HiddenByExport
        if L7_3 then
          L4_3 = false
        end
        L7_3 = RadarHiddenByCinematic
        if L7_3 then
          L4_3 = false
        end
        if not ((not L5_3 or not L4_3) and (L5_3 or L4_3)) or not L6_3 and L0_3 or L6_3 and not L0_3 then
          L7_3 = DisplayRadar
          L8_3 = L4_3
          L7_3(L8_3)
          L7_3 = SetBigmapActive
          L8_3 = L0_3
          L9_3 = false
          L7_3(L8_3, L9_3)
          L7_3 = Config
          L7_3 = L7_3.EnableRadarZoom
          if L7_3 then
            L7_3 = SetRadarZoom
            L8_3 = Config
            L8_3 = L8_3.RadarZoom
            L7_3(L8_3)
          end
          L7_3 = Wait
          L8_3 = 10
          L7_3(L8_3)
          L7_3 = UpdateNotifyPosition
          L7_3()
        end
      end
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
    end
  end
  L3_2(L4_2)
end
StartHudThread = L6_1
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = NuiLoaded
  if not L4_2 then
    return
  end
  if A0_2 then
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if 0 ~= L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  if nil ~= A1_2 then
    L4_2 = type
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_22
    end
  end
  A1_2 = "info"
  ::lbl_22::
  if A2_2 then
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if 0 ~= L4_2 then
      goto lbl_33
    end
  end
  L4_2 = Config
  L4_2 = L4_2.Lang
  A2_2 = L4_2.DefaultNotification
  ::lbl_33::
  if nil == A3_2 or false == A3_2 then
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2 * 0.09
    A3_2 = L4_2 + 2000
  end
  if nil ~= A3_2 then
    L4_2 = 5000
    if not (A3_2 < L4_2) then
      goto lbl_51
    end
  end
  A3_2 = 5000
  ::lbl_51::
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "Notify"
  L5_2.type = A1_2
  L5_2.title = A2_2
  L5_2.value = A0_2
  L5_2.time = A3_2
  L4_2(L5_2)
end
Notify = L6_1
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = NuiLoaded
  if not L1_2 then
    return
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "ShowHelpNotification"
  L2_2.value = A0_2
  L1_2(L2_2)
end
ShowHelpNotification = L6_1
L6_1 = nil
L7_1 = {}
function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  if nil == A0_2 then
    return
  end
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L6_1 = L1_2
  L1_2 = L7_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = L7_1
    L1_2[A0_2] = true
    L1_2 = ShowHelpNotification
    L2_2 = A0_2
    L1_2(L2_2)
  end
  L1_2 = SetTimeout
  L2_2 = 100
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = L6_1
    L0_3 = L0_3 - L1_3
    if L0_3 > 50 then
      L0_3 = false
      L1_3 = pairs
      L2_3 = L7_1
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3 in L1_3, L2_3, L3_3, L4_3 do
        L6_3 = L7_1
        L6_3[L5_3] = nil
        L0_3 = true
      end
      if L0_3 then
        L1_3 = HideHelpNotification
        L1_3()
      end
    end
  end
  L1_2(L2_2, L3_2)
end
ShowHelpNotificationWhile = L8_1
function L8_1()
  local L0_2, L1_2
  L0_2 = NuiLoaded
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "HideHelpNotification"
  L0_2(L1_2)
end
HideHelpNotification = L8_1
L8_1 = {}
L8_1.duration = 0
L8_1.label = ""
L8_1.useWhileDead = false
L8_1.canCancel = true
L9_1 = {}
L9_1.disableMovement = false
L9_1.disableCarMovement = false
L9_1.disableMouse = false
L9_1.disableCombat = false
L8_1.controlDisables = L9_1
L9_1 = {}
L9_1.animDict = nil
L9_1.anim = nil
L9_1.flags = 49
L9_1.task = nil
L8_1.animation = L9_1
L9_1 = {}
L9_1.model = nil
L9_1.bone = nil
L10_1 = vec3
L11_1 = 0.0
L12_1 = 0.0
L13_1 = 0.0
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vec3
L11_1 = 0.0
L12_1 = 0.0
L13_1 = 0.0
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L8_1.prop = L9_1
L9_1 = {}
L9_1.model = nil
L9_1.bone = nil
L10_1 = vec3
L11_1 = 0.0
L12_1 = 0.0
L13_1 = 0.0
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vec3
L11_1 = 0.0
L12_1 = 0.0
L13_1 = 0.0
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L8_1.propTwo = L9_1
L9_1 = DeepCopy
L10_1 = L8_1
L9_1 = L9_1(L10_1)
L10_1 = false
L11_1 = false
L12_1 = nil
L13_1 = nil
L14_1 = false
L15_1 = false
L16_1 = false
L17_1 = {}
L18_1 = {}
L19_1 = 1
L20_1 = 2
L21_1 = 106
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L17_1.disableMouse = L18_1
L18_1 = {}
L19_1 = 30
L20_1 = 31
L21_1 = 36
L22_1 = 21
L23_1 = 75
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L18_1[4] = L22_1
L18_1[5] = L23_1
L17_1.disableMovement = L18_1
L18_1 = {}
L19_1 = 63
L20_1 = 64
L21_1 = 71
L22_1 = 72
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L18_1[4] = L22_1
L17_1.disableCarMovement = L18_1
L18_1 = {}
L19_1 = 24
L20_1 = 25
L21_1 = 37
L22_1 = 47
L23_1 = 58
L24_1 = 140
L25_1 = 141
L26_1 = 142
L27_1 = 143
L28_1 = 263
L29_1 = 264
L30_1 = 257
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L18_1[4] = L22_1
L18_1[5] = L23_1
L18_1[6] = L24_1
L18_1[7] = L25_1
L18_1[8] = L26_1
L18_1[9] = L27_1
L18_1[10] = L28_1
L18_1[11] = L29_1
L18_1[12] = L30_1
L17_1.disableCombat = L18_1
function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = A0_2.model
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "string" == L3_2 then
    L3_2 = GetHashKey
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  L3_2 = RequestModel
  L4_2 = L2_2
  L3_2(L4_2)
  while true do
    L3_2 = HasModelLoaded
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = Wait
    L4_2 = 5
    L3_2(L4_2)
  end
  L3_2 = GetOffsetFromEntityInWorldCoords
  L4_2 = A1_2
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = 0.0
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = CreateObject
  L5_2 = L2_2
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L9_2 = true
  L10_2 = true
  L11_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = ObjToNet
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = SetNetworkIdExistsOnAllMachines
  L7_2 = L5_2
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = NetworkUseHighPrecisionBlending
  L7_2 = L5_2
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = SetNetworkIdCanMigrate
  L7_2 = L5_2
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = GetPedBoneIndex
  L7_2 = A1_2
  L8_2 = A0_2.bone
  if not L8_2 then
    L8_2 = 60309
  end
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = AttachEntityToEntity
  L8_2 = L4_2
  L9_2 = A1_2
  L10_2 = L6_2
  L11_2 = A0_2.coords
  L11_2 = L11_2.x
  L12_2 = A0_2.coords
  L12_2 = L12_2.y
  L13_2 = A0_2.coords
  L13_2 = L13_2.z
  L14_2 = A0_2.rotation
  L14_2 = L14_2.x
  L15_2 = A0_2.rotation
  L15_2 = L15_2.y
  L16_2 = A0_2.rotation
  L16_2 = L16_2.z
  L17_2 = true
  L18_2 = true
  L19_2 = false
  L20_2 = true
  L21_2 = 0
  L22_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  return L5_2
end
function L19_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    while true do
      L0_3 = L10_1
      if not L0_3 then
        break
      end
      L0_3 = pairs
      L1_3 = L8_1.controlDisables
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        if L5_3 then
          L6_3 = L17_1
          L6_3 = L6_3[L4_3]
          if L6_3 then
            L6_3 = ipairs
            L7_3 = L17_1
            L7_3 = L7_3[L4_3]
            L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)
            for L10_3, L11_3 in L6_3, L7_3, L8_3, L9_3 do
              L12_3 = DisableControlAction
              L13_3 = 0
              L14_3 = L11_3
              L15_3 = true
              L12_3(L13_3, L14_3, L15_3)
            end
          end
        end
      end
      L0_3 = L8_1.controlDisables
      L0_3 = L0_3.disableCombat
      if L0_3 then
        L0_3 = DisablePlayerFiring
        L1_3 = PlayerId
        L1_3 = L1_3()
        L2_3 = true
        L0_3(L1_3, L2_3)
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = L10_1
  if L1_2 then
    L1_2 = L14_1
    if not L1_2 then
      L1_2 = L8_1.animation
      if L1_2 then
        L1_2 = L8_1.animation
        L1_2 = L1_2.task
        if L1_2 then
          L1_2 = TaskStartScenarioInPlace
          L2_2 = L0_2
          L3_2 = L8_1.animation
          L3_2 = L3_2.task
          L4_2 = 0
          L5_2 = true
          L1_2(L2_2, L3_2, L4_2, L5_2)
        else
          L1_2 = L8_1.animation
          L2_2 = L1_2.animDict
          if L2_2 then
            L2_2 = L1_2.anim
            if L2_2 then
              L2_2 = DoesEntityExist
              L3_2 = L0_2
              L2_2 = L2_2(L3_2)
              if L2_2 then
                L2_2 = IsEntityDead
                L3_2 = L0_2
                L2_2 = L2_2(L3_2)
                if not L2_2 then
                  L2_2 = RequestAnimDict
                  L3_2 = L1_2.animDict
                  L2_2(L3_2)
                  while true do
                    L2_2 = HasAnimDictLoaded
                    L3_2 = L1_2.animDict
                    L2_2 = L2_2(L3_2)
                    if L2_2 then
                      break
                    end
                    L2_2 = Wait
                    L3_2 = 5
                    L2_2(L3_2)
                  end
                  L2_2 = TaskPlayAnim
                  L3_2 = L0_2
                  L4_2 = L1_2.animDict
                  L5_2 = L1_2.anim
                  L6_2 = 3.0
                  L7_2 = 3.0
                  L8_2 = -1
                  L9_2 = L1_2.flags
                  if not L9_2 then
                    L9_2 = 49
                  end
                  L10_2 = 0
                  L11_2 = false
                  L12_2 = false
                  L13_2 = false
                  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
                end
              end
            end
          end
        end
        L1_2 = true
        L14_1 = L1_2
      end
    end
    L1_2 = L15_1
    if not L1_2 then
      L1_2 = L8_1.prop
      if L1_2 then
        L1_2 = L8_1.prop
        L1_2 = L1_2.model
        if L1_2 then
          L1_2 = L18_1
          L2_2 = L8_1.prop
          L3_2 = L0_2
          L1_2 = L1_2(L2_2, L3_2)
          L12_1 = L1_2
          L1_2 = true
          L15_1 = L1_2
        end
      end
    end
    L1_2 = L16_1
    if not L1_2 then
      L1_2 = L8_1.propTwo
      if L1_2 then
        L1_2 = L8_1.propTwo
        L1_2 = L1_2.model
        if L1_2 then
          L1_2 = L18_1
          L2_2 = L8_1.propTwo
          L3_2 = L0_2
          L1_2 = L1_2(L2_2, L3_2)
          L13_1 = L1_2
          L1_2 = true
          L16_1 = L1_2
        end
      end
    end
    L1_2 = L19_1
    L1_2()
  end
end
function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = L8_1.animation
  if L1_2 then
    L1_2 = L8_1.animation
    L1_2 = L1_2.task
    if not L1_2 then
      L1_2 = L8_1.animation
      L1_2 = L1_2.animDict
      if not L1_2 then
        goto lbl_30
      end
      L1_2 = L8_1.animation
      L1_2 = L1_2.anim
      if not L1_2 then
        goto lbl_30
      end
    end
    L1_2 = StopAnimTask
    L2_2 = L0_2
    L3_2 = L8_1.animation
    L3_2 = L3_2.animDict
    L4_2 = L8_1.animation
    L4_2 = L4_2.anim
    L5_2 = 1.0
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = ClearPedSecondaryTask
    L2_2 = L0_2
    L1_2(L2_2)
    goto lbl_33
    ::lbl_30::
    L1_2 = ClearPedTasks
    L2_2 = L0_2
    L1_2(L2_2)
  end
  ::lbl_33::
  L1_2 = L12_1
  if L1_2 then
    L1_2 = DetachEntity
    L2_2 = NetToObj
    L3_2 = L12_1
    L2_2 = L2_2(L3_2)
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DeleteObject
    L2_2 = NetToObj
    L3_2 = L12_1
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = L13_1
  if L1_2 then
    L1_2 = DetachEntity
    L2_2 = NetToObj
    L3_2 = L13_1
    L2_2 = L2_2(L3_2)
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DeleteObject
    L2_2 = NetToObj
    L3_2 = L13_1
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = L8_1.canCancel
  if L1_2 then
    L1_2 = HideHelpNotification
    L1_2()
  end
  L1_2 = false
  L10_1 = L1_2
  L1_2 = false
  L11_1 = L1_2
  L1_2 = nil
  L12_1 = L1_2
  L1_2 = nil
  L13_1 = L1_2
  L1_2 = false
  L14_1 = L1_2
  L1_2 = false
  L15_1 = L1_2
  L1_2 = false
  L16_1 = L1_2
  L1_2 = DeepCopy
  L2_2 = L9_1
  L1_2 = L1_2(L2_2)
  L8_1 = L1_2
  L1_2 = LocalPlayer
  L1_2 = L1_2.state
  L2_2 = L1_2
  L1_2 = L1_2.set
  L3_2 = "inv_busy"
  L4_2 = false
  L5_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
ActionCleanup = L21_1
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L4_2 = NuiLoaded
  if not L4_2 then
    return
  end
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = IsEntityDead
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = A0_2.useWhileDead
    if not L6_2 then
      goto lbl_76
    end
  end
  L6_2 = L10_1
  if not L6_2 then
    L6_2 = true
    L10_1 = L6_2
    L6_2 = false
    L7_2 = pairs
    L8_2 = A0_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = type
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if "table" == L13_2 then
        L13_2 = pairs
        L14_2 = L12_2
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = L8_1
          L19_2 = L19_2[L11_2]
          L19_2[L17_2] = L18_2
        end
      else
        L13_2 = L8_1
        L13_2[L11_2] = L12_2
      end
    end
    L7_2 = SendNUIMessage
    L8_2 = {}
    L8_2.action = "StartProgress"
    L9_2 = A0_2.label
    L8_2.value = L9_2
    L9_2 = A0_2.duration
    L8_2.time = L9_2
    L7_2(L8_2)
    L7_2 = A0_2.canCancel
    if L7_2 then
      L7_2 = ShowHelpNotification
      L8_2 = Config
      L8_2 = L8_2.Lang
      L8_2 = L8_2.CancelProgressHint
      L7_2(L8_2)
    end
    L7_2 = LocalPlayer
    L7_2 = L7_2.state
    L8_2 = L7_2
    L7_2 = L7_2.set
    L9_2 = "inv_busy"
    L10_2 = true
    L11_2 = true
    L7_2(L8_2, L9_2, L10_2, L11_2)
    L7_2 = L20_1
    L7_2()
    L7_2 = CreateThread
    function L8_2()
      local L0_3, L1_3, L2_3
      L0_3 = A1_2
      if L0_3 then
        L0_3 = A1_2
        L0_3()
      end
      while true do
        L0_3 = L10_1
        if not L0_3 then
          break
        end
        L0_3 = L11_1
        if L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 1
        L0_3(L1_3)
        L0_3 = A2_2
        if L0_3 then
          L0_3 = A2_2
          L0_3()
        end
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 73
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = A0_2.canCancel
          if L0_3 then
            L0_3 = TriggerEvent
            L1_3 = "progressbar:client:cancel"
            L0_3(L1_3)
            L0_3 = true
            L11_1 = L0_3
            L0_3 = true
            L6_2 = L0_3
            break
          end
        end
        L0_3 = IsEntityDead
        L1_3 = L4_2
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = A0_2.useWhileDead
          if not L0_3 then
            L0_3 = TriggerEvent
            L1_3 = "progressbar:client:cancel"
            L0_3(L1_3)
            L0_3 = true
            L11_1 = L0_3
            L0_3 = true
            L6_2 = L0_3
            break
          end
        end
      end
      while true do
        L0_3 = L10_1
        if not L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 10
        L0_3(L1_3)
      end
      L0_3 = A3_2
      if L0_3 then
        L0_3 = A3_2
        L1_3 = L6_2
        L0_3(L1_3)
      end
    end
    L7_2(L8_2)
  end
  ::lbl_76::
end
StartProgress = L21_1
L21_1 = RegisterNUICallback
L22_1 = "ProgressFinished"
function L23_1(A0_2, A1_2)
  local L2_2
  L2_2 = ActionCleanup
  L2_2()
end
L21_1(L22_1, L23_1)
function L21_1()
  local L0_2, L1_2
  L0_2 = NuiLoaded
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "StopProgress"
  L0_2(L1_2)
end
StopProgress = L21_1
L21_1 = RegisterNUICallback
L22_1 = "focusOff"
function L23_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "settings"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = UpdateNotifyPosition
  L2_2()
  L2_2 = Config
  L2_2.CurrentSettings = A0_2
  L2_2 = TriggerEvent
  L3_2 = "17mov_Hud:UpdateSettings"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.SpeedUnits
  if "kmh" == L2_2 then
    L2_2 = Config
    L2_2.UseMPH = false
  else
    L2_2 = Config
    L2_2.UseMPH = true
  end
  A0_2.SpeedUnits = nil
  A0_2.AutoTheme = nil
  A0_2.DarkMode = nil
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = Config
    L8_2 = L8_2.Components
    L8_2 = L8_2[L6_2]
    if false == L8_2 then
      A0_2[L6_2] = nil
    end
  end
  L2_2 = ComponentsVariables
  L3_2 = A0_2.CinematicMode
  L2_2.CinematicMode = L3_2
  A0_2.CinematicMode = nil
  L2_2 = ComponentsVariables
  L3_2 = A0_2.Map
  L2_2.Map = L3_2
  A0_2.Map = nil
  L2_2 = ComponentsVariables
  L3_2 = A0_2.location
  L2_2.location = L3_2
  A0_2.location = nil
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if true == L7_2 then
      L8_2 = ShowComponent
      L9_2 = L6_2
      L10_2 = true
      L8_2(L9_2, L10_2)
      L8_2 = ComponentsVariables
      L8_2 = L8_2[L6_2]
      if nil ~= L8_2 then
        if "stress" == L6_2 then
          L8_2 = ComponentsVariables
          L8_2[L6_2] = -1
        else
          L8_2 = ComponentsVariables
          L8_2[L6_2] = 101
        end
      end
    elseif false == L7_2 then
      L8_2 = HideComponent
      L9_2 = L6_2
      L10_2 = true
      L8_2(L9_2, L10_2)
      L8_2 = ComponentsVariables
      L8_2 = L8_2[L6_2]
      if nil ~= L8_2 then
        L8_2 = ComponentsVariables
        L8_2[L6_2] = 50
      end
    else
      L8_2 = ComponentsVariables
      L8_2[L6_2] = L7_2
    end
  end
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "sendTheme"
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L2_2 = {}
  L3_2 = {}
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-primary-light"]
  L3_2["--color-primary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-secondary-light"]
  L3_2["--color-secondary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-text-primary-light"]
  L3_2["--color-text-primary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-text-secondary-light"]
  L3_2["--color-text-secondary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-transparent-light"]
  L3_2["--color-transparent"] = L4_2
  L2_2.light = L3_2
  L3_2 = {}
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-primary-dark"]
  L3_2["--color-primary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-secondary-dark"]
  L3_2["--color-secondary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-text-primary-dark"]
  L3_2["--color-text-primary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-text-secondary-dark"]
  L3_2["--color-text-secondary"] = L4_2
  L4_2 = A0_2.theme
  L4_2 = L4_2["--color-transparent-dark"]
  L3_2["--color-transparent"] = L4_2
  L2_2.dark = L3_2
  L1_2.DefaultColors = L2_2
  L1_2 = TriggerEvent
  L2_2 = "17mov_Hud:UpdateTheme"
  L3_2 = Config
  L3_2 = L3_2.DefaultColors
  L1_2(L2_2, L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "nuiLoaded"
function L23_1()
  local L0_2, L1_2
  NuiLoaded = true
end
L21_1(L22_1, L23_1)
function L21_1()
  local L0_2, L1_2, L2_2
  L0_2 = IsInintialized
  if L0_2 then
    L0_2 = NuiLoaded
    if L0_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "OpenSettings"
  L0_2(L1_2)
end
OpenSettings = L21_1
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = Config
  L0_2 = L0_2.EnableSettings
  if true ~= L0_2 then
    L0_2 = Config
    L0_2 = L0_2.EnableSettings
    if nil ~= L0_2 then
      goto lbl_31
    end
  end
  L0_2 = RegisterCommand
  L1_2 = Config
  L1_2 = L1_2.CommandString
  if not L1_2 then
    L1_2 = "openHudSettings"
  end
  L2_2 = OpenSettings
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = RegisterKeyMapping
  L1_2 = Config
  L1_2 = L1_2.CommandString
  if not L1_2 then
    L1_2 = "openHudSettings"
  end
  L2_2 = Config
  L2_2 = L2_2.Lang
  L2_2 = L2_2.KeybindDescription
  L3_2 = "keyboard"
  L4_2 = Config
  L4_2 = L4_2.SettingsKeybind
  L0_2(L1_2, L2_2, L3_2, L4_2)
  ::lbl_31::
end
L21_1(L22_1)
L21_1 = Config
L21_1 = L21_1.SeatBelts
L21_1 = L21_1.Enable
if L21_1 then
  L21_1 = GetResourceState
  L22_1 = "qb-smallresources"
  L21_1 = L21_1(L22_1)
  if "started" == L21_1 then
    L21_1 = LoadResourceFile
    L22_1 = "qb-smallresources"
    L23_1 = "client/seatbelt.lua"
    L21_1 = L21_1(L22_1, L23_1)
    if nil ~= L21_1 then
      L21_1 = Config
      L21_1 = L21_1.SeatBelts
      L21_1.Enable = false
      L21_1 = CreateThread
      function L22_1()
        local L0_2, L1_2
        while true do
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 1000
          L0_2(L1_2)
          L0_2 = print
          L1_2 = "^5[INFORMATION]:^0 qb-smallresources with seatbelts found. Ignoring Hud seatbelts, please disable it in config (Config.SeatBelts.Enable)"
          L0_2(L1_2)
        end
      end
      L21_1(L22_1)
    end
  end
end
L21_1 = Config
L21_1 = L21_1.SeatBelts
L21_1 = L21_1.Enable
if L21_1 then
  L21_1 = GetResourceState
  L22_1 = "esx_cruisecontrol"
  L21_1 = L21_1(L22_1)
  if "started" == L21_1 then
    L21_1 = GetRegisteredCommands
    L21_1 = L21_1()
    L22_1 = false
    L23_1 = 1
    L24_1 = #L21_1
    L25_1 = 1
    for L26_1 = L23_1, L24_1, L25_1 do
      L27_1 = L21_1[L26_1]
      L27_1 = L27_1.name
      if "esx_cruisecontrol:ToggleSeatbelt" == L27_1 then
        L27_1 = Config
        L27_1 = L27_1.SeatBelts
        L27_1.Enable = false
        L22_1 = true
      end
    end
    if L22_1 then
      L23_1 = CreateThread
      function L24_1()
        local L0_2, L1_2
        while true do
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 1000
          L0_2(L1_2)
          L0_2 = print
          L1_2 = "^5[INFORMATION]:^0 esx_cruisecontrol with seatbelts found. Ignoring Hud seatbelts, please disable it in config (Config.SeatBelts.Enable)"
          L0_2(L1_2)
        end
      end
      L23_1(L24_1)
    end
  end
end
L21_1 = Config
L21_1 = L21_1.SeatBelts
L21_1 = L21_1.Enable
if L21_1 then
  L21_1 = false
  L22_1 = false
  L23_1 = false
  while true do
    L24_1 = NuiLoaded
    if L24_1 then
      break
    end
    L24_1 = Wait
    L25_1 = 100
    L24_1(L25_1)
  end
  L24_1 = RegisterNetEvent
  L25_1 = "17mov_Hud:playSound"
  function L26_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    if A1_2 then
      L2_2 = GetEntityCoords
      L3_2 = PlayerPedId
      L3_2, L4_2 = L3_2()
      L2_2 = L2_2(L3_2, L4_2)
      L3_2 = L2_2 - A1_2
      L3_2 = #L3_2
      L4_2 = Config
      L4_2 = L4_2.SeatBelts
      L4_2 = L4_2.TogglingSoundIsGlobalDistance
      if L3_2 > L4_2 then
        return
      end
    end
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "PlaySound"
    L3_2.value = A0_2
    L4_2 = Config
    L4_2 = L4_2.SeatBelts
    L4_2 = L4_2.TogglingSoundVolume
    L3_2.volume = L4_2
    L2_2(L3_2)
  end
  L24_1(L25_1, L26_1)
  function L24_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = GetEntityCoords
    L1_2 = PlayerPedId
    L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
    L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L1_2 = ""
    L2_2 = L21_1
    if L2_2 then
      L1_2 = "BeltsFasting"
    else
      L1_2 = "BeltsUnfasting"
    end
    L2_2 = Config
    L2_2 = L2_2.SeatBelts
    L2_2 = L2_2.TogglingSoundIsGlobal
    if L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "17mov_Hud:playSound"
      L4_2 = L1_2
      L5_2 = L0_2
      L2_2(L3_2, L4_2, L5_2)
    else
      L2_2 = TriggerEvent
      L3_2 = "17mov_Hud:playSound"
      L4_2 = L1_2
      L5_2 = L0_2
      L2_2(L3_2, L4_2, L5_2)
    end
  end
  PlayBeltsSound = L24_1
  function L24_1()
    local L0_2, L1_2
    L0_2 = L21_1
    L0_2 = not L0_2
    L21_1 = L0_2
    L0_2 = PlayBeltsSound
    L0_2()
    L0_2 = UpdateBeltsState
    L1_2 = L21_1
    L0_2(L1_2)
  end
  ToggleSeatbelt = L24_1
  L24_1 = CreateThread
  function L25_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
    while true do
      L0_2 = 100
      L1_2 = PlayerPedId
      L1_2 = L1_2()
      L2_2 = GetVehiclePedIsIn
      L3_2 = L1_2
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 and 0 ~= L2_2 then
        L3_2 = DoesEntityExist
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          L0_2 = 0
          L3_2 = L21_1
          if L3_2 then
            L3_2 = Config
            L3_2 = L3_2.SeatBelts
            L3_2 = L3_2.AllowExit
            if not L3_2 then
              L3_2 = DisableControlAction
              L4_2 = 0
              L5_2 = 75
              L6_2 = true
              L3_2(L4_2, L5_2, L6_2)
              L3_2 = DisableControlAction
              L4_2 = 27
              L5_2 = 75
              L6_2 = true
              L3_2(L4_2, L5_2, L6_2)
            end
            L3_2 = false
            L22_1 = L3_2
          else
            L3_2 = Config
            L3_2 = L3_2.SeatBelts
            L3_2 = L3_2.Warning
            if L3_2 then
              L3_2 = GetEntitySpeed
              L4_2 = L2_2
              L3_2 = L3_2(L4_2)
              L4_2 = SpeedMultiplier
              L3_2 = L3_2 * L4_2
              L4_2 = Config
              L4_2 = L4_2.SeatBelts
              L4_2 = L4_2.WarningSpeed
              L4_2 = L3_2 >= L4_2
              L22_1 = L4_2
            end
          end
      end
      else
        L3_2 = L21_1
        if L3_2 then
          L3_2 = ToggleSeatbelt
          L3_2()
        end
        L3_2 = false
        L22_1 = L3_2
      end
      L3_2 = L22_1
      if L3_2 then
        L3_2 = L23_1
        if not L3_2 then
        end
      end
      L3_2 = L22_1
      if not L3_2 then
        L3_2 = L23_1
        ::lbl_78::
        if L3_2 then
          L3_2 = L23_1
          L3_2 = not L3_2
          L23_1 = L3_2
          L3_2 = false
          L4_2 = GetVehicleClass
          L5_2 = GetVehiclePedIsUsing
          L6_2 = L1_2
          L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2)
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
          L5_2 = pairs
          L6_2 = Config
          L6_2 = L6_2.SeatBelts
          L6_2 = L6_2.BlacklistedClasses
          L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
          for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
            if L4_2 == L10_2 then
              L3_2 = true
            end
          end
          L5_2 = GetEntityModel
          L6_2 = L2_2
          L5_2 = L5_2(L6_2)
          L6_2 = pairs
          L7_2 = Config
          L7_2 = L7_2.SeatBelts
          L7_2 = L7_2.BlacklistedModels
          L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
          for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
            if L5_2 == L11_2 then
              L3_2 = true
            end
          end
          if not L3_2 then
            L6_2 = SendNUIMessage
            L7_2 = {}
            L7_2.action = "BeltsWarning"
            L8_2 = L22_1
            L7_2.value = L8_2
            L8_2 = Config
            L8_2 = L8_2.SeatBelts
            L8_2 = L8_2.WarningVolume
            L7_2.volume = L8_2
            L6_2(L7_2)
          end
        end
      end
      L3_2 = Wait
      L4_2 = L0_2
      L3_2(L4_2)
    end
  end
  L24_1(L25_1)
  L24_1 = RegisterCommand
  L25_1 = "toggleseatbelt2"
  function L26_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = IsPedInAnyVehicle
    L2_2 = L0_2
    L3_2 = false
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = IsPauseMenuActive
      L1_2 = L1_2()
      if not L1_2 then
        goto lbl_14
      end
    end
    do return end
    ::lbl_14::
    L1_2 = GetVehicleClass
    L2_2 = GetVehiclePedIsUsing
    L3_2 = L0_2
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.SeatBelts
    L3_2 = L3_2.BlacklistedClasses
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      if L1_2 == L7_2 then
        return
      end
    end
    L2_2 = ToggleSeatbelt
    L2_2()
  end
  L27_1 = false
  L24_1(L25_1, L26_1, L27_1)
  L24_1 = RegisterKeyMapping
  L25_1 = "toggleseatbelt2"
  L26_1 = "Toggle Seatbelt"
  L27_1 = "keyboard"
  L28_1 = Config
  L28_1 = L28_1.SeatBelts
  L28_1 = L28_1.Key
  L24_1(L25_1, L26_1, L27_1, L28_1)
end
