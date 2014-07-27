ITEM.name = "Resistance Member Outfit"
ITEM.desc = "A combination of metropolice uniform and other pieces of fabric."
ITEM.model = Model("models/humans/group03/male_04.mdl")
ITEM.replacement = {"group(%d+)", "group03"}
ITEM.price = 0
ITEM.flag = "y"
ITEM.weight = -2.5
ITEM.data = {
  Armor = 10
}
ITEM.functions = {}
ITEM.functions.Wear = {
  run = function(client)
    if (SERVER) then
      client:SetArmor(data.Armor)
    end
}