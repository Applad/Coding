ITEM.name = "Resistance Leader Outfit"
ITEM.desc = "A black armor with Lambda signs on it. It also contains a reinforced gas-mask and a huge amount of kevlar. It also contains a trenchcoat."
ITEM.model = Model("models/lambdamovement_coat.mdl")
ITEM.replacement = {"group(%d+)", "models/lambdamovement_coat.mdl"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM.data = {
  Armor = 40
}
ITEM.functions = {}
ITEM.functions.Wear = {
  run = function(client)
    if (SERVER) then
      client:SetArmor(data.Armor)
    end
}