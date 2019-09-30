local addonName, addonData = ...

addonData.pet = {}

addonData.pet.configPanelFactory = function(parentPanel, panelName, size, point)
    addonData.config.configFrame = CreateFrame("Frame", addonName .. panelName, parentPanel)
    local panel = addonData.config.configFrame
    local settings = petSettings

    panel:SetPoint(point.relativePoint, point.xOfs, point.yOfs)
    panel:SetSize(size.width, size.height)
    
    -- Title Text
    panel.titleText = addonData.config.text(panel, "Pet config", 20, {relativePoint = "TOPLEFT", xOfs = 0, yOfs = 0}, {r = 1, g = 0.9, b = 0, a = 1})
    
    addonData.config.updateConfigValues(panel, settings)
    
    InterfaceOptions_AddCategory(panel)
    return panel
end