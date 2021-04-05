
-- window manager
hs.window.animationDuration = 0
screenReverse = false

local vertical_monitor = hs.screen.find(VERTICAL_MONITOR_DETAILS[1])
local verticalMonitorTop = hs.geometry.rect(0.0,0.0,1,3.0)
local verticalMonitorBottom = hs.geometry.rect(0.0,3.0,1,4.0)

if (vertical_monitor ~= nil) then
    hs.grid.setGrid('1x4', vertical_monitor)
end

function reverseScreenOrder () 
    screenReverse = not screenReverse 
    reloadMenu()
end

function configVerticalMonitor (verticalMonitorId)
    hs.application.launchOrFocus('Stonks')
    hs.application.launchOrFocus('Chrome')
    sleep(0.5) -- pause script to ensure apps have loaded
    vertical_monitor = hs.screen.find(verticalMonitorId)

    if (vertical_monitor ~= nil) then
        hs.grid.setGrid('1x4', vertical_monitor)
        stockApp = hs.application.find('Stonks')
        hs.grid.set(stockApp:mainWindow(), verticalMonitorTop, vertical_monitor)

        lofi = openLofiHipHopChrome()
        hs.grid.set(lofi, verticalMonitorBottom, vertical_monitor)
    end 
end

function moveToScreen (previous)
    local win = hs.window.focusedWindow()
    if not win then return end

    if previous and not screenReverse then
        handleWindowScreen(win:screen():previous(), win)
    elseif not previous and screenReverse then
        handleWindowScreen(win:screen():previous(), win)
    else
        handleWindowScreen(win:screen():next(), win)
    end
end

function handleWindowScreen (targetScreen, window)
    centerMouseCursor(targetScreen, window)
    if (targetScreen:id() == VERTICAL_MONITOR_DETAILS[1]) then
        hs.grid.set(window, verticalMonitorTop, vertical_monitor)
    else
        window:moveToScreen(targetScreen)
    end
end

-- vertical monitor snap
hs.hotkey.bind(MEH, '1', function()
    local win = hs.window.focusedWindow()
    if not win or not vertical_monitor then return end
    hs.grid.set(win, verticalMonitorTop, vertical_monitor)
end)
hs.hotkey.bind(MEH, '2', function()
    local win = hs.window.focusedWindow()
    if not win or not vertical_monitor then return end
    hs.grid.set(win, verticalMonitorBottom, vertical_monitor)
end)

-- right hand controls
hs.hotkey.bind(HYPER, 'h', function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind(HYPER, 'j', function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToUnit(hs.layout.maximized)
end)
hs.hotkey.bind(HYPER, 'k', function()
    moveToScreen()
end)
hs.hotkey.bind(HYPER, 'l', function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToUnit(hs.layout.right50)
end)

-- left hand controls
hs.hotkey.bind(HYPER, 'home', function()
    -- this! check screen, if on vertical do the 3/4 grid instead of fulls screen
  local win = hs.window.focusedWindow()
  if not win then return end
  if (win:screen():id() == VERTICAL_MONITOR_DETAILS[1]) then
      hs.grid.set(win, verticalMonitorTop, vertical_monitor)
  else
      win:moveToUnit(hs.layout.maximized)
  end
end)
hs.hotkey.bind(HYPER, 'up', function()
    -- previous screen
    moveToScreen(true)
end)
hs.hotkey.bind(HYPER, 'down', function()
    moveToScreen()
end)
