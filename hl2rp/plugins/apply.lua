PLUGIN.name = "Civil Clearance Level"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds an apply option on CID cards that makes you say the name and digits associated with it."

function PLUGIN:SchemaInitialized()
	local item = nut.item.Get("cid")

	if (!item) then return end

	item.functions = item.functions or {}
	item.functions.Apply = {
		text = "Apply",
		icon = "icon16/user_comment.png",
		run = function(itemTable, client, data, entity, index)
			client:ConCommand("say "..(data.Name or "no one")..", "..(data.Digits or "00000"))

			return false
		end
	}
end
