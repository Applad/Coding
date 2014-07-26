ITEM.name = "Combine Light"
ITEM.uniqueID = "comlight"
ITEM.model = Model("models/props_combine/combine_light001a.mdl")
ITEM.desc = "Portable light sources used to illuminate dark areas in support of Combine operations."
--ITEM.price = 0
--ITEM.flag = ""

ITEM.functions = {}
ITEM.functions.Place = {
	alias = "Place it",
	icon = "icon16/weather_sun.png",
	run = function(itemTable, client, data)
		if (SERVER) then
		
			local position
			if (IsValid(entity)) then
				position = entity:GetPos() + Vector(0, 0, 4)
			else
				local data2 = {
					start = client:GetShootPos(),
					endpos = client:GetShootPos() + client:GetAimVector() * 72,
					filter = client
				}
				local trace = util.TraceLine(data2)
				position = trace.HitPos + Vector(0, 0, 16)
			end
			
			local entity2 = entity
			local entity = ents.Create("hl2_combinelight")
			entity:SetPos(position)
			if (IsValid(entity2)) then
				entity:SetAngles(entity2:GetAngles())
			end
			entity:Spawn()
			entity:Activate()
			
		end
	end
}