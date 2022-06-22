-- Reconcile
-- afrxo, 22.06.22

local function reconcile(component)
	if type(getmetatable(component)) == "userdata" then
		if getmetatable(component).name == "FusionComponent" then
			return component.element
		end
	end
	return component
end

return reconcile
