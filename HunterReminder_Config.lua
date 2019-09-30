local addonName, addonData = ...

addonData.config = {}

addonData.config.onDefault = function()
    addonData.config.updateConfigValues()
end

--[[
    initialize the config panel
]]--
addonData.config.initConfig = function()
    addonData.config.corePanel = CreateFrame("Frame", "hunterReminder_Config", UIParent)
    local panel = addonData.config.corePanel;
    panel:SetSize(1, 1)
    panel.name = "HunterReminder"
    panel.default = addonData.config.onDefault

    panel.mainConfig = addonData.config.createConfigPanel(panel, 'mainConfig', {width = 1, height = 1}, {relativePoint = 'TOPLEFT', xOfs = 10, yOfs = -10})
    InterfaceOptions_AddCategory(panel)

    panel.configPetPanel = CreateFrame("Frame", nil, panel)
    panel.configPetPanel:SetSize(1, 1)
    panel.configPetPanel.petPanel = addonData.config.createConfigPanel(panel.configPetPanel, 'petConfig', {width = 1, height = 1}, {relativePoint = 'TOPLEFT', xOfs = 10, yOfs = -10})
    InterfaceOptions_AddCategory(panel.configPetPanel)
end

--[[
    create text
]]--
addonData.config.text = function(parent, text, size, point, color)
    local textObj = parent:CreateFontString(nil, "ARTWORK")
    textObj:SetFont("Fonts/FRIZQT__.ttf", size)
    textObj:SetJustifyV("CENTER")
    textObj:SetJustifyH("CENTER")
    textObj:SetText(text)
    textObj.SetPoint(point.relativePoint, point.xOfs, point.yOfs)
    textObj:SetTextColor(color.r, color.g, color.b, color.a)
    return textObj
end

--[[
    simple config panel factory
]]--
addonData.config.configPanelFactory = function(parentPanel, panelName, size, point)
    addonData.config.configFrame = CreateFrame("Frame", addonName .. panelName, parentPanel)
    local panel = addonData.config.configFrame
    local settings = coreSettings
    panel:SetPoint(point.relativePoint, point.xOfs, point.yOfs)
    panel:SetSize(size.width, size.height)
    
    -- Title Text
    panel.titleText = addonData.config.text(panel, "General config", 20, {relativePoint = "TOPLEFT", xOfs = 0, yOfs = 0}, {r = 1, g = 0.9, b = 0, a = 1})
    
    addonData.config.updateConfigValues(panel, settings)
    
    
    return panel
end