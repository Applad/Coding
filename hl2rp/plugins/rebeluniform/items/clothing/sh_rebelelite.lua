ITEM.name = "Resistance Elite Outfit"
ITEM.desc = "A black armor with Lambda signs on it. It also contains a reinforced gas-mask and a large amount of kevlar."
ITEM.model = Model("models/lambdamovement.mdl")
ITEM.replacement = {"group(%d+)", "models/lambdamovement.mdl"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM:AddQuery("add 25 armor on wear")