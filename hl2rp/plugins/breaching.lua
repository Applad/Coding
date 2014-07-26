PLUGIN.name = "Breaching"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds the ability to breach doors by shooting the doorhandle."

function PLUGIN:EntityTakeDamage(entity, damageInfo)
	if string.lower( entity:GetClass() ) != "prop_door_rotating" then return end

	local attacker = damageInfo:GetAttacker()
	local inflictor = damageInfo:GetInflictor()
	local damage = damageInfo:GetDamage()
	local force = damageInfo:GetDamageForce()
	local weapon = (IsValid(inflictor) and inflictor:IsPlayer()) and inflictor:GetActiveWeapon():GetClass()
	local curTime = CurTime()

	if (attacker:IsPlayer()) then		
		if (!IsValid(entity.lock) and !IsValid(entity.breach)) then
			if (damageInfo:IsBulletDamage() and weapon != "weapon_shotgun") then
				local damagePosition = damageInfo:GetDamagePosition()
				
				if (entity:WorldToLocal(damagePosition):Distance( Vector(-1.0313, 41.8047, -8.1611) ) <= 8) then		
					local effectData = EffectData()
					
					effectData:SetStart(damagePosition)
					effectData:SetOrigin(damagePosition)
					effectData:SetScale(4)
					
					util.Effect("GlassImpact", effectData, true, true)
					
					entity:Fire("Unlock", "", 0)
					entity:Fire("Open", "", 0)
				end
			end

			if (damageInfo:IsBulletDamage() and weapon == "weapon_shotgun") then
				if (attacker:GetPos():Distance( entity:GetPos() ) <= 96) then
					local damagePosition = damageInfo:GetDamagePosition()
					local effectData = EffectData()
					
					effectData:SetStart(damagePosition)
					effectData:SetOrigin(damagePosition)
					effectData:SetScale(8)
					
					util.Effect("GlassImpact", effectData, true, true)
					
					nut.util.BlastDoor(entity, force/50, 120, true)											
				end
			end
		end
	end
end