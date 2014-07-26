local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		self:SetPos(ScrW() * 0.375, ScrH() * 0.125)
		self:SetSize(ScrW() * nut.config.menuWidth, ScrH() * nut.config.menuHeight)
		self:MakePopup()
		self:SetTitle("Admin Items")

		local noticePanel = self:Add("nut_NoticePanel")
		noticePanel:Dock( TOP )
		noticePanel:DockMargin( 0, 0, 0, 5 )
		noticePanel:SetType( 4 )
		noticePanel:SetText("Click on the items below to spawn them.")
		
		self.list = self:Add("DScrollPanel")
		self.list:Dock(FILL)
		self.list:SetDrawBackground(true)

		self.categories = {}

		for class, itemTable in SortedPairs(nut.item.GetAll()) do
			local allowed = true

			local category = itemTable.category
			local category2 = string.lower(category)

			if (!self.categories[category2]) then
				local category3 = self.list:Add("DCollapsibleCategory")
				category3:Dock(TOP)
				category3:SetLabel(category)
				category3:DockMargin(5, 5, 5, 5)
				category3:SetPadding(5)
				local list = vgui.Create("DIconLayout")
					list.Paint = function(list, w, h)
						surface.SetDrawColor(0, 0, 0, 25)
						surface.DrawRect(0, 0, w, h)
					end
				category3:SetContents(list)
					local icon = list:Add("SpawnIcon")
					icon:SetModel(itemTable.model or "models/error.mdl", itemTable.skin)
					icon:SetToolTip("Name: " .. itemTable.name .. "\nDescription: "..itemTable:GetDesc())
					icon.DoClick = function(panel)
						netstream.Start("adm_SpawnItem", class)
					end
				category3:InvalidateLayout(true)
				self.categories[category2] = {list = list, category = category3, panel = panel}
			else
				local list = self.categories[category2].list
				local icon = list:Add("SpawnIcon")
				icon:SetModel(itemTable.model or "models/error.mdl", itemTable.skin)

				icon:SetToolTip("Name: " .. itemTable.name .. "\nDescription: "..itemTable:GetDesc())
				icon.DoClick = function(panel)
					netstream.Start("adm_SpawnItem", class)
				end
			end
		end
	end

	function PANEL:Think()
		if (!self:IsActive()) then
			self:MakePopup()
		end
	end
vgui.Register("nut_AdminSpawn", PANEL, "DFrame")

function PLUGIN:CreateMenuButtons(menu, addButton)
	if (LocalPlayer():IsAdmin()) then
		addButton("admspn", "Admin Spawn", function()
			nut.gui.admspn = vgui.Create("nut_AdminSpawn", menu)
			menu:SetCurrentMenu(nut.gui.admspn)
		end)
	end
end