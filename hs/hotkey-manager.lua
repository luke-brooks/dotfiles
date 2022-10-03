local function customBindHotkeys(hotKeyTable)
    for index, mapping in pairs(hotKeyTable) do
        local hotkeyModifier = mapping[1]
        local hotkey = mapping[2]
        local fnToBind = mapping[3]
        local appNameForHotkey = mapping[4]

        if (appNameForHotkey ~= nil) then
            hs.hotkey.bind(hotkeyModifier, hotkey, function()
                fnToBind(appNameForHotkey)
            end)
        else
            hs.hotkey.bind(hotkeyModifier, hotkey, fnToBind)
        end
    end
end

local allHotkeys = {
    ----------------------------
    -- System Controls
    ----------------------------
    {HYPER, 'space', system_ReloadHsConfig},
    {MEH, '6', system_LockScreen},

    ----------------------------
    -- My App Hotkeys
    ----------------------------
    {HYPER, 'a', myApp_FocusMouse, 'Slack'},
    {HYPER, 's', myApp_FocusMouse, 'Gmail'},
    {HYPER, 'd', myApp_FocusMouse, 'Google Calendar'},
    {HYPER, 'x', myApp_FocusMouse, 'iTerm'},
    {HYPER, 'c', myApp_FocusMouse, 'Google Chrome'},
    {HYPER, 'v', myApp_FocusMouse, 'Code'},
    {HYPER, 'u', myApp_FocusMouse, 'Spotify'},
    {MEH, 'e', myApp_FocusMouse, 'Evernote'},

    ----------------------------
    -- Temporary App Hotkey
    ----------------------------
    {HYPER, '6', tempApp_SetKeyBinding},
    {HYPER, 'f', tempApp_Focus},

    ----------------------------
    -- Window Controls
    ----------------------------
    -- Left Hand 
    {HYPER, 'home', window_FullScreen},
    {HYPER, 'up', window_MoveTo_Previous_Screen},
    {HYPER, 'down', window_MoveTo_Next_Screen},

    -- Right Hand
    {HYPER, 'h', window_LeftHalfSnap},
    {HYPER, 'j', window_FullScreen},
    {HYPER, 'k', window_MoveTo_Next_Screen},
    {HYPER, 'l', window_RightHalfSnap},

    ----------------------------
    -- Vertical Monitor Grid Controls
    ----------------------------
    {MEH, '1', vertMonitorGrid_TopAndMid},
    {MEH, '2', vertMonitorGrid_Bottom},
    {MEH, '3', vertMonitorGrid_Middle},
    {MEH, '4', vertMonitorGrid_Top},

    ----------------------------
    -- Zoom Controls
    ----------------------------
    {MEH, '8', zoom_FocusWindow},
    {MEH, '9', zoom_ToggleAudioMute},
    {MEH, '0', zoom_ToggleVideoMute},
    {MEH, 'y', zoom_LeaveMeeting},
    {MEH, 'u', zoom_OpenChat},
    {MEH, 'i', zoom_ShowShareControls},

    ----------------------------
    -- Miscellaneous Controls
    ----------------------------
    {HYPER, 'y', misc_emojiAsciiArt},
}

customBindHotkeys(allHotkeys)
