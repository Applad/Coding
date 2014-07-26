PLUGIN.name = "Writables"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds writable notes."

nut.util.Include("cl_note.lua")

function PLUGIN:CanPlayerEditNote(entity, target)
	return (target:GetNetVar("tied") != true and (!entity:GetNetVar("private") or (entity:GetNetVar("private") and entity:GetNetVar("owner") == target.character.publicVars.id)))
end

if (SERVER) then
	function PLUGIN:SaveData()
		local data = {}

		for k, v in pairs(ents.FindByClass("nut_note")) do
			local physObj = v:GetPhysicsObject()

			if (IsValid(physObj)) then
				data[#data + 1] = {
					pos = v:GetPos(),
					ang = v:GetAngles(),
					owner = v:GetNetVar("owner"),
					private = v:GetNetVar("private"),
					text = v:GetNetVar("text"),
					motion = physObj:IsMotionEnabled()
				}
			end
		end

		nut.util.WriteTable("notes", data)
	end

	function PLUGIN:LoadData()
		local restored = nut.util.ReadTable("notes")

		if (restored) then
			for k, v in pairs(restored) do
				local note = ents.Create("nut_note")
				note:SetPos(v.pos)
				note:SetAngles(v.ang)
				note:Spawn()
				note:Activate()
				note:SetNetVar("owner", v.owner)
				note:SetNetVar("private", v.private)
				note:SetNetVar("text", v.text)

				local physObj = note:GetPhysicsObject()

				if (IsValid(physObj)) then
					physObj:EnableMotion(v.motion)
				end
			end
		end
	end

	netstream.Hook("nut_UpdateNote", function(client, data)	
		local text = data[1]
		local entity = data[2]

		entity:SetNetVar("text", text)
	end)
end