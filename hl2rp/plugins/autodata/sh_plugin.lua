local PLUGIN = PLUGIN
PLUGIN.name = "Auto Data"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Automaticly sets a characters combine data if set in the config file. Also adds a command to reset a characters combine data to its default."

nut.util.Include("sh_config.lua")

function PLUGIN:ResetPlayersData(client, force)
	local character = client.character

	if not character then return end

	for k,v in pairs(nut.config.autoData) do
		if (character.publicVars.faction == k and (!character:GetData("cdata") or force)) then
			v = string.Replace(v, "%name%", character.publicVars.charname or "Error")
			v = string.Replace(v, "%digits%", client:GetDigits() or "Error")

			character:SetData("cdata", v or nut.config.defaultData)
		end
	end
end

function SCHEMA:PlayerLoadedChar(client)
	PLUGIN:ResetPlayersData(client)
end

nut.command.Register({
	syntax = "<string name>",
	onRun = function(client, arguments)
		if (!client:IsCombine()) then
			nut.util.Notify("You are not the Combine!", client)

			return
		end

		local target = nut.command.FindPlayer(client, table.concat(arguments))

		if (IsValid(target)) then
			PLUGIN:ResetPlayersData(client, true)
		end
	end
}, "resetdata")
