
----------------------------
-- System Controls
----------------------------
hs.hotkey.bind(HYPER, 'space', system_ReloadHsConfig)
hs.hotkey.bind(MEH, '6', system_LockScreen)


----------------------------
-- Temporary App Hotkey
----------------------------
hs.hotkey.bind(HYPER, '6', tempApp_SetKeyBinding)
hs.hotkey.bind(HYPER, tempKey, temp_AppFocus)


----------------------------
-- Window Controls
----------------------------

-- Left Hand 
hs.hotkey.bind(HYPER, 'home', window_FullScreen)
hs.hotkey.bind(HYPER, 'up', window_MoveTo_Previous_Screen)
hs.hotkey.bind(HYPER, 'down', window_MoveTo_Next_Screen)

-- Right Hand
hs.hotkey.bind(HYPER, 'h', window_LeftHalfSnap)
hs.hotkey.bind(HYPER, 'j', window_FullScreen)
hs.hotkey.bind(HYPER, 'k', window_MoveTo_Next_Screen)
hs.hotkey.bind(HYPER, 'l', window_RightHalfSnap)


----------------------------
-- Vertical Monitor Grid Controls
----------------------------
hs.hotkey.bind(MEH, '1', vertMonitorGrid_TopAndMid)
hs.hotkey.bind(MEH, '2', vertMonitorGrid_Bottom)
hs.hotkey.bind(MEH, '3', vertMonitorGrid_Middle)
hs.hotkey.bind(MEH, '4', vertMonitorGrid_Top)


----------------------------
-- Zoom Controls
----------------------------
hs.hotkey.bind(MEH, '8', zoom_FocusWindow)
hs.hotkey.bind(MEH, '9', zoom_ToggleAudioMute)
hs.hotkey.bind(MEH, '0', zoom_ToggleVideoMute)
hs.hotkey.bind(MEH, 'y', zoom_LeaveMeeting)
hs.hotkey.bind(MEH, 'u', zoom_OpenChat)
hs.hotkey.bind(MEH, 'i', zoom_ShowShareControls)


----------------------------
-- Miscellaneous Controls
----------------------------
hs.hotkey.bind(HYPER, 'y', misc_emojiAsciiArt)