---
--- Created by Dozer1170.
--- DateTime: 5/22/2019 5:27 PM
---

local xpEventFrame = CreateFrame("Frame")

xpEventFrame:RegisterEvent("PLAYER_XP_UPDATE")
xpEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

local lastPlayerXp = 0
local killCount = 0
local estKillsToGo = 0

xpEventFrame:SetScript("OnEvent", function(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = ...

    if (event == "PLAYER_ENTERING_WORLD") then
        lastPlayerXp = UnitXP("player")
        print('XpToLevel loaded with intial xp: '..comma_value(lastPlayerXp))
    end

    if (event == "PLAYER_XP_UPDATE") then
        local playerXp = UnitXP("player")
        local levelXp = UnitXPMax("player")
        local xpToLevel = levelXp - playerXp
        killCount = killCount + 1
        local xpGained = playerXp - lastPlayerXp
        estKillsToGo = math.floor(xpToLevel / xpGained)
        
        if playerXp ~= lastPlayerXp then
            printXpToLevel(xpToLevel)
            --print('playerXp:'..playerXp..' xpGained:'..xpGained)
        end
        lastPlayerXp = playerXp
    end
end)

function printXpToLevel(xpToLevel)
    print(comma_value(xpToLevel)..' xp left. ~'..estKillsToGo..' kills to level. Kill count: '..comma_value(killCount))
end

function comma_value(amount)
    local formatted = amount
    while true do
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
            if (k==0) then
                    break
            end
    end
    return formatted
end

SLASH_XPTOLEVEL1 = "/xptolevel"
SlashCmdList["XPTOLEVEL"] = function(msg)
    local playerXp = UnitXP("player")
    local levelXp = UnitXPMax("player")
    printXpToLevel(levelXp - playerXp)
end

