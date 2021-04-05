
local drainingIcon = nil
local chargingingIcon = nil

function batteryUsage ()
    -- TODO: show error when power is below 15%
    if (hs.battery.percentage() < 90) then
        muhAmps = hs.battery.amperage()
        if (muhAmps < 0) then
            chargingingIcon = removeIcon(chargingingIcon)
            drainingIcon = createIcon(drainingIcon, DRAINING_BATTERY_ICON, 'LOSIN POWAH')
        else
            drainingIcon = removeIcon(drainingIcon)
            chargingingIcon = createIcon(chargingingIcon, CHARGING_BATTERY_ICON)
        end
    else
        drainingIcon = removeIcon(drainingIcon)
        chargingingIcon = removeIcon(chargingingIcon)
    end
end

batteryUsage()

batteryWatcher = hs.battery.watcher.new(batteryUsage)
batteryWatcher:start()