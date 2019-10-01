local addonName, addonData = ...

addonData.core = {}

addonData.core.coreFrame = CreateFrame("Frame", addonName .. "CoreFrame", UIParent)
addonData.core.coreFrame:RegisterEvent("ADDON_LOADED")

--[[
    initialize config
--]]
local function initConfig()
    addonData.config.initConfig()
end

--[[
    event onAddonLoaded
--]]
local function onAddonLoaded(self)
    addon_data.core.coreFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    addon_data.core.coreFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
    addon_data.core.coreFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

    -- initialize config
    initConfig()
end

--[[
    register events
--]]
local function Frame_OnEvent(self, event, ...)
    local args = {...}
    if event == "ADDON_LOADED" then
        if args[1] == "HunterReminder" then
            onAddonLoaded()
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        addonData.core.inCombat = false
    elseif event == "PLAYER_REGEN_DISABLED" then
        addonData.core.inCombat = true
    elseif event == "PLAYER_TARGET_CHANGED" then
        addonData.target.onPlayerTargetChanged()
    end
end

--[[
    send addon chat message
--]]
addon_data.utils.printMsg = function(msg)
    chatMsg = "|cFF00FFB0" .. addonName .. ": |r" .. msg
    DEFAULT_CHAT_FRAME:AddMessage(chatMsg)
end

--[[
    add slash commands
--]]
SLASH_HUNTERREMINDER_CONFIG1 = "/HunterReminder"
SLASH_HUNTERREMINDER_CONFIG2 = "/hunterreminder"
SLASH_HUNTERREMINDER_CONFIG3 = "/huntereminder"
SLASH_HUNTERREMINDER_CONFIG4 = "/hr"
SlashCmdList["HUNTERREMINDER_CONFIG"] = function(option)
    InterfaceOptionsFrame_OpenToCategory("HunterReminder")
    InterfaceOptionsFrame_OpenToCategory("HunterReminder")
end

--[[
    set the main event
--]]
addonData.core.coreFrame:SetScript("OnEvent", Frame_OnEvent)
