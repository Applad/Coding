ITEM.name = "Overwatch Standard Issue Sniper Rifle"
ITEM.uniqueID = "grub_combine_sniper"
ITEM.category = "City 45 | Weaponry"
ITEM.model = Model("models/weapons/w_combinesniper_e2.mdl")
ITEM.class = "grub_combine_sniper"
ITEM.type = "primary"
ITEM.price = 0
ITEM.flag = "y"
ITEM.desc = "A metallic weapon with mechanics inbuilt.\nThere are %ClipOne|0% shots left in the magazine.\n<:: triggerQuery: REQUIRE SIGNAL = %CombineLocked|0% ::> "
ITEM.data = {
	Equipped = false,
	CombineLocked = 1,
	ClipOne = 5
}