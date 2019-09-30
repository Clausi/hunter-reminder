local addonName, addonData = ...

addonData.core = {}

addonData.core.coreFrame = CreateFrame("Frame", addonName .. "CoreFrame", UIParent)
addonData.core.coreFrame:RegisterEvent("ADDON_LOADED")

local function initConfig()
    addonData.config.initConfig()
end

local function onAddonLoaded(self)
    initConfig()
end

local function Frame_OnEvent(self, event, ...)
    local args = {...}
    if event == "ADDON_LOADED" then
        if args[1] == "HunterReminder" then
            onAddonLoaded()
        end
    end
end

SLASH_HUNTERREMINDER_CONFIG1 = "/HunterReminder"
SLASH_HUNTERREMINDER_CONFIG2 = "/hunterreminder"
SLASH_HUNTERREMINDER_CONFIG3 = "/huntereminder"
SLASH_HUNTERREMINDER_CONFIG4 = "/hr"
SlashCmdList["HUNTERREMINDER_CONFIG"] = function(option)
    InterfaceOptionsFrame_OpenToCategory("HunterReminder")
    InterfaceOptionsFrame_OpenToCategory("HunterReminder")
end

addonData.core.coreFrame:SetScript("OnEvent", Frame_OnEvent)
