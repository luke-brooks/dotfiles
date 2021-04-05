
local function setAppManagerHotkeys (hotkeys, modifier)
  for key, app in pairs(hotkeys) do
    hs.hotkey.bind(modifier, key, function()
        hs.printf('app name is %s', app)
      hs.application.launchOrFocus(app)
      sleep(0.1)
      appInstance = hs.application.find(app)
      hs.printf('app is %s', appInstance)
      if (appInstance ~= nil) then
        hs.printf('window is %s', appInstance:focusedWindow())
        centerMouseCursor(appInstance:focusedWindow():screen(), appInstance:focusedWindow())
      end
    end)
  end
end

hs.hotkey.bind(HYPER, 'space', function()
  hs.reload()
end)

hs.notify.new({title='Hammerspoon', informativeText='Config loaded breh'}):send()

-- app manager
local appHyperKeys = {
  a = 'Slack', -- this doesnt always have a mainWindow()
  s = 'Gmail',
  d = 'Google Calendar',
  x = 'iTerm',
  c = 'Google Chrome',
  v = 'Visual Studio Code', -- the name becomes just 'Code' after the app has been launched wtf
  u = 'Spotify',
--   y = 'zoom.us'
}
setAppManagerHotkeys(appHyperKeys, HYPER)

local appMehKeys = {
  e = 'Evernote',
  r = 'Google Meet/HangOut' -- i literally never use this
}
setAppManagerHotkeys(appMehKeys, MEH)

-- set temporary hotkey for designated app
-- these are used in custom-menu.lua
tempBinding = nil
tempKey = 'f'
hs.hotkey.bind(HYPER, '6', function()
  tempBinding = hs.window.focusedWindow():application()
  local msg = 'Setting temp binding to: ' .. tempBinding:name() .. ' on HYPER + ' .. tempKey
  hs.notify.new({title='Temp Key Binding', informativeText=msg}):send()
  reloadMenu()
end)

hs.hotkey.bind(HYPER, tempKey, function()
  if (tempBinding ~= nil) then
    hs.application.launchOrFocus(tempBinding:name())
  end
end)

-- lock screen
hs.hotkey.bind(MEH, '6', function()
    hs.caffeinate.lockScreen()
end)
-- keep computer unlocked
hs.hotkey.bind(MEH, '7', function()
    lofi = openLofiHipHopChrome()
    lofi:focus()
end)

-- also used in monitor-manager.lua
function openLofiHipHopChrome ()
    chrome = hs.application.find('Chrome')
    lofi = chrome:findWindow('lofi hip hop')
    if (lofi == nil) then
        chrome:selectMenuItem({'File', 'New Window'})
        sleep(0.5) -- wait for new window
        lofi = chrome:findWindow('New Tab')
        lofi:focus()
        hs.eventtap.keyStrokes('https://www.youtube.com/watch?v=5qap5aO4i9A')
        hs.eventtap.keyStroke({}, 'return')
    end
    return lofi
end
