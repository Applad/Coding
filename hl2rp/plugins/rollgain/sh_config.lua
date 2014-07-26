-- Add config table for the plugin.
nut.config.gains = {}
-- Gains for the HL2RP factions.
nut.config.gains.hl2rp = {
	[FACTION_CP] = {
		["05."] = 5, -- will add 5 to the maximum 05's can roll
		["04."] = 5, 
		["03."] = 10, 
		["02."] = 20, 
		["01."] = 10, 
		["OfC."] = 15, 
		["EpU."] = 20, 
		["DvL."] = 25, 
		["CmD."] = 25, 
		["SeC."] = 25
	},
	[FACTION_OW] = {
		["OWS."] = 25, 
		["SGS."] = 30, 
		["EOW."] = 35
	}
}
-- Gains for factions.
nut.config.gains.factions = { 
	  [FACTION_VORT] = 10
	--[FACTION_CWU] = 10 This would add 10 the the maximum people of the CWU can roll.
}
-- Gains for weapons.
nut.config.gains.weapons = {
	["nut_stunstick"] = 5, -- gives players holding a stunstick a 5 boost when rolling.
	["weapon_crowbar"] = 10, 
	["weapon_pistol"] = 15, 
	["weapon_357"] = 20, 
	["weapon_smg1"] = 25, 
	["weapon_shotgun"] = 30, 
	["weapon_crossbow"] = 30, 
	["weapon_ar2"] = 35
}
-- Gains for attributes.
nut.config.gains.attributes = {
	["str"] = {20, 10}, -- gives players with 20 or more strength a 5 boost when rolling
	["acr"] = {20, 5}, 
	["spd"] = {20, 5}, 
	["end"] = {20, 5}
}