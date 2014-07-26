PLUGIN.name = "Roll Gain"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Boosts your rolls depending on your faction, class and equiped weapon."

nut.util.Include("sh_config.lua")

nut.command.Register({
	onRun = function(client, arguments)
		local max = 100
		local gain = 0

		for faction, data in pairs(nut.config.gains.hl2rp) do
			if (client:Team() == faction) then
				for rank, amount in pairs(data) do
					if (client:IsCombineRank(rank)) then
						max = max + amount
						break
			  		end	
				end
			end
		end

		for faction, amount in pairs(nut.config.gains.factions) do
			if (client:Team() == faction) then
				max = max + amount
				break
			end
		end

		for weapon, amount in pairs(nut.config.gains.weapons) do
			if (client:GetActiveWeapon():GetClass() == weapon) then
				gain = gain + amount
				break
	  		end	
		end


		for attribute, table in pairs(nut.config.gains.attributes) do
			local attribute = nut.attribs.Exists(attribute)

			if (attribute) then 
				if (client:GetAttrib(attribute) >= table[1]) then
					gain = gain + table[2]
				end
			end
		end

		math.randomseed(CurTime())

		local base = math.random(0, max)
		local roll = base + gain

		if roll > max then
			roll = max
		end

		nut.chat.Send(client, "roll", client:Name().." has rolled "..roll.." out of "..max.." with a gain of "..gain.." for a total of "..(roll + gain <= max and roll + gain or max)..".")
	end
}, "roll")


