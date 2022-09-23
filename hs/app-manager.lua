----------------------------
-- App Manager Setup
----------------------------
-- i need to refactor this file badly
local function setAppManagerHotkeys(hotkeys, modifier)
    for key, app in pairs(hotkeys) do
        hs.hotkey.bind(modifier, key, function()
            hs.application.launchOrFocus(app)
            sleep(0.1)
            local appInstance = hs.application.find(app)
            -- poor timing here
            -- i think the app instance gets populated 
            -- but the first window isnt ready
            -- so it throws nil ref errors
            if (appInstance ~= nil) then
                centerMouseCursor(appInstance:focusedWindow():screen(), appInstance:focusedWindow())
            end
        end)
    end
end

-- app manager
local appHyperKeys = {
    a = 'Slack',
    s = 'Gmail',
    d = 'Google Calendar',
    -- f = 'Something For Notes plz',
    x = 'iTerm',
    c = 'Google Chrome',
    v = 'Code',
    u = 'Spotify'
}
setAppManagerHotkeys(appHyperKeys, HYPER)

local appMehKeys = {
    e = 'Evernote'
}
setAppManagerHotkeys(appMehKeys, MEH)

----------------------------
-- System Controls
----------------------------
function system_ReloadHsConfig()
    hs.reload()
end
function system_LockScreen()
    hs.caffeinate.lockScreen()
end

----------------------------
-- Temporary App Hotkey
----------------------------
tempBinding = nil
tempKey = 'f' -- this might need configured in an earlier script in init
function tempApp_SetKeyBinding()
    tempBinding = hs.window.focusedWindow():application()
    local msg = 'Setting temp binding to: ' .. tempBinding:name() .. ' on HYPER + ' .. tempKey
    hs.notify.new({
        title = 'Temp Key Binding',
        informativeText = msg
    }):send()
    ReloadCustomMenu()
end
function temp_AppFocus()
    if (tempBinding ~= nil) then
        hs.application.launchOrFocus(tempBinding:name())
    end
end
