ITEM.name = "Civil Protection Officer Uniform"
ITEM.desc = "A trenchcoated version of the Protection Uniform. It contains a bit more kevlar."
ITEM.model = Model("models/dpfilms/metropolice/policetrench.mdl")
ITEM.replacement = {"group(%combine)","models/dpfilms/metropolice/policetrench.mdl"}
ITEM.flag = "y"
ITEM:AddQuery("add 25 armor on wear")
ITEM.weight = 2
ITEM.useSound = "npc/metropolice/vo/unitisonduty10-8.wav"