PLUGIN.name = "Force Character"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds a command to force players onto their other characters."

nut.command.Register({
    superAdminOnly = true,
    allowDead = true,
    syntax = "<string name>",
        onRun = function(client, arguments)
        local target = nut.command.FindPlayer(client, arguments[1])

        if (IsValid(target)) then  
            if (!arguments[2]) then
                nut.util.Notify(nut.lang.Get("missing_arg", 2), client)

                return
            end

            local arg = tonumber(arguments[2])
            local index

            for k, v in pairs(target.characters) do
                if (k == arg) then
                    index = v
                end
            end

            if (!index) then
                nut.util.Notify("That is not a valid character", client)

                return
            end

            local prevchar
            
            if (target.character and target.character.index == index) then
                nut.util.Notify("That player is already playing as that character.", client)
                
                return
            else
                prevchar = target.character
                nut.char.Save(target)
                nut.schema.Call("OnCharChanged", target)
            end

            nut.char.LoadID(target, index, function(sameChar)
                if (!sameChar) then
                    nut.schema.Call("PlayerLoadedChar", target)
                        target:Spawn()
                    nut.schema.Call("PostPlayerSpawn", target)

                    nut.util.Notify("You forced "..prevchar.publicVars.charname.." to play as "..target.character.publicVars.charname, client)
                end
            end)        
        end
    end
}, "plyforcechar")
