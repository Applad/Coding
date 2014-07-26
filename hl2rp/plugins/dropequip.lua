PLUGIN.name = "Drop Equiped"
PLUGIN.author = "Qemist"
PLUGIN.desc = "Makes you drop your equipped items when you die."

function PLUGIN:PlayerDeath(vic, inf, att)
	local inventory = vic:GetInventory()

	if (inventory) then
		for class, items in pairs(inventory) do
			local itemTable = nut.item.Get(class)

			if (itemTable) then
				for k, v in SortedPairs(items) do
					if !(v.data) then break end

					if (v.data.Equipped) then
						v.data.Equipped = false
						if (!itemTable.cantdrop) then
							local baseClass = itemTable.BaseClass or {}
							local baseID = baseClass.uniqueID
							local remove

							if (baseID == "base_wep") then
								if (vic:HasWeapon(itemTable.class or "")) then
									vic:SetNutVar(itemTable.type, nil)
									vic:StripWeapon(itemTable.class)
									remove = true
								end
							end

							if (baseID == "base_cloth") then
								local model = vic.character:GetData("oldModel", vic:GetModel())
								vic.character.model = model
								vic:SetModel(model)
								vic.character:SetData("oldModel", nil, nil, true)
								remove = true
							end

							if (remove) then
								vic:UpdateInv(class, -1, v.Data)
								nut.item.Spawn(vic:GetPos(), vic:EyeAngles(), itemTable, v.data, vic)
							end
						end
					end
				end
			end
		end
	end
end