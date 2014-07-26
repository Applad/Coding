local PLUGIN = PLUGIN
local PANEL = {}
	function PANEL:Init()
		self:SetSize(340, 420)
		self:SetTitle("Note")
		self:MakePopup()
		self:Center()
	end

	function PANEL:SetEntity(entity)
		self.entity = entity
	end

	function PANEL:SetText(text)
		self.text = text
		
		self.scroll = self:Add("DScrollPanel")
		self.scroll:Dock(FILL)		

		self.content = self:Add("DTextEntry")
		self.content:Dock(FILL)
		self.content:SetMultiline(true)
		self.content:SetEditable(false)
		self.content:SetText(self.text)

		local canEdit = PLUGIN:CanPlayerEditNote(self.entity, LocalPlayer())
		local mode

		self.edit = self:Add("DButton")
		self.edit:Dock(BOTTOM)
		self.edit:DockMargin(0, 4, 0, 0)
		self.edit:SetDisabled(!canEdit)
		self.edit:SetText(canEdit and "Edit" or "You cannot edit this note")

		self.edit.DoClick = function(this)
			if (canEdit) then
				if (mode) then
					netstream.Start("nut_UpdateNote", {self.content:GetText(), self.entity})
					self.content:SetEditable(false)
					self.edit:SetText("Edit")
				else	
					self.content:SetEditable(true)
					self.edit:SetText("Save")
				end

				mode = !mode
			end
		end
	end

vgui.Register("nut_Note", PANEL, "DFrame")

netstream.Hook("nut_Note", function(data)	
	if (IsValid(nut.gui.note)) then
		nut.gui.note:Remove()
	end

	local text = data[1]
	local entity = data[2]

	nut.gui.note = vgui.Create("nut_Note")
	nut.gui.note:SetEntity(entity)
	nut.gui.note:SetText(text)
end)