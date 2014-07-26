CLASS.name = "Overwatch Sniper"
CLASS.faction = FACTION_OW
CLASS.model = Model("models/combine_super_soldier.mdl")

function CLASS:PlayerCanJoin(client)
	return client:IsCombineRank("SNP")
end

CLASS_OW_SNIPER = CLASS.index 