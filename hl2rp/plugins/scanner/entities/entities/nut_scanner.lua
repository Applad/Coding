AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Scanner"
ENT.Author = "Qemist"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.PhysgunAllowAdmin = true

local COLOR_RED = 1
local COLOR_ORANGE = 2
local COLOR_BLUE = 3
local COLOR_GREEN = 4

local colors = {
	[COLOR_RED] = Color(255, 50, 50),
	[COLOR_ORANGE] = Color(255, 80, 20),
	[COLOR_BLUE] = Color(50, 80, 230),
	[COLOR_GREEN] = Color(50, 240, 50)
}

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "DispColor")
	self:NetworkVar("Int", 1, "Clearance")
	self:NetworkVar("String", 1, "Text")
	self:NetworkVar("Bool", 0, "Disabled")
end

function ENT:SpawnFunction(client, trace)
	if (!IsValid(trace.Entity) or !trace.Entity:IsDoor()) then
		nut.util.Notify("You need to be aiming at a valid door.", client)

		return
	end

	local entity = ents.Create("nut_scanner")
	entity:SetPos(trace.HitPos)
	entity:SetAngles(trace.HitNormal:Angle())
	entity:Spawn()
	entity:Activate()

	if (IsValid(trace.Entity) and trace.Entity:IsDoor()) then
		entity:SetDoor(trace.Entity)
	end

	return entity
end

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/props_lab/keypad.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetText("INSERT ID")
		self:SetDispColor(COLOR_GREEN)
		self.canUse = true

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end
	end
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()

		local position, angles = self:GetPos(), self:GetAngles()

		angles:RotateAroundAxis(angles:Forward(), 90)
		angles:RotateAroundAxis(angles:Right(), 270)

		cam.Start3D2D(position + self:GetForward()*1.02 + self:GetRight()*3.0 + self:GetUp()*5.5, angles, 0.1)
			render.PushFilterMin(TEXFILTER.NONE)
			render.PushFilterMag(TEXFILTER.NONE)

			surface.SetDrawColor(40, 40, 40)
			surface.DrawRect(0, 0, 60, 110)

			draw.SimpleText((self:GetDisabled() and "OFFLINE" or (self:GetText() or "")), "Default", 30, 0, Color(255, 255, 255, math.abs(math.cos(RealTime() * 1.5) * 255)), 1, 0)

			surface.SetDrawColor(colors[self:GetDisabled() and COLOR_RED or self:GetDispColor()] or color_white)
			surface.DrawRect(4, 14, 52, 82)

			surface.SetDrawColor(60, 60, 60)
			surface.DrawOutlinedRect(4, 14, 52, 82)

			draw.SimpleText("CCL "..(self:GetClearance() or 0), "Default", 30, 96, Color(255, 255, 255, math.abs(math.cos(RealTime() * 1.5) * 255)), 1, 0)

			render.PopFilterMin()
			render.PopFilterMag()
		cam.End3D2D()
	end
else
	function ENT:SetUseAllowed(state)
		self.canUse = state
	end

	function ENT:Error(text)
		self:EmitSound("buttons/combine_button_locked.wav")
		self:SetText(text)
		self:SetDispColor(COLOR_RED)

		timer.Create("nut_scannerError"..self:EntIndex(), 1.5, 1, function()
			if (IsValid(self)) then
				self:SetText("INSERT ID")
				self:SetDispColor(COLOR_GREEN)

				timer.Simple(0.5, function()
					if (!IsValid(self)) then return end

					self:SetUseAllowed(true)
				end)
			end
		end)
	end

	function ENT:Open()
		self:SetText("OPENING")
		self.door:Fire("unlock")
		self.door:Fire("open")
		
		timer.Simple(4, function()
			if (!IsValid(self)) then return end

			self:SetText("INSERT ID")
			self:SetDispColor(COLOR_GREEN)
			self:EmitSound("buttons/combine_button1.wav")

			timer.Simple(0.75, function()
				if (!IsValid(self)) then return end

				self:SetUseAllowed(true)
			end)
		end)
	end

	function ENT:SetDoor(door)
		if (!IsValid(door)) then
			return
		end

		self.door = door
		door.lock = self
	end

	function ENT:Use(activator)
		if ((self.nextUse or 0) >= CurTime()) then
			return
		end

		if (activator:Team() == FACTION_CITIZEN) then
			if (!self.canUse or self:GetDisabled()) then
				return
			end

			self:SetUseAllowed(false)
			self:SetText("CHECKING")
			self:SetDispColor(COLOR_BLUE)
			self:EmitSound("ambient/machines/combine_terminal_idle2.wav")

			timer.Simple(1, function()
				if (!IsValid(self) or !IsValid(activator)) then return self:SetUseAllowed(true) end

				local itemTable = activator:GetItem("cid")

				if (!itemTable) then
					return self:Error("INVALID ID")
				else
					if ((itemTable.data and itemTable.data.Clearance or 0) < self:GetClearance()) then
						return self:Error("REJECTED")
					end

					self:SetText("ID OKAY")
					self:EmitSound("buttons/button14.wav", 100, 50)

					timer.Simple(1, function()
						if (!IsValid(self) or !IsValid(activator)) then return self:SetUseAllowed(true) end
						local itemTable = activator:GetItem("cid")

						if (itemTable) then
							self:Open()
						else
							self:Error("ERROR")
						end
					end)
				end
			end)
		elseif (activator:IsCombine()) then
			self:SetDisabled(!self:GetDisabled())
			self:EmitSound(self:GetDisabled() and "buttons/combine_button1.wav" or "buttons/combine_button2.wav")
			self.nextUse = CurTime() + 1
		end
	end
end