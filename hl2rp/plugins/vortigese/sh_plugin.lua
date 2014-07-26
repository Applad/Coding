PLUGIN.name = "Vortigese"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Vortigese"

nut.util.Include("sh_config.lua")

nut.chat.Register("vortigese", {
	canHear = nut.config.chatRange,
	onChat = function(speaker, text)
		local vort = {}
		local split = string.Split(text, " ")

		for k, v in pairs(split) do 
			local string = table.Random(nut.config.vortigeseWords)
			table.insert(vort, string)
		end

		local text = (LocalPlayer():Team() == FACTION_VORT) and text or table.concat(vort, " ")

		chat.AddText(Color(114, 175, 237), hook.Run("GetPlayerName", speaker, "ic", text)..": "..text)
	end,
	canSay = function(speaker)
		if (speaker:Team() != FACTION_VORT) then
			nut.util.Notify("You don't know Vortigese!", speaker)

			return false
		end

		return true
	end,
	prefix = {"/v", "/vortigese"}
})