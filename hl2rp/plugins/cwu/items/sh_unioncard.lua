ITEM.name = "Civil Workers' Card"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.desc = "An ID card with the digits %Digits|00000% assigned to %Name|no one%."
ITEM.flag = "y"

function ITEM:GetDesc(data)
	data = data or {Digits = "00000", Name = "no one"}

	local desc = "An ID card with the digits "..(data.Digits or "00000")..", assigned to "..(data.Name or "no one").."."

	return desc
end