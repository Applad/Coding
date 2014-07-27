ITEM.name = "Resistance Member Outfit"
ITEM.desc = "A combination of metropolice uniform and other pieces of fabric."
ITEM.model = Model("models/humans/group03/male_04.mdl")
ITEM.replacement = {"group(%d+)", "group03"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM:AddQuery("add 10 armor on wear")