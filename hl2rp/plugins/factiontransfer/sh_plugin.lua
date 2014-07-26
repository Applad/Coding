PLUGIN.name = "FactionTransfer"
PLUGIN.author = "Zenolisk"
PLUGIN.desc = "Adds Items & Commands for Faction Transfers."

nut.command.Register({
	adminOnly = true,
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
			
			target:SetTeam(faction.index)
			target.character:SetVar("faction", faction.index)
			
			end
		end
	end

}, "plytransfer")