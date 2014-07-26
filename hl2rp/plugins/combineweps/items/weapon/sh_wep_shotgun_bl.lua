ITEM.name = "Standard Issue Shotgun"
ITEM.uniqueID = "weapon_shotgun"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_shotgun.mdl")
ITEM.class = "weapon_shotgun_bl"
ITEM.type = "primary"
ITEM.price = 0
ITEM.desc = "A metallic shotgun that has some sort of combine materials added onto the gun near the trigger.\nThere are %ClipOne|0% shots left in the magazine.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 0,
	ClipOne = 6
}