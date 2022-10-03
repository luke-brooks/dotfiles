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
-- App Manager Setup
----------------------------
function myApp_FocusMouse(appName)
    hs.application.launchOrFocus(appName) -- maybe use .open instead
    sleep(0.1)
    local appInstance = hs.application.find(appName)
    -- poor timing here when launching an app
    -- i think the app instance gets populated 
    -- but the first window isnt ready
    -- so it throws nil ref errors
    if (appInstance ~= nil) then
        centerMouseCursor(appInstance:focusedWindow():screen(), appInstance:focusedWindow())
    end
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
