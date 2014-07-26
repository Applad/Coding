local PLUGIN = PLUGIN;

-- Called when a player has spawned.
function PLUGIN:PlayerSpawn(client)
	self:UpdateRelations(client);
end

-- Called after a player has spawned an NPC.
function PLUGIN:PlayerSpawnedNPC(client, npc)
	self:UpdateAllRelations()
end

local combineNPCs = {
	"npc_combine_s",
	"npc_helicopter",
	"npc_metropolice",
	"npc_manhack",
	"npc_combinedropship",
	"npc_rollermine",
	"npc_stalker",
	"npc_turret_floor",
	"npc_combinegunship",
	"npc_cscanner",
	"npc_clawscanner",
	"npc_strider",
	"npc_hunter",
	"npc_cremator",
	"npc_turret_ceiling",
	"npc_turret_ground",
	"npc_combine_camera",
	"combine_mine"
}

local rebelNPCs = {
	"npc_citizen",
	"npc_vortigaunt",
	"npc_alyx",
	"npc_barney"
}

-- A function to get whether or not an NPC belongs to the rebel faction.
function PLUGIN:IsNPCRebel(npc)
	if (table.HasValue(rebelNPCs, string.lower(npc:GetClass()))) then
		return true;
	else
		return false;
	end
end

-- A function to get whether or not an NPC belongs to the Combine faction.
function PLUGIN:IsNPCCombine(npc)
	if(table.HasValue(combineNPCs, string.lower(npc:GetClass()))) then
		return true;
	else
		return false;
	end
end

function PLUGIN:UpdateRelations(client)
	for k, v in pairs(ents.GetAll()) do
		if(v:IsNPC()) then
			if(self:IsNPCCombine(v)) then
				if(client:IsCombine() or client:Team() == FACTION_ADMIN) then
					v:AddEntityRelationship(client, 3)
				else
					v:AddEntityRelationship(client, 1)
				end
				
			elseif(self:IsNPCRebel(v)) then
				if(client:IsCombine() or client:Team() == FACTION_ADMIN) then
					v:AddEntityRelationship(client, 1)
				else
					v:AddEntityRelationship(client, 3)
					
				end
			end
		end
	end
end

function PLUGIN:UpdateAllRelations()
	for k, v in pairs(player.GetAll()) do
		self:UpdateRelations(v)
	end
end
hook.Add( "UpdateAllRelations", "UpdateAllRelations", UpdateAllRelations )
