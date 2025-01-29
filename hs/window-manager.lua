
----------------------------
-- Window Manager Setup
----------------------------
hs.window.animationDuration = 0
SHARED_SCREEN_REVERSE = false -- change naming convention

-- local vertical_monitor = SHARED_VERTICAL_MONITOR

-- local verticalMonitorTopAndMid = hs.geometry.rect(0.0, 0.0, 1, 3.0)
-- local verticalMonitorMiddle = hs.geometry.rect(0.0, 1.0, 1, 2.0)
-- local verticalMonitorBottom = hs.geometry.rect(0.0, 3.0, 1, 4.0)
-- local verticalMonitorTop = hs.geometry.rect(0.0, 0.0, 1, 1.0)

-- if (vertical_monitor ~= nil) then
--     -- LTB grid
--     hs.grid.setGrid('1x4', vertical_monitor)
-- end

----------------------------
-- Local Functions
----------------------------
-- local function openLofiHipHopBrowser()
--     local opera = hs.application.open('Opera', 1, true)
--     local lofi = opera:findWindow('lofi hip hop') -- opera is configured to open directly to lofi hip hop URL
--     return lofi
-- end

local function handleWindowScreen(targetScreen, window)
    centerMouseCursor(targetScreen, window)
    -- if (targetScreen:id() == VERTICAL_MONITOR_DETAILS[1]) then
    --     -- LTB grid
    --     hs.grid.set(window, verticalMonitorTopAndMid, vertical_monitor)
    -- else
        window:moveToScreen(targetScreen)
    -- end
end

local function windowMoveToScreen(previous)
    local win = hs.window.focusedWindow()
    if not win then
        return
    end

    if previous and not SHARED_SCREEN_REVERSE then
        handleWindowScreen(win:screen():previous(), win)
    elseif not previous and SHARED_SCREEN_REVERSE then
        handleWindowScreen(win:screen():previous(), win)
    else
        handleWindowScreen(win:screen():next(), win)
    end
end

----------------------------
-- Custom Menu Functions
----------------------------
function reverseScreenOrder()
    SHARED_SCREEN_REVERSE = not SHARED_SCREEN_REVERSE
    ReloadCustomMenu()
end

-- function configVerticalMonitor(verticalMonitorId)
--     local stockApp = hs.application.open('Stonks', 1, true)
--     vertical_monitor = hs.screen.find(verticalMonitorId)

--     if (vertical_monitor ~= nil) then
--         hs.grid.setGrid('1x4', vertical_monitor)
--         if (stockApp ~= nil) then stockApp = hs.application.find('Stonks') end -- not sure if this could ever be nil but :)
--         hs.grid.set(stockApp:mainWindow(), verticalMonitorTopAndMid, vertical_monitor)

--         local lofi = openLofiHipHopBrowser()
--         hs.grid.set(lofi, verticalMonitorBottom, vertical_monitor)
--     end
-- end

----------------------------
-- Vertical Monitor Grid Controls
----------------------------
-- function vertMonitorGrid_TopAndMid()
--     local win = hs.window.focusedWindow()
--     if not win or not vertical_monitor then
--         return
--     end
--     hs.grid.set(win, verticalMonitorTopAndMid, vertical_monitor)
-- end
-- function vertMonitorGrid_Bottom()
--     local win = hs.window.focusedWindow()
--     if not win or not vertical_monitor then
--         return
--     end
--     hs.grid.set(win, verticalMonitorBottom, vertical_monitor)
-- end
-- function vertMonitorGrid_Middle()
--     local win = hs.window.focusedWindow()
--     if not win or not vertical_monitor then
--         return
--     end
--     hs.grid.set(win, verticalMonitorMiddle, vertical_monitor)
-- end
-- function vertMonitorGrid_Top()
--     local win = hs.window.focusedWindow()
--     if not win or not vertical_monitor then
--         return
--     end
--     hs.grid.set(win, verticalMonitorTop, vertical_monitor)
-- end

----------------------------
-- Window Snaps
----------------------------
function window_MoveTo_Next_Screen()
    windowMoveToScreen()
end
function window_MoveTo_Previous_Screen()
    windowMoveToScreen(true)
end
function window_LeftHalfSnap()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    win:moveToUnit(hs.layout.left50)
end
function window_FullScreen()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    win:moveToUnit(hs.layout.maximized)
end
function window_RightHalfSnap()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    win:moveToUnit(hs.layout.right50)
end
function window_FullScreenWithGrid()
    local win = hs.window.focusedWindow()
    if not win then
        return
    end
    -- if (win:screen():id() == VERTICAL_MONITOR_DETAILS[1]) then -- this doesnt seem to work right...
    --     hs.grid.set(win, verticalMonitorTopAndMid, vertical_monitor)
    -- else
        win:moveToUnit(hs.layout.maximized)
    -- end
end

