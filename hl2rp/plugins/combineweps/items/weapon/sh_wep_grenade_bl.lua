ITEM.name = "Standard Issue Grenade"
ITEM.uniqueID = "weapon_frag"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_grenade.mdl")
ITEM.class = "weapon_frag_bl"
ITEM.type = "grenade"
ITEM.price = 0
ITEM.flag = "y"
ITEM.desc = "A dusty tube with a large pin sticking out of it, it is asking you to pull it.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 1,
	ClipOne = -1
}