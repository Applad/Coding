ITEM.name = "Standard Issue MP7"
ITEM.uniqueID = "weapon_smg1"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_smg1.mdl")
ITEM.class = "weapon_smg1_bl"
ITEM.type = "primary"
ITEM.price = 0
ITEM.desc = "A metallic submachinegun with a dark metallic undertone and a holographic sight.\nThere are %ClipOne|0% shots left in the magazine.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 1,
	ClipOne = 45
}