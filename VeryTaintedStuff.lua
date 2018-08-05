local oldUIDropDownMenu_OnHide = UIDropDownMenu_OnHide
UIDropDownMenu_OnHide = function(self, id, ...)
	if self == nil then return end
	local id = self:GetID()
	if ( self.onHide ) then
		self.onHide(id+1);
		self.onHide = nil;
	end
	CloseDropDownMenus(id+1);
	OPEN_DROPDOWNMENUS[id] = nil;
	--[[
	if (id == 1) then
		UIDROPDOWNMENU_OPEN_MENU = nil;
	end
	]]
	if self.customFrames then
		for index, frame in ipairs(self.customFrames) do
			frame:Hide();
		end

		self.customFrames = nil;
	end
end