CreateThread(function()
    waitCore()
    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        Core.Commands.Add('911', "Send a message to 911", { { name = 'message', help = 'Message' } }, false, function(source, args)
            local src = source
            local message
            if args[1] then message = table.concat(args, ' ') end
            
            if not message or message == "" then
                return Core.Functions.Notify(src, Config.DispatchLocales['Notify']['Enter_Message'], "error")
            end

            TriggerClientEvent('codem-dispatch:client:sendMessage', src, message, "911", false)
        end, 'user')

        Core.Commands.Add('911a', "Send an anonymous message to 911", { { name = 'message', help = 'Message' } }, false, function(source, args)
            local src = source
            local message
            if args[1] then message = table.concat(args, ' ') end
            
            if not message or message == "" then
                return Core.Functions.Notify(src, Config.DispatchLocales['Notify']['Enter_Message'], "error")
            end

            TriggerClientEvent('codem-dispatch:client:sendMessage', src, message, "911", true)
        end, 'user')

        Core.Commands.Add('311', "Send a message to 311", { { name = 'message', help = 'Message' } }, false, function(source, args)
            local src = source
            local message
            if args[1] then message = table.concat(args, ' ') end
            
            if not message or message == "" then
                return Core.Functions.Notify(src, Config.DispatchLocales['Notify']['Enter_Message'], "error")
            end

            TriggerClientEvent('codem-dispatch:client:sendMessage', src, message, "311", false)
        end, 'user')

        Core.Commands.Add('311a', "Send an anonymous message to 311", { { name = 'message', help = 'Message' } }, false, function(source, args)
            local src = source
            local message
            if args[1] then message = table.concat(args, ' ') end
            
            if not message or message == "" then
                return Core.Functions.Notify(src, Config.DispatchLocales['Notify']['Enter_Message'], "error")
            end

            TriggerClientEvent('codem-dispatch:client:sendMessage', src, message, "311", true)
        end, 'user')
    end
end)