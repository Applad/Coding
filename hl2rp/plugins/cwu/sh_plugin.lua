PLUGIN.name = "Civil Workers' Union"
PLUGIN.desc = "Adds a new faction."
PLUGIN.author = "Birdman aka. Applad"

function PLUGIN:GetDefaultInv(inventory, client, data)
	if (data.faction == FACTION_CIVILWORKER) then
		data.chardata.digits = nut.util.GetRandomNum(5)

		inventory:Add("unioncard", 1, {
			GetRandomNumame = data.charname,
			Digits = data.chardata.digits
		})

		inventory:Add("cwuclothing", 1, {Equipped = true})
	end
end
