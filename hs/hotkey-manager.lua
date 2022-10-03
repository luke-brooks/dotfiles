local function customBindHotkeys(hotKeyTable)
    printTable(hotKeyTable)
    for index, mapping in pairs(hotKeyTable) do
        -- print('examining ' .. index .. ' and ' .. tableToString(mapping))
        hs.hotkey.bind(mapping[1], mapping[2], mapping[3])
    end
end

allHotkeys = {
    ----------------------------
    -- System Controls
    ----------------------------
    {HYPER, 'space', system_ReloadHsConfig},
    {MEH, '6', system_LockScreen},

    ----------------------------
    -- Temporary App Hotkey
    ----------------------------
    {HYPER, '6', tempApp_SetKeyBinding},
    {HYPER, tempKey, temp_AppFocus},

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
