ITEM.name = "Resistance Leader Outfit"
ITEM.desc = "A black armor with Lambda signs on it. It also contains a reinforced gas-mask and a huge amount of kevlar. It also contains a trenchcoat."
ITEM.model = Model("models/lambdamovement_coat.mdl")
ITEM.replacement = {"group(%d+)", "models/lambdamovement_coat.mdl"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM:AddQuery("add 40 armor on wear")