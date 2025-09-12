inNoDispatchZone = false
huntingzone, nodispatchzone = nil, nil

function createZones()
    -- Hunting Zone --
    if Config.Zones['HuntingZones'][1] then
        for _, hunting in pairs(Config.Zones["HuntingZones"]) do
            huntingzone = CircleZone:Create(hunting.coords, hunting.radius, {
                name = hunting.name,
                debugPoly = false
            })
            
            if huntingzone then
                huntingzone:onPlayerInOut(function(isPointInside, point)
                    debugPrint(isPointInside, point)
                    if isPointInside then
                        inNoDispatchZone = true
                    else
                        inNoDispatchZone = false
                    end
                end)
            end
        end
    end
    -- No Dispatch Zone --
    if Config.Zones['WhitelistZones'][1] then
        for _, nodispatch in pairs(Config.Zones["WhitelistZones"]) do
            nodispatchzone = BoxZone:Create(nodispatch.coords, nodispatch.length, nodispatch.width, {
                name = nodispatch.name,
                debugPoly = false,
                heading = nodispatch.heading,
                minZ = nodispatch.minZ,
                maxZ = nodispatch.maxZ
            })

            if nodispatchzone then
                nodispatchzone:onPlayerInOut(function(isPointInside, point)
                    debugPrint(isPointInside, point)
                    if isPointInside then
                        inNoDispatchZone = true
                    else
                        inNoDispatchZone = false
                    end
                end)
            end
        end
    end
end
