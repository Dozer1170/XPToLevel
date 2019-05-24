---
--- Created by Eric.
--- DateTime: 5/22/2019 5:27 PM
---

local xpEventFrame = CreateFrame("Frame")

xpEventFrame:RegisterEvent("PLAYER_XP_UPDATE")

local lastPlayerXp = 0

xpEventFrame:SetScript("OnEvent", function(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = ...
    local playerXp = UnitXP(arg1)
    local maxXp = UnitXPMax(arg1)
    local xpToLevel = maxXp - playerXp
    if playerXp ~= lastPlayerXp then
        print(comma_value(xpToLevel)..'xp left')
    end
    lastPlayerXp = playerXp
end)

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
