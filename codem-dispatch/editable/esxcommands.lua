CreateThread(function()
    waitCore()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterCommand("911", "user", function(xPlayer, args, showError)
            local source = xPlayer.source
            local message = args.message

            if not message or message == "" then
                return showError(Config.DispatchLocales['Notify']['Enter_Message'])
            end
            
            TriggerClientEvent('codem-dispatch:client:sendMessage', source, message, "911", false)

        end, true, {
            help = "Send a message to 911",
            arguments = {
                { name = "message", help = "911 Message", type = "string" },
            },
        })

        Core.RegisterCommand("911a", "user", function(xPlayer, args, showError)
            local source = xPlayer.source
            local message = args.message

            if not message or message == "" then
                return showError(Config.DispatchLocales['Notify']['Enter_Message'])
            end
            
            TriggerClientEvent('codem-dispatch:client:sendMessage', source, message, "911", true)

        end, true, {
            help = "Send an anonymous message to 911",
            arguments = {
                { name = "message", help = "911 Message", type = "string" },
            },
        })

        Core.RegisterCommand("311", "user", function(xPlayer, args, showError)
            local source = xPlayer.source
            local message = args.message

            if not message or message == "" then
                return showError(Config.DispatchLocales['Notify']['Enter_Message'])
            end
            
            TriggerClientEvent('codem-dispatch:client:sendMessage', source, message, "311", false)

        end, true, {
            help = "Send a message to 311",
            arguments = {
                { name = "message", help = "311 Message", type = "string" },
            },
        })

        Core.RegisterCommand("311a", "user", function(xPlayer, args, showError)
            local source = xPlayer.source
            local message = args.message

            if not message or message == "" then
                return showError(Config.DispatchLocales['Notify']['Enter_Message'])
            end
            
            TriggerClientEvent('codem-dispatch:client:sendMessage', source, message, "311", true)

        end, true, {
            help = "Send an anonymous message to 311",
            arguments = {
                { name = "message", help = "311 Message", type = "string" },
            },
        })
    end
end)