local addonName, addonData = ...

addonData.target = {}

addonData.target.onPlayerTargetChanged = function()
    if UnitExists("target") then
        addonData.target.class = UnitClass("target")[2]
        addonData.target.guid = UnitGUID("target")
    end
end
