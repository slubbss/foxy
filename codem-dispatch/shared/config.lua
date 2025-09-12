Config = Config or {}

-- Framework
Config.Framework = 'autodetect' -- esx, oldesx, qb, oldqb or autodetect

-- Jobs Settings
Config.OnDutyOnly = false 
Config.Jobs = {
    ['police'] = true,
    ['ambulance'] = true,
}

Config.UIAccess = { -- Only For UI Access (Custom Dispatch Job)
    -- ['police'] = true,
}

Config.EmsJobs = { -- for notifications
    ['ambulance'] = true,
    ['police'] = true,
}

-- Dispatch Settings
Config.MinOffset = 1
Config.MaxOffset = 120

Config.Inventory = 'codem-inventory' -- codem-inventory, qb-inventory, esx_inventory, ox_inventory, qs_inventory
Config.PhoneRequired = false -- Set true if only can use 911/311 command when got a phone on inventory.
Config.PhoneItems = { -- Add the entire list of your phone items.
    "phone",
}

Config.NotifyDeleteTimeout = 8 -- 8 seconds (Time to delete the notification from the dispatch)
Config.DefaultAlertsDelay = 5 -- Delay between each default alert, prevent spamming
Config.MaxDispatch = 25 

Config.DispatchTypes = {
    ShootsFire = {
        icon = 'shootsFire.svg',
        label = 'Shoot Fire', 
        code = '10-52',
        blip = {
            enable = true,
            radius = 0,
            sprite = 110,
            color = 1,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    Robbery = {
        icon = 'robbery.svg',
        label = 'Robberies', 
        code = '10-52',
        blip = {
            enable = true,
            radius = 0,
            sprite = 500,
            color = 2,
            scale = 1.5,
            length = 1,
            sound = 'robberysound',
            offset = false,
            flash = false
        },
        enable = true,
    },
    Murder = {
        icon = 'murder.svg',
        code = '10-52',
        label = 'Murder', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 126,
            color = 3,
            scale = 1.5,
            length = 1,
            sound = 'dispatch',
            offset = false,
            flash = false
        },
        enable = true
    },
    Drug = {
        icon = 'drug.svg',
        label = 'Drug Alert',
        code = '10-52',
        blip = {
            enable = true,
            radius = 0,
            sprite = 51,
            color = 2,
            scale = 1.5,
            length = 1,
            sound = 'robberysound',
            offset = false,
            flash = false
        },
        enable = true
    },
    SosCall = {
        icon = 'sosCall.svg',
        code = '10-52',
        label = 'SOS Calls', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 480,
            color = 1,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    BackUp = {
        icon = 'sosCall.svg',
        code = '10-52',
        label = 'Back up Request', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 480,
            color = 1,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    Speed = {
        icon = 'speed.svg',
        code = '10-52',
        speed = 80, -- KMH / GetEntitySpeed(vehicle) * 3.6
        label = 'Speed Limit',
        blip = {
            enable = true,
            radius = 0,
            sprite = 326,
            color = 84,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    AutoTheft = {
        icon = 'autoTheft.svg',
        code = '10-52',
        label = 'Auto Theft', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 595,
            color = 60,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    Melee = {
        icon = 'melee.svg',
        code = '10-52',
        label = 'Melee', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 685,
            color = 69,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = false,
            flash = false
        },
        enable = true
    },
    PlayerDowned = {
        icon = 'down.svg',
        code = '10-52',
        label = 'Citizen Down', 
        blip = {
            enable = true,
            radius = 0,
            sprite = 126,
            color = 3,
            scale = 1.5,
            length = 1,
            sound = 'dispatch',
            offset = false,
            flash = false
        },
        enable = true
    },
    Explosion = {
        icon = 'explosion.svg',
        code = '10-52',
        label = 'Explosion', 
        blip = {
            enable = true,
            radius = 75.0,
            sprite = 436,
            color = 1,
            scale = 1.5,
            length = 1,
            sound = 'Lose_1st',
            sound2 = 'GTAO_FM_Events_Soundset',
            offset = true,
            flash = false
        },
        enable = true
    }
}

-- Whitelist Guns that do not send shooting alerts
Config.WeaponWhitelist = {
    'WEAPON_GRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_SNOWBALL',
    'WEAPON_PIPEBOMB',
    'WEAPON_BALL',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_FLARE',
    'WEAPON_PETROLCAN',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_HAZARDCAN',
    'WEAPON_RAYCARBINE',
    'WEAPON_STUNGUN'
}

Config.Zones = {
    ["HuntingZones"] = {
        [1] = {radius = 650.0, coords = vector3(-938.61, 4823.99, 313.92)},
    },
    ["WhitelistZones"] = {
        [1] = {coords = vector3(13.53, -1097.92, 29.8), length = 14.0, width = 5.0, minZ = 28.8, maxZ = 32.8},
        [2] = {coords = vector3(821.96, -2163.09, 29.62), length = 14.0, width = 5.0, minZ = 28.62, maxZ = 32.62},
    },
}

-- Keys
Config.EnableRegisterKeyMapping = true 
--[[
    if set to true adjust the keys down below by referencing this url
    -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

    if set to false adjust the keys down below by referencing this url
    -- https://docs.fivem.net/docs/game-references/controls/

]]--

Config.Keys = {}

Config.Keys.ShowDispatchs = 'F9' -- Open the dispatch menu
Config.Keys.ShowDispatchsLabel = 'F9' -- Label for the dispatch menu
Config.Keys.Cursor = 'OEM_3' -- Open the cursor ("`" Key)

Config.Keys.Accept = 'G' -- Accept the call for units
Config.Keys.AcceptLabel = 'G' -- Label for the accept key

-- Utils
onMenuOpen = function() -- This Executed when the menu is opened (useful to hide hud or any other elements on the screen)
    TriggerEvent("mHud:HideHud")
end

onMenuClose = function() -- This Executed when the menu is closed (useful to show hud again or any other elements on the screen)
    TriggerEvent("mHud:ShowHud")
end

Config.Debug = false

function Notification(message, type, isServer, src) 
    if isServer then
        if Config.Framework == "esx" or Config.Framework == "oldesx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" or Config.Framework == "oldesx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 3500)
        end
    end
end

Config.WeaponsLabel = {
    [584646201] = "AP Pistol",
    [911657153] = "Pistol",
    [2578377531] = "Combat Pistol",
    [3219281620] = "Pistol .50",
    [2285322324] = "SNS Pistol",
    [3523564046] = "Heavy Pistol",
    [137902532] = "Vintage Pistol",
    [324215364] = "Marksman Pistol",
    [1198879012] = "Revolver",
    [3696079510] = "Double-Action Revolver",
    [3249783761] = "Up-n-Atomizer",
    [736523883] = "Stun Gun",
    [2939590305] = "Flare Gun",
    [2017895192] = "Micro SMG",
    [736523883] = "SMG",
    [100416529] = "Sniper Rifle",
    [205991906] = "Combat MG",
    [3220176749] = "MG",
    [2144741730] = "Gusenberg Sweeper",
    [317205821] = "Assault Rifle",
    [3220176749] = "Carbine Rifle",
    [2210333304] = "Advanced Rifle",
    [2937143193] = "Special Carbine",
    [2132975508] = "Bullpup Rifle",
    [961495388] = "Compact Rifle",
    [2726580491] = "Assault SMG",
    [487013001] = "Machine Pistol",
    [171789620] = "Combat PDW",
    [1672152130] = "Pump Shotgun",
    [1432025498] = "Sawn-Off Shotgun",
    [2017895192] = "Bullpup Shotgun",
    [3800352039] = "Assault Shotgun",
    [2640438543] = "Heavy Shotgun",
    [4019527611] = "Musket",
    [317205821] = "Marksman Rifle",
    [177293209] = "Heavy Sniper",
    [3342088282] = "Grenade Launcher",
    [2828843422] = "RPG",
    [1672152130] = "Minigun",
    [2874559379] = "Firework Launcher",
    [1785463520] = "Railgun",
    [3218215474] = "Homing Launcher",
    [2285322324] = "Compact Grenade Launcher",
    [2634544996] = "Grenade",
    [615608432] = "BZ Gas",
    [101631238] = "Molotov",
    [883325847] = "Sticky Bomb",
    [4256991824] = "Proximity Mine",
    [1233104067] = "Snowball",
    [600439132] = "Pipe Bomb",
    [2874559379] = "Baseball",
    [126349499] = "Flare",
    [2586976369] = "Jerry Can",
    [600439132] = "Fire Extinguisher",
}

Config.Colors = {
    ['0'] = "Metallic Black",
    ['1'] = "Metallic Graphite Black",
    ['2'] = "Metallic Black Steel",
    ['3'] = "Metallic Dark Silver",
    ['4'] = "Metallic Silver",
    ['5'] = "Metallic Blue Silver",
    ['6'] = "Metallic Steel Gray",
    ['7'] = "Metallic Shadow Silver",
    ['8'] = "Metallic Stone Silver",
    ['9'] = "Metallic Midnight Silver",
    ['10'] = "Metallic Gun Metal",
    ['11'] = "Metallic Anthracite Grey",
    ['12'] = "Matte Black",
    ['13'] = "Matte Gray",
    ['14'] = "Matte Light Grey",
    ['15'] = "Util Black",
    ['16'] = "Util Black Poly",
    ['17'] = "Util Dark silver",
    ['18'] = "Util Silver",
    ['19'] = "Util Gun Metal",
    ['20'] = "Util Shadow Silver",
    ['21'] = "Worn Black",
    ['22'] = "Worn Graphite",
    ['23'] = "Worn Silver Grey",
    ['24'] = "Worn Silver",
    ['25'] = "Worn Blue Silver",
    ['26'] = "Worn Shadow Silver",
    ['27'] = "Metallic Red",
    ['28'] = "Metallic Torino Red",
    ['29'] = "Metallic Formula Red",
    ['30'] = "Metallic Blaze Red",
    ['31'] = "Metallic Graceful Red",
    ['32'] = "Metallic Garnet Red",
    ['33'] = "Metallic Desert Red",
    ['34'] = "Metallic Cabernet Red",
    ['35'] = "Metallic Candy Red",
    ['36'] = "Metallic Sunrise Orange",
    ['37'] = "Metallic Classic Gold",
    ['38'] = "Metallic Orange",
    ['39'] = "Matte Red",
    ['40'] = "Matte Dark Red",
    ['41'] = "Matte Orange",
    ['42'] = "Matte Yellow",
    ['43'] = "Util Red",
    ['44'] = "Util Bright Red",
    ['45'] = "Util Garnet Red",
    ['46'] = "Worn Red",
    ['47'] = "Worn Golden Red",
    ['48'] = "Worn Dark Red",
    ['49'] = "Metallic Dark Green",
    ['50'] = "Metallic Racing Green",
    ['51'] = "Metallic Sea Green",
    ['52'] = "Metallic Olive Green",
    ['53'] = "Metallic Green",
    ['54'] = "Metallic Gasoline Blue Green",
    ['55'] = "Matte Lime Green",
    ['56'] = "Util Dark Green",
    ['57'] = "Util Green",
    ['58'] = "Worn Dark Green",
    ['59'] = "Worn Green",
    ['60'] = "Worn Sea Wash",
    ['61'] = "Metallic Midnight Blue",
    ['62'] = "Metallic Dark Blue",
    ['63'] = "Metallic Saxony Blue",
    ['64'] = "Metallic Blue",
    ['65'] = "Metallic Mariner Blue",
    ['66'] = "Metallic Harbor Blue",
    ['67'] = "Metallic Diamond Blue",
    ['68'] = "Metallic Surf Blue",
    ['69'] = "Metallic Nautical Blue",
    ['70'] = "Metallic Bright Blue",
    ['71'] = "Metallic Purple Blue",
    ['72'] = "Metallic Spinnaker Blue",
    ['73'] = "Metallic Ultra Blue",
    ['74'] = "Metallic Bright Blue",
    ['75'] = "Util Dark Blue",
    ['76'] = "Util Midnight Blue",
    ['77'] = "Util Blue",
    ['78'] = "Util Sea Foam Blue",
    ['79'] = "Uil Lightning blue",
    ['80'] = "Util Maui Blue Poly",
    ['81'] = "Util Bright Blue",
    ['82'] = "Matte Dark Blue",
    ['83'] = "Matte Blue",
    ['84'] = "Matte Midnight Blue",
    ['85'] = "Worn Dark blue",
    ['86'] = "Worn Blue",
    ['87'] = "Worn Light blue",
    ['88'] = "Metallic Taxi Yellow",
    ['89'] = "Metallic Race Yellow",
    ['90'] = "Metallic Bronze",
    ['91'] = "Metallic Yellow Bird",
    ['92'] = "Metallic Lime",
    ['93'] = "Metallic Champagne",
    ['94'] = "Metallic Pueblo Beige",
    ['95'] = "Metallic Dark Ivory",
    ['96'] = "Metallic Choco Brown",
    ['97'] = "Metallic Golden Brown",
    ['98'] = "Metallic Light Brown",
    ['99'] = "Metallic Straw Beige",
    ['100'] = "Metallic Moss Brown",
    ['101'] = "Metallic Biston Brown",
    ['102'] = "Metallic Beechwood",
    ['103'] = "Metallic Dark Beechwood",
    ['104'] = "Metallic Choco Orange",
    ['105'] = "Metallic Beach Sand",
    ['106'] = "Metallic Sun Bleeched Sand",
    ['107'] = "Metallic Cream",
    ['108'] = "Util Brown",
    ['109'] = "Util Medium Brown",
    ['110'] = "Util Light Brown",
    ['111'] = "Metallic White",
    ['112'] = "Metallic Frost White",
    ['113'] = "Worn Honey Beige",
    ['114'] = "Worn Brown",
    ['115'] = "Worn Dark Brown",
    ['116'] = "Worn straw beige",
    ['117'] = "Brushed Steel",
    ['118'] = "Brushed Black Steel",
    ['119'] = "Brushed Aluminium",
    ['120'] = "Chrome",
    ['121'] = "Worn Off White",
    ['122'] = "Util Off White",
    ['123'] = "Worn Orange",
    ['124'] = "Worn Light Orange",
    ['125'] = "Metallic Securicor Green",
    ['126'] = "Worn Taxi Yellow",
    ['127'] = "Police Car Blue",
    ['128'] = "Matte Green",
    ['129'] = "Matte Brown",
    ['130'] = "Worn Orange",
    ['131'] = "Matte White",
    ['132'] = "Worn White",
    ['133'] = "Worn Olive Army Green",
    ['134'] = "Pure White",
    ['135'] = "Hot Pink",
    ['136'] = "Salmon pink",
    ['137'] = "Metallic Vermillion Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Mettalic Black Blue",
    ['142'] = "Metallic Black Purple",
    ['143'] = "Metallic Black Red",
    ['144'] = "hunter green",
    ['145'] = "Metallic Purple",
    ['146'] = "Metallic Dark Blue",
    ['147'] = "Black",
    ['148'] = "Matte Purple",
    ['149'] = "Matte Dark Purple",
    ['150'] = "Metallic Lava Red",
    ['151'] = "Matte Forest Green",
    ['152'] = "Matte Olive Drab",
    ['153'] = "Matte Desert Brown",
    ['154'] = "Matte Desert Tan",
    ['155'] = "Matte Foilage Green",
    ['156'] = "Default Alloy Color",
    ['157'] = "Epsilon Blue",
    ['158'] = "Pure Gold",
    ['159'] = "Brushed Gold",
    ['160'] = "MP100"
}

Config.vehicleClass = {
    [0] = "Compacts",
    [1] = "Sedans",
    [2] = "SUVs",
    [3] = "Coupes",
    [4] = "Muscle",
    [5] = "Sports Classics",
    [6] = "Sports",
    [7] = "Super",
    [8] = "Motorcycles",
    [9] = "Off-road",
    [10] = "Industrial",
    [11] = "Utility",
    [12] = "Vans",
    [13] = "Cycles",
    [14] = "Boats",
    [15] = "Helicopters",
    [16] = "Planes",
    [17] = "Service",
    [18] = "Emergency",
    [19] = "Military",
    [20] = "Commercial",
    [21] = "Trains",
    [22] = "Open Wheel"
}