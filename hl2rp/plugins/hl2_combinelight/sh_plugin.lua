PLUGIN.name = "Combine Light"
PLUGIN.author = "robinkooli"
PLUGIN.desc = "Portable light sources used to illuminate dark areas in support of Combine operations."

nut.command.Register({
	adminOnly = true,
	syntax = "[bool disabled]",
	onRun = function(client, arguments)
		local entity = scripted_ents.Get("hl2_combinelight"):SpawnFunction(client, client:GetEyeTraceNoCursor())

		if (IsValid(entity)) then
			nut.util.Notify("You have created a Combine Light.", client)
		end
	end
}, "placecl")