PLUGIN.name = "Civil Workers' Union"
PLUGIN.desc = "Adds a new faction."
PLUGIN.author = "Birdman aka. Applad"

function PLUGIN:GetDefaultInv(inventory, client, data)
	if (data.faction == FACTION_CIVILWORKER) then
		inventory:Add("cwuclothing", 1)
	end
end
