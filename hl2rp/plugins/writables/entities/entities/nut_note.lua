ENT.Type = "anim"
ENT.PrintName = "Note"
ENT.Author = "Black Tea"
ENT.Spawnable = false
ENT.Category = "NutScript"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_lab/clipboard.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetNetVar("text", "")
		self:SetUseType(SIMPLE_USE)
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end

	function ENT:Use(activator)
		netstream.Start(activator, "nut_Note", {self:GetNetVar("text") , self})
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end
