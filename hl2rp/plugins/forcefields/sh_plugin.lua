PLUGIN.name = "ForceFields"
PLUGIN.author = "Zenolisk"
PLUGIN.desc = "Combine Force Fields."

--Load / Save Functions
if (SERVER) then

function PLUGIN:LoadData()
	for k, v in pairs(nut.util.ReadTable("forcefieldsmall")) do
		local entity = ents.Create("nut_forcefield_small")
		entity:SetPos(v.pos)
		entity:SetAngles(v.angles)
		entity:Spawn()
		entity:Activate()
	    entity:SpawnProps()
	end

	for k, v in pairs(nut.util.ReadTable("forcefieldmedium")) do
		local entity = ents.Create("nut_forcefield_medium")
		entity:SetPos(v.pos)
		entity:SetAngles(v.angles)
		entity:Spawn()
		entity:Activate()
	    entity:SpawnProps()
	end

	for k, v in pairs(nut.util.ReadTable("forcefieldlarge")) do
		local entity = ents.Create("nut_forcefield_large")
		entity:SetPos(v.pos)
		entity:SetAngles(v.angles)
		entity:Spawn()
		entity:Activate()
	    entity:SpawnProps()
	end
end

function PLUGIN:SaveForceFieldsSmall()
	local data = {}

	for k, v in pairs(ents.FindByClass("nut_forcefield_small")) do
		data[#data + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles()
		}
	end

	nut.util.WriteTable("forcefieldsmall", data)
end

function PLUGIN:SaveForceFieldsMedium()
	local data = {}

	for k, v in pairs(ents.FindByClass("nut_forcefield_medium")) do
		data[#data + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles()
		}
	end

	nut.util.WriteTable("forcefieldmedium", data)
end


function PLUGIN:SaveForceFieldsLarge()
	local data = {}

	for k, v in pairs(ents.FindByClass("nut_forcefield_large")) do
		data[#data + 1] = {
			pos = v:GetPos(),
			angles = v:GetAngles()
		}
	end

	nut.util.WriteTable("forcefieldlarge", data)
end

function PLUGIN:SaveData()
    self:SaveForceFieldsSmall()
    self:SaveForceFieldsMedium()
    self:SaveForceFieldsLarge()
end

end