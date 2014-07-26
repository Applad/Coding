PLUGIN.name = "Show Commands"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Shows commands next the chatbox as you are typing them."

if (CLIENT) then
	function PLUGIN:ChatTextChanged(text)
		if (!string.sub(text, 1, 1) == "/") then return end

		Options = {}

		local Explode = string.Explode(" ", string.sub(text, 2))

		if (!Explode[1]) then return end

		local Command = string.lower(Explode[1])

		for k, v in pairs(nut.command.buffer) do
			if (string.sub(string.lower(k), 1, string.len(Command)) == Command) then
		 		if (string.len(Command) > 0) then
		 			local commandTable = v

		 			if (commandTable) then
						if (commandTable.onRun) then
							Options[k] = v.syntax
						end
					end	
				end
			end
		end

		table.sort(Options)
	end

	function PLUGIN:FinishChat()
		Options = {}
	end

	function PLUGIN:HUDPaint()
		if (!Options) then return end

		local ChatBoxPosX, ChatBoxPosY = chat.GetChatBoxPos()

		local count = 1
		for option, syntax in pairs(Options) do
			if (count <= 13) then
				draw.SimpleText("/"..option.." "..syntax, "nut_ChatFont", ChatBoxPosX + 522, ChatBoxPosY - 76 + count*20, Color(255,255,255,255))

				count = count + 1
			else
				draw.SimpleText("...", "nut_ChatFont", ChatBoxPosX + 522, ChatBoxPosY - 76 + 280, Color(255,255,255,255))
				break
			end
		end
	end
end


