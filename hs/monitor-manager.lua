
SHARED_VERTICAL_MONITOR = nil -- shared to ensure monitor swaps reach other scripts
builtInMonitor = nil
standardMonitor = nil

function swapMonitorIds ()
    local temp = STANDARD_MONITOR_DETAILS[1]
    STANDARD_MONITOR_DETAILS[1] = VERTICAL_MONITOR_DETAILS[1]
    VERTICAL_MONITOR_DETAILS[1] = temp
    -- determineMonitorConnection()
    -- reverseScreenOrder()
end

function applyMonitorSettings (settings)
    local monitor = hs.screen.find(settings[1])
    -- setMode can be used to set scaling preference via height & width
    if (monitor ~= nil) then
        -- these monitor config changes dont seem to hold
        -- they return "false" indicating a failed status change
        -- im assuming it is due to some sort of permissions error but unsure how to pin it down
        monitor:rotate(settings[2])
        monitor:setMode(settings[3], settings[4], settings[5], settings[6], settings[7])
    end
    return monitor
end

function determineMonitorConnection ()
    local allScreens = hs.screen.allScreens()
    if (#allScreens > 1) then -- this condition still triggers when laptop is connected to monitors, but kvm is pointing both to the desktop comp
        hs.notify.new({title='Monitors', informativeText='Full Monitor Setup'}):send()
        builtInMonitor = applyMonitorSettings(BUILT_IN_DETAILS)
        standardMonitor = applyMonitorSettings(STANDARD_MONITOR_DETAILS)
        SHARED_VERTICAL_MONITOR = applyMonitorSettings(VERTICAL_MONITOR_DETAILS)
    else
        hs.notify.new({title='Monitors', informativeText='Laptop Only'}):send()
        builtInMonitor = applyMonitorSettings(BUILT_IN_ONLY)
    end
end

determineMonitorConnection()

-- monitorWatcher = hs.screen.watcher.new(determineMonitorConnection)
-- monitorWatcher:start()

