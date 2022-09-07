
local drainingIcon = nil
local chargingingIcon = nil

function batteryUsage ()
    -- TODO: show error when power is below 15%
    if (hs.battery.percentage() < 70) then
        -- muhAmps = hs.battery.amperage() -- amperage only returns nil with the m1....
        -- if (muhAmps < 0) then
        isCharging = hs.battery.isCharging() -- this is less reliable
        -- its possible to be "charging" while burning more power than is incoming 
        -- causing a decline in battery charge 
        -- which is why amperage was more reliable
        if (isCharging < 0) then
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