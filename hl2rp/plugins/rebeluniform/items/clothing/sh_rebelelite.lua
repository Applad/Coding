ITEM.name = "Resistance Elite Outfit"
ITEM.desc = "A black armor with Lambda signs on it. It also contains a reinforced gas-mask and a large amount of kevlar."
ITEM.model = Model("models/lambdamovement.mdl")
ITEM.replacement = {"group(%d+)", "models/lambdamovement.mdl"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM.data = {
  Armor = 25
}
ITEM.functions = {}
ITEM.functions.Wear = {
  run = function(client)
    if (SERVER) then
      client:SetArmor(data.Armor)
    end
}