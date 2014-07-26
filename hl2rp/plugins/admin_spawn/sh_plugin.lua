PLUGIN.name = "Admin Spawn Panel"
PLUGIN.author = "2LT. C. Ledere"
PLUGIN.desc = "Allows administrators to spawn items into the map."

if (SERVER) then
		netstream.Hook("adm_SpawnItem", function(client, class)
			local itemTable = nut.item.Get(class)

			if (!itemTable) then
				return
			end

			local data

			if (itemTable.GetBusinessData) then
				data = itemTable:GetBusinessData(client, data)
			end
			
			local data2 = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(data2)
			local position = trace.HitPos + Vector(0, 0, 16)
				
			client:EmitSound("physics/body/body_medium_impact_soft"..math.random(1, 3)..".wav")

			local entity = nut.item.Spawn(position, client:EyeAngles(), itemTable, data, client)
		end)
	end

nut.util.Include("cl_derma.lua")