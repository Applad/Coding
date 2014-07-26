ITEM.name = "Standard Issue RPG"
ITEM.uniqueID = "weapon_rpg"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_rocket_launcher.mdl")
ITEM.class = "weapon_rpg_bl"
ITEM.type = "primary"
ITEM.price = 0
ITEM.flag = "y"
ITEM.desc = "A large black tube containing a lot of firepower.\nThere are %ClipOne|0% rockets left in the tube.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 1,
	ClipOne = 1
}