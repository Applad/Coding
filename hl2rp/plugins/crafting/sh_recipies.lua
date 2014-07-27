local PLUGIN = PLUGIN

local RECIPE = {}
RECIPE.uid = "sledgehammer"
RECIPE.name = "Sledgehammer"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/weapons/w_sledgehammer.mdl" )
RECIPE.desc = "A hammer. It may be useful to craft other things. It may break after use."
RECIPE.noBlueprint = true
RECIPE.items = {
	["woodpiece"] = 1,
	["stone"] = 1,
}
RECIPE.result = {
	["sledgehammer"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "stoneiron"
RECIPE.name = "Stone"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_foliage/rock_forest01b.mdl" )
RECIPE.desc = "Two stones combined. It's one big stone."
RECIPE.noBlueprint = true
RECIPE.items = {
	["stonepiecemetal"] = 2,
}
RECIPE.result = {
	["stonemetal"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "stone"
RECIPE.name = "Stone"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_foliage/rock_forest01b.mdl" )
RECIPE.desc = "Two stones combined. It's one big stone."
RECIPE.noBlueprint = true
RECIPE.items = {
	["stonepiece"] = 2,
}
RECIPE.result = {
	["stone"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "stonesulfur"
RECIPE.name = "Stone"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_foliage/rock_forest01b.mdl" )
RECIPE.desc = "Two stones combined. It's one big stone."
RECIPE.noBlueprint = true
RECIPE.items = {
	["stonepiecesulfur"] = 2,
}
RECIPE.result = {
	["stonesulfur"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "metal"
RECIPE.name = "Metal"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/weapons/w_sledgehammer.mdl" )
RECIPE.desc = "Metal. It could be really useful for future crafting."
RECIPE.noBlueprint = true
RECIPE.items = {
	["sledgehammer"] = 1,
	["stonemetal"] = 1,
}
RECIPE.result = {
	["metal"] = 2,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "sulfur"
RECIPE.name = "Sulfur"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_foliage/rock_forest01a.mdl" )
RECIPE.desc = "Sulfur. It may help you get some weaponry."
RECIPE.noBlueprint = true
RECIPE.items = {
	["sledgehammer"] = 1,
	["stonesulfur"] = 1,
}
RECIPE.result = {
	["sulfur"] = 2,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "lighter"
RECIPE.name = "Lighter"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_c17/TrapPropeller_Lever.mdl" )
RECIPE.desc = "A simple lighter to make fire."
RECIPE.noBlueprint = true
RECIPE.items = {
	["metal"] = 2,
}
RECIPE.result = {
	["lighter"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "ash"
RECIPE.name = "Ash"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_junk/cardboard_box004a.mdl" )
RECIPE.desc = "A box which contains ash."
RECIPE.noBlueprint = true
RECIPE.items = {
	["lighter"] = 1,
	["woodpiece"] = 1,
}
RECIPE.result = {
	["ash"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "gunpowder"
RECIPE.name = "Gunpowder"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_lab/box01a.mdl" )
RECIPE.desc = "Gunpowder packed into a box. "
RECIPE.noBlueprint = true
RECIPE.items = {
	["sulfur"] = 1,
	["ash"] = 1,
}
RECIPE.result = {
	["gunpowder"] = 4,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "pistol"
RECIPE.name = "9mm Pistol"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/weapons/w_pistol.mdl" )
RECIPE.desc = "A simple weapon which uses 9mm."
RECIPE.noBlueprint = false
RECIPE.items = {
	["metal"] = 8,
}
RECIPE.result = {
	["wep_pistol"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "pistolammo"
RECIPE.name = "9mm Pistol Ammo"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/Items/BoxSRounds.mdl" )
RECIPE.desc = "Ammo for the 9mm Pistol."
RECIPE.noBlueprint = false
RECIPE.items = {
	["gunpowder"] = 4,
}
RECIPE.result = {
	["pistol"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "smallcrate"
RECIPE.name = "Small Wooden Crate"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_junk/wood_crate001a.mdl" )
RECIPE.desc = "A small wooden crate which can be opened."
RECIPE.noBlueprint = true
RECIPE.items = {
	["woodpiece"] = 5,
}
RECIPE.result = {
	["crate"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "largecrate"
RECIPE.name = "Large Wooden Crate"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/props_junk/wood_crate002a.mdl" )
RECIPE.desc = "A large wooden crate which can be opened."
RECIPE.noBlueprint = true
RECIPE.items = {
	["woodpiece"] = 10,
}
RECIPE.result = {
	["crate_big"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "smg"
RECIPE.name = "MP7"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/weapons/w_smg1.mdl" )
RECIPE.desc = "A machine pistol."
RECIPE.noBlueprint = false
RECIPE.items = {
	["metal"] = 20,
}
RECIPE.result = {
	["wep_smg1"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "smgammo"
RECIPE.name = "MP7 Ammo"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/Items/BoxMRounds.mdl" )
RECIPE.desc = "Ammo for the Machine Pistol."
RECIPE.noBlueprint = false
RECIPE.items = {
	["gunpowder"] = 8,
}
RECIPE.result = {
	["smg"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "crowbar"
RECIPE.name = "Crowbar"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.items = {
	["metal"] = 5,
}
RECIPE.result = {
	["wep_crowbar"] = 1,
}
RECIPES:Register( RECIPE )

local RECIPE = {}
RECIPE.uid = "crossbow"
RECIPE.name = "Crossbow"
RECIPE.category = nut.lang.Get( "icat_material" )
RECIPE.model = Model( "models/weapons/w_crowbar.mdl" )
RECIPE.desc = "A crowbar made out of metal."
RECIPE.noBlueprint = false
RECIPE.items = {
	["metal"] = 50,
}
RECIPE.result = {
	["wep_crossbow"] = 1,
}
RECIPES:Register( RECIPE )




