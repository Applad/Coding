PLUGIN.name = "Quiz"
PLUGIN.author = "Qemist"
PLUGIN.desc = "A quiz which will be shown the first time a player joins your server which they will have to answer correctly to gain access to the server."
PLUGIN.players = {}

nut.util.Include("sh_config.lua")
nut.util.Include("sh_lang.lua")
nut.util.Include("cl_quiz.lua")

if (nut.config.quiz.addcolum) then
	nut.db.Query("ALTER TABLE "..nut.config.dbPlyTable.." ADD passedQuiz boolean DEFAULT false")
end

function PLUGIN:PlayerInitialSpawn(client)
	local steamid = client:SteamID64()

	timer.Simple(5,function()
		local condition = "steamid = "..steamid.." AND rpschema = '"..SCHEMA.uniqueID.."'"
		local tables = "passedQuiz, steamid"

		if (self.players[steamid] == nil) then
			nut.db.FetchTable(condition, tables, function(data)
				if (!data) then return end

				if (data.steamid and data.passedQuiz) then
					self.players[data.steamid] = data.passedQuiz
				end
			end, nut.config.dbPlyTable)
		end

		local passed = tobool(self.players[steamid])

		if (!passed) then
			netstream.Start(client, "nut_Quiz")
		end
	end)
end

netstream.Hook("nut_QuizResult", function(client, result)
	if (!client) then return end

	if (result == true) then
		local steamid = client:SteamID64()
		local condition = "steamid = "..steamid.." AND rpschema = '"..SCHEMA.uniqueID.."'"
		local data = {}

		data.passedQuiz = "true"

		nut.db.UpdateTable(condition, data, nut.config.dbPlyTable)

		self.players[steamid] = true

		netstream.Start(client, "nut_CharMenu", true)
	else
		client:Kick(nut.config.quiz.kickMessage)
	end
end)	
