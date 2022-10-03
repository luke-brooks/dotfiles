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
TEMP_APP_HOTKEY_BINDING = nil
function tempApp_SetKeyBinding()
    TEMP_APP_HOTKEY_BINDING = hs.window.focusedWindow():application()
    local msg = 'Setting temp binding to: ' .. TEMP_APP_HOTKEY_BINDING:name() .. ' on HYPER + f'
    hs.notify.new({
        title = 'Temp Key Binding',
        informativeText = msg
    }):send()
    ReloadCustomMenu()
end
function tempApp_Focus()
    if (TEMP_APP_HOTKEY_BINDING ~= nil) then
        -- should this focus the cursor too?
        hs.application.launchOrFocus(TEMP_APP_HOTKEY_BINDING:name())
    end
end
