PLUGIN.name = "Civil Clearance Level"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Adds a CCL (Civil Clearance Level) to CID cards. Also adds a scanner entity that will open doors if your CID cards CCL is high enough."

nut.util.Include("sh_config.lua")

function PLUGIN:SchemaInitialized()
	local item = nut.item.Get("cid")

	if (!item) then return end

	item.functions = item.functions or {}
	item.functions.CCL = {
		text = "Set CCL",
		icon = "icon16/vcard_edit.png",
		menuOnly = true,
		run = function(itemTable, client, data, entity, index)
			if (CLIENT) then
				Derma_StringRequest("Change Civil Clearance Level", "Enter the level of clearance this card should have.", "0", function(output)
					local output = tonumber(output) or 0

					netstream.Start("nut_CardCCL", {index, output})
				end)
			end

			return false
		end,
		shouldDisplay = function(itemTable, data)
			for k,v in pairs(nut.config.cclRanks) do
				if LocalPlayer():IsCombineRank(v) then return true end
			end

			return false		 
		end
	}

	function item:GetDesc(data)
		data = data or {Digits = "00000", Name = "no one", Clearance = 0}

		local desc = "An ID card with the digits "..(data.Digits or "00000")..", assigned to "..(data.Name or "no one").."."
		local unixTime = nut.util.GetUTCTime()
		local nextUse = data.NextUse
		local clearance = data.Clearance

		if (clearance and clearance > 0) then
			desc = desc.."\nThis card has a Civil Clearance Level of: "..clearance.."."
		end

		if (nextUse and nextUse > unixTime) then
			desc = desc.."\nThis card is allowed one ration in: "..math.max(math.floor((nextUse - unixTime) / 60), 1).." minute(s)."
		else
			desc = desc.."\nThis card is allowed one ration."
		end

		return desc
	end
end

if (SERVER) then
	netstream.Hook("nut_CardCCL", function(client, data)
		local index = data[1]
		local level = data[2]
		local item = client:GetItem("cid", index)

		if (item) then
			local data = table.Copy(item.data or {})
			data.Clearance = level

			client:UpdateInv("cid", -1, item.data)
			client:UpdateInv("cid", 1, data)

			nut.util.Notify("You set the cards Civil Clearance Level to "..level..".", client)
		end
	end)

	function PLUGIN:SaveData()
		local data = {}

		for k, v in pairs(ents.FindByClass("nut_scanner")) do
			if (IsValid(v.door)) then
				data[#data + 1] = {
					index = nut.util.GetCreationID(v.door),
					pos = v:GetPos(),
					ang = v:GetAngles(),
					clearance = v:GetClearance(),
					disabled = v:GetDisabled()
				}
			end
		end

		nut.util.WriteTable("scanners", data)
	end

	function PLUGIN:LoadData()
		local restored = nut.util.ReadTable("scanners")

		if (restored) then
			for k, v in pairs(restored) do
				local door

				for k2, v2 in pairs(ents.GetAll()) do
					if (nut.util.GetCreationID(v2) == v.index) then
						door = v2

						break
					end
				end

				if (IsValid(door)) then
					local scanner = ents.Create("nut_scanner")
					scanner.door = door
					scanner:SetPos(v.pos)
					scanner:SetAngles(v.ang)
					scanner:Spawn()
					scanner:Activate()
					scanner:SetClearance(v.clearance)
					scanner:SetDisabled(v.disabled)
					scanner:SetDoor(door)
				end
			end
		end
	end
end

nut.command.Register({
	adminOnly = true,
	syntax = "[number clearance] [bool disabled]",
	onRun = function(client, arguments)
		local entity = scripted_ents.Get("nut_scanner"):SpawnFunction(client, client:GetEyeTraceNoCursor())
		local level = tonumber(arguments[1]) or 0

		if (IsValid(entity)) then
			entity:SetClearance(level)
			entity:SetDisabled(util.tobool(arguments[2]))
			nut.util.Notify("You have created a scanner with a CCL requirement of "..level..".", client)
		end
	end
}, "placescanner")
