ITEM.name = "Standard Issue Pulse Rifle"
ITEM.uniqueID = "weapon_ar2"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_irifle.mdl")
ITEM.class = "weapon_ar2_bl"
ITEM.type = "primary"
ITEM.price = 0
ITEM.flag = "y"
ITEM.desc = "A sleek black weapon that has a large banana shaped magazine attached to the side of the rifle.\nThere are %ClipOne|0% shots left in the magazine.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 1,
	ClipOne = 30
}