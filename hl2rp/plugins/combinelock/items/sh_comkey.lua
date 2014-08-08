ITEM.name = "Civil Workers' Card"
ITEM.uniqueID = "unioncard"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.desc = "An Civil Workers' card with the digits %Digits|00000% assigned to %Name|no one%."
ITEM.noBusiness = true

function ITEM:GetDesc(data)
	data = data or {Digits = "00000", Name = "no one"}

	local desc = "An Civil Workers' card with the digits "..(data.Digits or "00000")..", assigned to "..(data.Name or "no one").."."

	return desc
end