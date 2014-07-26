PLUGIN.name = "Set Faction"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds a command to set a characters faction."
    
nut.command.Register({
    superAdminOnly = true,
    allowDead = true,
    syntax = "<string name> <string faction>",
        onRun = function(client, arguments)
        local target = nut.command.FindPlayer(client, arguments[1])

        if (IsValid(target)) then
            if (!arguments[2]) then
                nut.util.Notify(nut.lang.Get("missing_arg", 2), client)

                return
            end

            local faction

            for k, v in pairs(nut.faction.GetAll()) do
                if (nut.util.StringMatches(arguments[2], v.name)) then
                    faction = v

                    break
                end
            end

            if (faction) then
                if (!nut.faction.CanBe(target, faction.index)) then
                    nut.util.Notify(nut.lang.Get("not_whitelisted"), target)

                    return
                end

                target:SetTeam(faction.index)
                target.character:SetVar("faction", faction.index)

                nut.util.Notify(nut.lang.Get("whitelisted", client:Name(), target:Name(), faction.name))
            else
                nut.util.Notify(nut.lang.Get("invalid_faction"), client)
            end
        end
    end
}, "charsetfaction")
