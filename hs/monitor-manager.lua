
----------------------------
-- Monitor Manager Setup
----------------------------
-- SHARED_VERTICAL_MONITOR = nil -- shared to ensure monitor swaps reach other scripts
local builtInMonitor = nil
-- local standardMonitor = nil
local curvedMonitor = nil

----------------------------
-- Local Functions
----------------------------
local function applyMonitorSettings (settings)
    local monitor = hs.screen.find(settings[1])
    -- setMode can be used to set scaling preference via height & width
    if (monitor ~= nil) then
        -- these monitor config changes dont seem to hold
        -- they return "false" indicating a failed status change
        -- looks like this is a known issue with the underlying API of M1 vs Intel
        -- https://github.com/Hammerspoon/hammerspoon/issues/3041
        monitor:rotate(settings[2])
        monitor:setMode(settings[3], settings[4], settings[5], settings[6], settings[7])
        -- might try using this instead
        -- https://github.com/alin23/Lunar
    end
    return monitor
end

----------------------------
-- Shared Functions
----------------------------
-- function swapMonitorIds ()
--     local temp = STANDARD_MONITOR_DETAILS[1]
--     STANDARD_MONITOR_DETAILS[1] = VERTICAL_MONITOR_DETAILS[1]
--     VERTICAL_MONITOR_DETAILS[1] = temp
--     -- determineMonitorConnection()
--     -- reverseScreenOrder()
-- end

function determineMonitorConnection ()
    local allScreens = hs.screen.allScreens()
    -- hs.printf('~~~~~ Importing Script: | %s |', scriptName)
    if (#allScreens == 2) then
        hs.notify.new({title='Monitors', informativeText='Full Monitor Setup'}):send()
        builtInMonitor = applyMonitorSettings(BUILT_IN_DETAILS)
        curvedMonitor = applyMonitorSettings(CURVED_MONITOR_DETAILS)
        -- SHARED_VERTICAL_MONITOR = applyMonitorSettings(VERTICAL_MONITOR_DETAILS)
    else
        hs.notify.new({title='Monitors', informativeText='Laptop Only'}):send()
        builtInMonitor = applyMonitorSettings(BUILT_IN_ONLY)
    end
end

----------------------------
-- Script Load Executions
----------------------------
determineMonitorConnection()

-- monitorWatcher = hs.screen.watcher.new(determineMonitorConnection)
-- monitorWatcher:start()

