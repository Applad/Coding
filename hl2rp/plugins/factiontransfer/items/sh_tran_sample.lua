--You can dublicate this lua file to create more transfer items [Rename it to tran_YOURFACTION.lua]
ITEM.name = "Sample Contract Paper"
ITEM.uniqueID = "tran_sample"
ITEM.category = "Faction"
ITEM.model = Model("models/props_lab/clipboard.mdl")
ITEM.desc = "Sign this to join a Faction."
ITEM.faction = FACTION_SAMPLE --Set your Faction here [FACTION_CP for HL2RP]
                              --Goto schema/factions/ to see the FACTION_* line
ITEM.functions = {}
ITEM.functions.Sign = {
	run = function(itemTable, client, data)
		if (SERVER) then
            client:SetTeam(itemTable.faction) --Set the faction for current season
            client.character:SetVar("faction", itemTable.faction) --Set the faction forever
			client:UpdateInv(itemTable.uniqueID, 0) --Remove the Item
			nut.util.Notify("You've joined the a Faction.", client) --Notify duh
		end
	end
}

local size = 16
local border = 4
local distance = size + border
local icon = Material("icon16/cog.png") --Change Icons here

function ITEM:PaintIcon(w, h)
		surface.SetDrawColor(255, 255, 255) --Maybe a Custom Color?
		surface.SetMaterial(icon)
		surface.DrawTexturedRect(w - distance, w - distance, size, size)
end