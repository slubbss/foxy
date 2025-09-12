local L0_1, L1_1, L2_1, L3_1

if not Config.Autoinstall then
    return
end

if io.readdir ~= nil then
    return print("^1[ERROR]^0 You are using new server artefacts that already has a resource sandboxing. It's not possible to run autoinstall - you need to integrate HUD manuallu (look for installation/README.md)")
end

L0_1 = { "qb-core", "es_extended", "ox_lib" }

L1_1 = {}
L1_1["qb-core"] = [[
local oldShowNotification = QBCore.Functions.Notify

QBCore.Functions.Notify = function(text, texttype, length)
    local message, notifyTitle

    if texttype == "primary" then texttype = "info" end

    if texttype == "ambulance" or texttype == "police" then
        oldShowNotification(text, texttype, length)
    end

    if type(text) == "table" then
        notifyTitle = text.caption
        message = text.text
    else
        message = text
    end

    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowNotification(message, texttype, notifyTitle, length)
    else
        oldShowNotification(text, texttype, length)
    end

    if GetResourceState("17mov_PauseMenu") ~= "missing" then
        exports["17mov_PauseMenu"]:AddNotification(text, texttype)
    end
end

local oldProgressbar = QBCore.Functions.Progressbar

QBCore.Functions.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:StartProgress({
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            controlDisables = disableControls,
            animation = animation,
            prop = prop,
            propTwo = propTwo,
        }, nil, nil, function(cancelled)
            if not cancelled then
                if onFinish then
                    onFinish()
                end
            else
                if onCancel then
                    onCancel()
                end
            end
        end)
    else
        oldProgressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    end
end

local function hideText()
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:HideHelpNotification()
    else
        SendNUIMessage({
            action = 'HIDE_TEXT',
        })
    end
end

local function drawText(text, position)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotification(text)
    else
        if type(position) ~= 'string' then position = 'left' end

        SendNUIMessage({
            action = 'DRAW_TEXT',
            data = {
                text = text,
                position = position
            }
        })
    end
end

local function changeText(text, position)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotification(text)
    else
        if type(position) ~= 'string' then position = 'left' end

        SendNUIMessage({
            action = 'CHANGE_TEXT',
            data = {
                text = text,
                position = position
            }
        })
    end
end

local function keyPressed()
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:HideHelpNotification()
    else
        CreateThread(function() -- Not sure if a thread is needed but why not eh?
            SendNUIMessage({
                action = 'KEY_PRESSED',
            })
            Wait(500)
            hideText()
        end)
    end
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    hideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)
]]
L1_1.es_extended = [[
local oldShowNotification = ESX.ShowNotification

ESX.ShowNotification = function(message, notifyType, length)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowNotification(message, notifyType, nil, length)
    else
        oldShowNotification(message, notifyType, length)
    end

    if GetResourceState("17mov_PauseMenu") ~= "missing" then
        exports["17mov_PauseMenu"]:AddNotification(text, texttype)
    end
end

local oldShowHelpNotification = ESX.ShowHelpNotification

ESX.ShowHelpNotification = function(message)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotificationWhile(message)
    else
        oldShowHelpNotification(message)
    end
end

local oldTextUI = ESX.TextUI

ESX.TextUI = function(message, notifyType)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotificationWhile(message)
    else
        oldTextUI(message)
    end
end

local oldProgressbar = ESX.Progressbar

ESX.Progressbar = function(message, length, Options)
    if GetResourceState("17mov_Hud") == "started" then
        local options = {
            label = message,
            duration = length,
        }

        if Options then
            if Options.animation then
                if Options.animation.type == "anim" then
                    options.animation = {
                        animDict = Options.animation.dict,
                        anim = Options.animation.lib,
                        flags = 1
                    }
                elseif Options.animation.type == "Scenario" then
                    options.animation = {
                        task = Options.animation.Scenario,
                    }
                end
            end
        end

        exports["17mov_Hud"]:StartProgress(options)
    else
        oldProgressbar(message)
    end
end
]]
L1_1.ox_lib_notify = [[
---@alias NotificationPosition 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left' | 'center-right' | 'center-left'
---@alias NotificationType 'info' | 'warning' | 'success' | 'error'
---@alias IconAnimationType 'spin' | 'spinPulse' | 'spinReverse' | 'pulse' | 'beat' | 'fade' | 'beatFade' | 'bounce' | 'shake'

---@class NotifyProps
---@field id? string
---@field title? string
---@field description? string
---@field duration? number
---@field showDuration? boolean
---@field position? NotificationPosition
---@field type? NotificationType
---@field style? { [string]: any }
---@field icon? string | { [1]: IconProp, [2]: string }
---@field iconAnimation? IconAnimationType
---@field iconColor? string
---@field alignIcon? 'top' | 'center'
---@field sound? { bank?: string, set: string, name: string }

local settings = require 'resource.settings'

---`client`
---@param data NotifyProps
---@diagnostic disable-next-line: duplicate-set-field
function lib.notify(data)
    local sound = settings.notification_audio and data.sound
    data.sound = nil
    data.position = data.position or settings.notification_position

    if GetResourceState("17mov_Hud") == "started" then
        if data.type == "inform" then
            data.type = "info"
        elseif data.type == "warning" then
            data.type = "info"
        end

        exports["17mov_Hud"]:ShowNotification(data.description, data.type, data.title, data.duration)
    else
        SendNUIMessage({
            action = 'notify',
            data = data
        })
    end

    if GetResourceState("17mov_PauseMenu") ~= "missing" then
        exports["17mov_PauseMenu"]:AddNotification(text, texttype)
    end

    if not sound then return end

    if sound.bank then lib.requestAudioBank(sound.bank) end

    local soundId = GetSoundId()
    PlaySoundFrontend(soundId, sound.name, sound.set, true)
    ReleaseSoundId(soundId)

    if sound.bank then ReleaseNamedScriptAudioBank(sound.bank) end
end

---@class DefaultNotifyProps
---@field title? string
---@field description? string
---@field duration? number
---@field position? NotificationPosition
---@field status? 'info' | 'warning' | 'success' | 'error'
---@field id? number

---@param data DefaultNotifyProps
function lib.defaultNotify(data)
    -- Backwards compat for v3
    data.type = data.status
    if data.type == 'inform' then data.type = 'info' end
    return lib.notify(data)
end

RegisterNetEvent('ox_lib:notify', lib.notify)
RegisterNetEvent('ox_lib:defaultNotify', lib.defaultNotify)
]]
L1_1.ox_lib_progress = [[
local progress
local DisableControlAction = DisableControlAction
local DisablePlayerFiring = DisablePlayerFiring
local playerState = LocalPlayer.state
local createdProps = {}

---@class ProgressPropProps
---@field model string
---@field bone? number
---@field pos vector3
---@field rot vector3
---@field rotOrder? number

---@class ProgressProps
---@field label? string
---@field duration number
---@field position? 'middle' | 'bottom'
---@field useWhileDead? boolean
---@field allowRagdoll? boolean
---@field allowCuffed? boolean
---@field allowFalling? boolean
---@field allowSwimming? boolean
---@field canCancel? boolean
---@field anim? { dict?: string, clip: string, flag?: number, blendIn?: number, blendOut?: number, duration?: number, playbackRate?: number, lockX?: boolean, lockY?: boolean, lockZ?: boolean, scenario?: string, playEnter?: boolean }
---@field prop? ProgressPropProps | ProgressPropProps[]
---@field disable? { move?: boolean, sprint?: boolean, car?: boolean, combat?: boolean, mouse?: boolean }

local function createProp(ped, prop)
    lib.requestModel(prop.model)
    local coords = GetEntityCoords(ped)
    local object = CreateObject(prop.model, coords.x, coords.y, coords.z, false, false, false)

    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, prop.bone or 60309), prop.pos.x, prop.pos.y, prop.pos.z, prop.rot.x, prop.rot.y, prop.rot.z, true, true, false, true, prop.rotOrder or 0, true)
    SetModelAsNoLongerNeeded(prop.model)

    return object
end

local function interruptProgress(data)
    if not data.useWhileDead and IsEntityDead(cache.ped) then return true end
    if not data.allowRagdoll and IsPedRagdoll(cache.ped) then return true end
    if not data.allowCuffed and IsPedCuffed(cache.ped) then return true end
    if not data.allowFalling and IsPedFalling(cache.ped) then return true end
    if not data.allowSwimming and IsPedSwimming(cache.ped) then return true end
end

local isFivem = cache.game == 'fivem'

local controls = {
    INPUT_LOOK_LR = isFivem and 1 or 0xA987235F,
    INPUT_LOOK_UD = isFivem and 2 or 0xD2047988,
    INPUT_SPRINT = isFivem and 21 or 0x8FFC75D6,
    INPUT_AIM = isFivem and 25 or 0xF84FA74F,
    INPUT_MOVE_LR = isFivem and 30 or 0x4D8FB4C1,
    INPUT_MOVE_UD = isFivem and 31 or 0xFDA83190,
    INPUT_DUCK = isFivem and 36 or 0xDB096B85,
    INPUT_VEH_MOVE_LEFT_ONLY = isFivem and 63 or 0x9DF54706,
    INPUT_VEH_MOVE_RIGHT_ONLY = isFivem and 64 or 0x97A8FD98,
    INPUT_VEH_ACCELERATE = isFivem and 71 or 0x5B9FD4E2,
    INPUT_VEH_BRAKE = isFivem and 72 or 0x6E1F639B,
    INPUT_VEH_EXIT = isFivem and 75 or 0xFEFAB9B4,
    INPUT_VEH_MOUSE_CONTROL_OVERRIDE = isFivem and 106 or 0x39CCABD5
}

local function startProgress(data)
    playerState.invBusy = true
    progress = data
    local anim = data.anim

    if anim then
        if anim.dict then
            lib.requestAnimDict(anim.dict)

            TaskPlayAnim(cache.ped, anim.dict, anim.clip, anim.blendIn or 3.0, anim.blendOut or 1.0, anim.duration or -1, anim.flag or 49, anim.playbackRate or 0, anim.lockX, anim.lockY, anim.lockZ)
            RemoveAnimDict(anim.dict)
        elseif anim.scenario then
            TaskStartScenarioInPlace(cache.ped, anim.scenario, 0, anim.playEnter ~= nil and anim.playEnter or true)
        end
    end

    if data.prop then
        playerState:set('lib:progressProps', data.prop, true)
    end

    local disable = data.disable

    while progress do
        if disable then
            if disable.mouse then
                DisableControlAction(0, controls.INPUT_LOOK_LR, true)
                DisableControlAction(0, controls.INPUT_LOOK_UD, true)
                DisableControlAction(0, controls.INPUT_VEH_MOUSE_CONTROL_OVERRIDE, true)
            end

            if disable.move then
                DisableControlAction(0, controls.INPUT_SPRINT, true)
                DisableControlAction(0, controls.INPUT_MOVE_LR, true)
                DisableControlAction(0, controls.INPUT_MOVE_UD, true)
                DisableControlAction(0, controls.INPUT_DUCK, true)
            end

            if disable.sprint and not disable.move then
                DisableControlAction(0, controls.INPUT_SPRINT, true)
            end

            if disable.car then
                DisableControlAction(0, controls.INPUT_VEH_MOVE_LEFT_ONLY, true)
                DisableControlAction(0, controls.INPUT_VEH_MOVE_RIGHT_ONLY, true)
                DisableControlAction(0, controls.INPUT_VEH_ACCELERATE, true)
                DisableControlAction(0, controls.INPUT_VEH_BRAKE, true)
                DisableControlAction(0, controls.INPUT_VEH_EXIT, true)
            end

            if disable.combat then
                DisableControlAction(0, controls.INPUT_AIM, true)
                DisablePlayerFiring(cache.playerId, true)
            end
        end

        if interruptProgress(progress) then
            progress = false
        end

        Wait(0)
    end

    if data.prop then
        playerState:set('lib:progressProps', nil, true)
    end

    if anim then
        if anim.dict then
            StopAnimTask(cache.ped, anim.dict, anim.clip, 1.0)
            Wait(0) -- This is needed here otherwise the StopAnimTask is cancelled
        else
            ClearPedTasks(cache.ped)
        end
    end

    playerState.invBusy = false

    if progress == false then
        SendNUIMessage({ action = 'progressCancel' })
        return false
    end

    return true
end

---@param data ProgressProps
---@return boolean?
function lib.progressBar(data)
    while progress ~= nil do Wait(0) end

    if not interruptProgress(data) then
        if GetResourceState("17mov_Hud") == "started" then
            local prop = {}
            local propTwo = {}

            if data.prop then
                if data.prop[1] then
                    prop.model = data.prop[1].model
                    prop.bone = data.prop[1].bone
                    prop.coords = data.prop[1].pos
                    prop.rotation = data.prop[1].rot

                    if data.prop[2] then
                        propTwo.model = data.prop[2].model
                        propTwo.bone = data.prop[2].bone
                        propTwo.coords = data.prop[2].pos
                        propTwo.rotation = data.prop[2].rot
                    end
                else
                    prop.model = data.prop.model
                    prop.bone = data.prop.bone
                    prop.coords = data.prop.pos
                    prop.rotation = data.prop.rot
                end
            end

            local action = {
                duration = data.duration,
                label = data.label,
                useWhileDead = data.useWhileDead,
                canCancel = data.canCancel,
                controlDisables = {
                    disableMovement = data.disable?.move,
                    disableCarMovement = data.disable?.car,
                    disableMouse = data.disable?.mouse,
                    disableCombat = data.disable?.combat,
                },
                animation = {
                    animDict = data.anim?.dict,
                    anim = data.anim?.clip,
                    flags = data.anim?.flag,
                    task = data.anim?.scenario,
                },
                prop = prop,
                propTwo = propTwo,
            }

            local success = nil
            progress = action
            playerState.invBusy = true

            exports["17mov_Hud"]:StartProgress(action, nil, nil, function(wasCanceled)
                success = not wasCanceled
                progress = nil
                playerState.invBusy = false
            end)

            while progress do
                Wait(0)
            end

            if progress == false then
                success = false
                exports["17mov_Hud"]:StopProgress()
            end

            return success
        else
            SendNUIMessage({
                action = 'progress',
                data = {
                    label = data.label,
                    duration = data.duration
                }
            })

            return startProgress(data)
        end
    end
end

---@param data ProgressProps
---@return boolean?
function lib.progressCircle(data)
    while progress ~= nil do Wait(0) end

    if not interruptProgress(data) then
        SendNUIMessage({
            action = 'circleProgress',
            data = {
                duration = data.duration,
                position = data.position,
                label = data.label
            }
        })

        return startProgress(data)
    end
end

function lib.cancelProgress()
    if not progress then
        error('No progress bar is active')
    end

    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:StopProgress()
    end

    progress = false
end

---@return boolean
function lib.progressActive()
    return progress and true
end

RegisterNUICallback('progressComplete', function(data, cb)
    cb(1)
    progress = nil
end)

RegisterCommand('cancelprogress', function()
    if progress?.canCancel then progress = false end
end)

if isFivem then
    RegisterKeyMapping('cancelprogress', locale('cancel_progress'), 'keyboard', 'x')
end

local function deleteProgressProps(serverId)
    local playerProps = createdProps[serverId]
    if not playerProps then return end
    for i = 1, #playerProps do
        local prop = playerProps[i]
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end
    createdProps[serverId] = nil
end

RegisterNetEvent('onPlayerDropped', function(serverId)
    deleteProgressProps(serverId)
end)

AddStateBagChangeHandler('lib:progressProps', nil, function(bagName, key, value, reserved, replicated)
    if replicated then return end

    local ply = GetPlayerFromStateBagName(bagName)
    if ply == 0 then return end

    local ped = GetPlayerPed(ply)
    local serverId = GetPlayerServerId(ply)

    if not value then
        return deleteProgressProps(serverId)
    end

    createdProps[serverId] = {}
    local playerProps = createdProps[serverId]

    if value.model then
        playerProps[#playerProps+1] = createProp(ped, value)
    else
        for i = 1, #value do
            local prop = value[i]

            if prop then
                playerProps[#playerProps+1] = createProp(ped, prop)
            end
        end
    end
end)
]]

function L2_1(sourcePath, destPath)
    local sourceFile = io.open(sourcePath, "rb")
    local destFile = io.open(destPath, "wb")
    if not sourceFile then
        return print(string.format("^1[ERROR]^0 Can't open %s file for reading. Please fix your resource or contact 17Mov support.", sourcePath))
    end
    if not destFile then
        sourceFile:close()
        return print(string.format("^1[ERROR]^0 Can't open %s file for writing. Please fix your resource or contact 17Mov support.", destPath))
    end
    local block
    repeat
        block = sourceFile:read(4096)
        if block then
            destFile:write(block)
        end
    until not block
    sourceFile:close()
    destFile:close()
    return true
end
CopyFile = L2_1

function L3_1()
    local changesMade = false
    for i = 1, #L0_1 do
        local frameworkName = L0_1[i]
        local resourceState = GetResourceState(frameworkName)
        local resourcePath = GetResourcePath(frameworkName)
        local isQbxCore = resourcePath and resourcePath:find("qbx_core")
        if not isQbxCore and resourcePath and (resourceState == "started" or resourceState == "starting" or resourceState == "uninitialized") then
            local basePath = resourcePath .. "/"
            if frameworkName == "ox_lib" then
                local notifyPath = basePath .. "resource/interface/client/notify.lua"
                local progressPath = basePath .. "resource/interface/client/progress.lua"
                local shouldInstallNotify = true
                local shouldInstallProgress = true
                local notifyFile = io.open(notifyPath, "r")
                local progressFile = io.open(progressPath, "r")
                if notifyFile then
                    local content = notifyFile:read("*a")
                    notifyFile:close()
                    if content == L1_1.ox_lib_notify then
                        shouldInstallNotify = false
                    end
                end
                if progressFile then
                    local content = progressFile:read("*a")
                    progressFile:close()
                    if content == L1_1.ox_lib_progress then
                        shouldInstallProgress = false
                    end
                end
                if shouldInstallNotify then
                    if CopyFile(notifyPath, basePath .. "notify.bak.lua") then
                        local file = io.open(notifyPath, "w")
                        if file then
                            file:write(L1_1.ox_lib_notify)
                            file:close()
                            changesMade = true
                        else
                            print(string.format("^1[ERROR]^0 Can't create install 17mov_Hud in resource %s. Please fix your resource or contact 17Mov support.", frameworkName))
                        end
                    end
                end
                if shouldInstallProgress then
                    if CopyFile(progressPath, basePath .. "progress.bak.lua") then
                        local file = io.open(progressPath, "w")
                        if file then
                            file:write(L1_1.ox_lib_progress)
                            file:close()
                            changesMade = true
                        else
                            print(string.format("^1[ERROR]^0 Can't create install 17mov_Hud in resource %s. Please fix your resource or contact 17Mov support.", frameworkName))
                        end
                    end
                end
            else
                local functionsPath = basePath .. "17mov_functions.lua"
                local functionsFile = io.open(functionsPath, "r")
                local shouldInstallFunctions = true
                if functionsFile then
                    local content = functionsFile:read("*a")
                    functionsFile:close()
                    if content == L1_1[frameworkName] then
                        shouldInstallFunctions = false
                    end
                end
                if shouldInstallFunctions then
                    local file = io.open(functionsPath, "w")
                    if file then
                        file:write(L1_1[frameworkName])
                        file:close()
                        changesMade = true
                    else
                        print(string.format("^1[ERROR]^0 Can't create 17mov functions in framework %s. Please fix your resource or contact 17Mov support.", frameworkName))
                    end
                end
                local manifestPath = basePath .. "fxmanifest.lua"
                local manifestFile = io.open(manifestPath, "r+")
                if manifestFile then
                    local content = manifestFile:read("*a")
                    local scriptEntry = "client_script '17mov_functions.lua'"
                    if not content:find(scriptEntry, 1, true) then
                        manifestFile:write(string.format("\n\n%s", scriptEntry))
                        changesMade = true
                    end
                    manifestFile:close()
                else
                    print(string.format("^1[ERROR]^0 Can't open %s fxmanifest.lua file for reading. Please fix your resource or contact 17Mov support.", frameworkName))
                end
            end
        end
    end
    while changesMade do
        print("^5[INFO]:^0 Framework integration completed. Please restart your server to integrate HUD fully with your server.")
        Wait(4000)
    end
end
CreateThread(L3_1)