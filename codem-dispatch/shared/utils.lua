function debugPrint(...)
    if Config.Debug then
        local data = {...}
        local str = ""
        for i = 1, #data do
            if type(data[i]) == "table" then
                str = str .. json.encode(data[i])
            elseif type(data[i]) ~= "string" then
                str = str .. tostring(data[i])
            else
                str = str .. data[i]
            end
            if i ~= #data then
                str = str .. " "
            end
        end

        print("^6[codem-dispatch] ^3[Debug]^0: " .. str)
    end
end

function waitCore()
    while Core == nil do
        Wait(0)
    end
end