ITEM.name = "Viscerator"
ITEM.model = "models/manhack.mdl"
ITEM.desc = "A Union Viscerator, also called Manhack."
ITEM.price = 100
ITEM.noBusiness = true
ITEM.functions = {}
ITEM.functions.Use = {
	text = "Throw",
	tip = "Throws the Viscerator.",
	icon = "icon16/box.png",
	run = function(item)		
		if (SERVER) then
			if (item.player:Team() == FACTION_CP) then
		    	item.player:SetOverrideSeq("deploy")
	    		item.player:EmitSound("npc/metropolice/vo/visceratordeployed.wav", 120)
				
				local manhack = ents.Create( "npc_manhack" )
				manhack:SetPos( item.player:GetPos() + Vector(0,0,120) )
				manhack:Spawn()
				manhack:SetVelocity( Vector(0,0,20) )
				
	    			for k, v in pairs(ents.GetAll()) do
					
						if(v:IsPlayer()) then
							if (v:IsCombine()) then
		    				manhack:AddEntityRelationship(v, 3)
						else
							manhack:AddEntityRelationship(v, 1)
							end
						end
					end
				
			end
		end
	end
}