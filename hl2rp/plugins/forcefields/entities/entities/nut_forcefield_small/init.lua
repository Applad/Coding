AddCSLuaFile("shared.lua");
AddCSLuaFile("cl_init.lua");

include("shared.lua");

local dissolver;

function ENT:Initialize()
	self:SetModel("models/hunter/plates/plate2x4.mdl");
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
    self:SetCollisionGroup(COLLISION_GROUP_NONE);
	self:SetSolid(SOLID_VPHYSICS);
    self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false);
    self.policeOnly = false;
    self:SetMaterial("effects/com_shield003a")
    dissolver = ents.Create("env_entity_dissolver");
    dissolver:SetKeyValue("dissolvetype", 3);
    dissolver:SetKeyValue("magnitude", 5);
    dissolver:Spawn();
	
	self.sound = CreateSound(self, Sound("ambient/machines/combine_shield_loop3.wav"))
	self.sound:SetSoundLevel(100)
	self.sound:PlayEx(1, 100)
end;

function ENT:SpawnFunction(client, trace)

    local entity = ents.Create("nut_forcefield_small");
    entity:Spawn();
    entity:Activate();
	entity:SetPos(trace.HitPos + Vector(0,0,80))
	entity:SetAngles(Angle(0,90,-90))
    entity:SpawnProps();

    return entity;
end;

local blacklist = {
    "info_player_start",
    "physgun_beam",
    "player",
    "npc_cscanner",
    "prop_ragdoll",
    "prop_vehicle_zapc",
	"y_helicopter",
    "predicted_viewmodel"
};

function ENT:DissolveEntity(entity)
    if ( !table.HasValue( blacklist, entity:GetClass() ) ) then
        local target = "targeted_"..entity:EntIndex();

        entity:SetKeyValue("targetname", target);

        dissolver:SetPos( entity:GetPos() );
        dissolver:Fire("Dissolve", target, 0);
    end;
end;

function ENT:StartTouch(entity)
    if ( (entity.nextFFTouch or 0) < CurTime() ) then
        if ( entity:IsPlayer() or entity:IsNPC() or entity:IsVehicle() ) then
            if ( entity:IsPlayer() ) then
                if (entity:Team() == FACTION_CITIZEN) then
                    if (self.policeOnly) then
                        self:EmitSound("buttons/button8.wav");
                        entity.nextFFTouch = CurTime() + 2.5;

                        return;
                    end;
                end;
            end;

            self:EmitSound("buttons/button9.wav");
            self:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
        else
            self:EmitSound("buttons/button8.wav");
            print(self.shouldDissolve)
            if ( self.shouldDissolve ) then
                print("Fuck:")
                self:DissolveEntity(entity);
            end;
        end;

        entity.nextFFTouch = CurTime() + 2.5;
    end;
end;

function ENT:EndTouch(entity)
    timer.Simple(1.5, function()
        if ( !IsValid(entity) ) then
            self:SetCollisionGroup(COLLISION_GROUP_NONE);
        else
            timer.Simple(1.5, function()
                self:SetCollisionGroup(COLLISION_GROUP_NONE);
            end);
        end;
    end);
end;

function ENT:Use(activator, caller)
    if ( IsValid(activator) and activator:IsPlayer() and activator:IsCombine() ) then
        if ( (self.nextUse or 0) < CurTime() ) then
            self.nextUse = CurTime() + 2.5;
            self.policeOnly = !self.policeOnly;

            if (self.policeOnly) then
                self:EmitSound("buttons/combine_button2.wav");
            else
                self:EmitSound("buttons/combine_button1.wav");
            end;
        end;
    end;
end;

function ENT:OnRemove()
	if self.sound then
		self.sound:Stop()
	end
end

function ENT:SpawnProps()
    local rotation = Vector(180, 0, 90);
    local rotation2 = Vector(90, 0, 90);
    local angles = self:GetAngles();
    local angles2 = self:GetAngles();

    angles:RotateAroundAxis(angles:Right(),90); 
    angles:RotateAroundAxis(angles:Up(), 0); 
    angles:RotateAroundAxis(angles:Forward(), 90);

    angles2:RotateAroundAxis(angles2:Right(), 90); 
    angles2:RotateAroundAxis(angles2:Up(), 0); 
    angles2:RotateAroundAxis(angles2:Forward(), 90);

    local left = ents.Create("prop_dynamic");
    left:SetPos(self:GetPos() +  self:GetForward() * -55 + self:GetRight() * -55 + self:GetUp() * 1);
    left:SetAngles(angles);
    left:SetModel("models/props_combine/combine_fence01a.mdl")
    left:Activate();
    left:SetParent(self);
    left:Spawn();
    left:DeleteOnRemove(self);

    local right = ents.Create("prop_dynamic");
    right:SetPos(self:GetPos() + self:GetForward() * 55 + self:GetRight() * -55 + self:GetUp() * 1);
    right:SetAngles(angles2);
    right:SetModel("models/props_combine/combine_fence01b.mdl")
    right:Activate();
    right:SetParent(self);
    right:Spawn();
    right:DeleteOnRemove(self);
end;