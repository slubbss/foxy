blips = {}
radius2 = {}

local function randomOffset(baseX, baseY, offset)
    local randomX = baseX + math.random(-offset, offset)
    local randomY = baseY + math.random(-offset, offset)

    return randomX, randomY
end

function createBlipData(coords, radius, sprite, color, scale, flash)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    local radiusBlip = AddBlipForRadius(coords.x, coords.y, coords.z, radius)

    SetBlipFlashes(blip, flash)
    SetBlipSprite(blip, sprite or 161)
    SetBlipHighDetail(blip, true)
    SetBlipScale(blip, scale or 1.0)
    SetBlipColour(blip, color or 84)
    SetBlipAlpha(blip, 255)
    SetBlipAsShortRange(blip, false)
    SetBlipCategory(blip, 2)
    SetBlipColour(radiusBlip, color or 84)
    SetBlipAlpha(radiusBlip, 128)

    return blip, radiusBlip
end

function createBlip(data, blipData)
    local sprite = blipData.sprite or blipData.alert.sprite or 161
    local color = blipData.color or blipData.alert.color or 84
    local scale = blipData.scale or blipData.alert.scale or 1.0
    local flash = blipData.flash or false
    local radiusAlpha = 128
    local blipWaitTime = ((blipData.length or blipData.alert.length) * 60000) / radiusAlpha

    local blip, radius
    if blipData.offset then
        local offsetX, offsetY = randomOffset(data.coords.x, data.coords.y, Config.MaxOffset)
        blip, radius = createBlipData({ x = offsetX, y = offsetY, z = data.coords.z }, blipData.radius, sprite, color, scale, flash)
    else
        blip, radius = createBlipData(data.coords, blipData.radius, sprite, color, scale, flash)
    end

    blips[data.id] = blip
    radius2[data.id] = radius

    local dispatchType = Config.DispatchTypes[data.type]
    local dispatchLocale = Config.DispatchLocales['UI'][data.type]
    local blipText = (dispatchType and dispatchType.code or "") .. " - " .. (dispatchLocale or data.message or "")

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)

    while radiusAlpha > 0 do
        Wait(blipWaitTime)
        radiusAlpha = math.max(0, radiusAlpha - 1)
        SetBlipAlpha(radius, radiusAlpha)
    end

    RemoveBlip(radius)
    RemoveBlip(blip)
end

function AddBlip(data, blipData)
    if not Config.DispatchTypes[data.type].enable or not Config.DispatchTypes[data.type].blip or not Config.DispatchTypes[data.type].blip.enable then return end

    CreateThread(function()
        createBlip(data, blipData)
    end)

    debugPrint('Blip Added', data, blipData)
    
    if blipData.sound == "Lose_1st" then
        PlaySound(-1, blipData.sound, blipData.sound2, 0, 0, 1)
    else
        TriggerServerEvent("InteractSound_SV:PlayOnSource", blipData.sound or blipData.alert.sound, 0.25)
    end
end