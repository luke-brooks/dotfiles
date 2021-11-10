
builtInMonitor = nil
standardMonitor = nil
verticalMonitor = nil

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
        verticalMonitor = applyMonitorSettings(VERTICAL_MONITOR_DETAILS)
    else
        hs.notify.new({title='Monitors', informativeText='Laptop Only'}):send()
        builtInMonitor = applyMonitorSettings(BUILT_IN_ONLY)
    end
end

-- sensing this on config reload severely slows down hammerspoon
-- determineMonitorConnection()

-- monitorWatcher = hs.screen.watcher.new(determineMonitorConnection)
-- monitorWatcher:start()

