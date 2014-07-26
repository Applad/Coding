ITEM.name = "Floor Turret"
ITEM.model = "models/combine_turrets/floor_turret.mdl"
ITEM.desc = "A Floor Turret."
ITEM.price = 600
ITEM.noBusiness = true
ITEM.functions = {}
ITEM.functions.Use = {
	text = "Place",
	tip = "Places the Turret.",
	icon = "icon16/box.png",
	run = function(item)		
		if (SERVER) then
		if (item.player:IsCombine()) then
		    item.player:SetOverrideSeq("Turret_Drop")
			local grd = ents.Create( "npc_turret_floor" )
			grd:SetPos( item.player:GetPos() + item.player:GetForward() * 80 )
			grd:Spawn()
	    for k, v in pairs(ents.GetAll()) do
		if(v:IsPlayer()) then
			if (v:IsCombine()) then
		    grd:AddEntityRelationship(v, 3)
			else
			grd:AddEntityRelationship(v, 1)
			end
			end
		end
		end
		end
	end
}