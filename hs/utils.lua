
-- **********************
-- HS SCRIPTING UTILITIES
-- **********************

-- create menubar icon
function createIcon (iconInstance, asciiDesign, tooltip)
    tooltip = tooltip or ''
    if (iconInstance == nil) then
        iconInstance = hs.menubar.new()
        iconInstance:setIcon('ASCII:' .. asciiDesign)
        iconInstance:setTooltip(tooltip)
    end
    return iconInstance
end

-- remove menubar icon
function removeIcon (iconInstance)
    if (iconInstance ~= nil) then
        iconInstance:delete()
    end
    return nil
end

-- move mouse cursor to center of desired monitor
function centerMouseCursor (targetScreen, targetWindow)
    if (targetScreen ~= nil) then
        local centerPoint = {}
        -- if (targetWindow ~= nil) then
            -- this is not accounting for window position & is off when window is not full screen
            -- centerPoint = targetWindow:size().center

            -- local windowTopLeftPoint = targetWindow:topLeft()
            -- hs.printf('window location point')
            -- printTable(windowTopLeftPoint)
            -- local windowSize = targetWindow:size().center
            -- hs.printf('window center point')
            -- printTable(windowSize)
            -- centerPoint['y'] = windowTopLeftPoint['y'] + windowSize['y']
            -- centerPoint['x'] = windowTopLeftPoint['x'] + windowSize['x']
            -- centerPoint['x'] = screenSize['w'] / 2
        -- else
            local screenSize = targetScreen:currentMode()
            centerPoint['y'] = screenSize['h'] / 2
            centerPoint['x'] = screenSize['w'] / 2
        -- end
        hs.mouse.setRelativePosition(centerPoint, targetScreen)
    end
end
-- **********************


-- *******************
-- BASIC LUA UTILITIES
-- *******************

-- prints all entries of a table, mostly used for debug/dev on hs console
function printTable (table)
    for key, line in pairs(table) do 
        print(key)
        if isTable(line) then
            printTable(line)
        else
            print(line)
        end
    end
end

function isTable (obj)
    return type(obj) == 'table'
end

-- pause script execution
local clock = os.clock
function sleep(n)  -- 'n' in seconds, can be decimal for partial seconds
   local t0 = clock()
   while clock() - t0 <= n do
   end
end
-- *******************