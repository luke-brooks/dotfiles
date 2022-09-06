local function setAppManagerHotkeys(hotkeys, modifier)
    for key, app in pairs(hotkeys) do
        hs.hotkey.bind(modifier, key, function()
            hs.application.launchOrFocus(app)
            sleep(0.1)
            appInstance = hs.application.find(app)
            if (appInstance ~= nil) then
                centerMouseCursor(appInstance:focusedWindow():screen(), appInstance:focusedWindow())
            end
        end)
    end
end

hs.hotkey.bind(HYPER, 'space', function()
    hs.reload()
end)

hs.notify.new({
    title = 'Hammerspoon',
    informativeText = 'Config loaded breh'
}):send()

-- app manager
local appHyperKeys = {
    a = 'Slack',
    s = 'Gmail',
    d = 'Google Calendar',
    -- f = 'Sublime Text',
    x = 'iTerm',
    c = 'Google Chrome',
    v = 'Code',
    u = 'Spotify'
}
setAppManagerHotkeys(appHyperKeys, HYPER)

local appMehKeys = {
    e = 'Evernote',
    r = 'Google Meet/HangOut' -- i literally never use this
}
setAppManagerHotkeys(appMehKeys, MEH)

-- set temporary hotkey for designated app
-- these are used in custom-menu.lua
-- disabling temp binding key because its always set to sublime text lol
-- tempBinding = nil
-- tempKey = 'f'
-- hs.hotkey.bind(HYPER, '6', function()
--   tempBinding = hs.window.focusedWindow():application()
--   local msg = 'Setting temp binding to: ' .. tempBinding:name() .. ' on HYPER + ' .. tempKey
--   hs.notify.new({title='Temp Key Binding', informativeText=msg}):send()
--   reloadMenu()
-- end)
-- hs.hotkey.bind(HYPER, tempKey, function()
--   if (tempBinding ~= nil) then
--     hs.application.launchOrFocus(tempBinding:name())
--   end
-- end)

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
function openLofiHipHopChrome()
    -- chrome = hs.application.find('Brave') -- i want to switch to a non-chrome browser to avoid this tab getting in the way
    -- chrome = hs.application.find('Chrome')
    opera = hs.application.open('Opera', 1)
    lofi = opera:findWindow('lofi hip hop')
    -- if (lofi == nil) then
    --     -- opera:selectMenuItem({'File', 'New Window'})
    --     -- chrome:selectMenuItem({'File', 'New Window'})
    --     -- sleep(1) -- wait for new window
    --     -- lofi = chrome:findWindow('New Tab') 
    --     lofi = opera:findWindow('lofi hip hop')
    --     -- lofi:focus()
    --     -- hs.eventtap.keyStrokes('https://www.youtube.com/watch?v=jfKfPfyJRdk')
    --     -- hs.eventtap.keyStroke({}, 'return')
    -- end
    return lofi
end
