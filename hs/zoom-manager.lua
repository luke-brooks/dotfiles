----------------------------
-- Zoom.spoon Config
----------------------------
-- commenting out spoon pkg load for source load
-- hs.loadSpoon('Zoom')
-- loading straight from Zoom.spoon local source for dev purposes
local zoom = dofile('/Users/LukeBrooks/code/learning-repos/Zoom.spoon/init.lua')

-- zoom:debug()
zoom:setStatusCallback(updatedZoomStatus)
zoom:start()

----------------------------
-- Zoom Controls
----------------------------
function zoom_FocusWindow()
    -- hs.printf('zoom focus priority window')
    local zoomWindow = zoom:focus()
    centerMouseCursor(zoomWindow:screen(), zoomWindow)
end
function zoom_ToggleAudioMute()
    -- this now has a real hotkey: cmd + shift + a
    --  but this spoon allows easily changing mute/unmute without having the window focused
    -- hs.printf('zoom toggle audio mute')
    zoom.audio:toggleMute()
end
function zoom_ToggleVideoMute()
    -- this now has a real hotkey: cmd + shift + v
    --  but this spoon allows easily changing mute/unmute without having the window focused
    -- hs.printf('zoom toggle video mute')
    zoom.video:toggleMute()
end
function zoom_LeaveMeeting()
    -- hs.printf('zoom leave meeting')
    zoom:leaveMeeting()
end

----------------------------
-- Unused
----------------------------
-- function zoom_OpenChat()
--     -- hs.printf('zoom open chat window')
--     zoom.chat:open()
-- end
-- function zoom_ShowShareControls()
--     -- hs.printf('zoom show share controls')
--     zoom.share:showControls()
-- end

----------------------------
-- Construction Zone
----------------------------
-- updatedZoomStatus = function(currentState, audio, video)
--     hs.printf('Zoom App Status is now: %s', currentState)
--     hs.printf('Zoom Audio is: %s', audio)
--     hs.printf('Zoom Video is: %s', video)

--     if (audio == 'muted') then
--         hs.notify.new({
--             title = 'Zoom Audio',
--             informativeText = 'You are now muted'
--         }):send()
--     elseif (audio == 'unmuted') then
--         hs.notify.new({
--             title = 'Zoom Audio',
--             informativeText = 'People can hear you!'
--         }):send()
--     else
--         hs.notify.new({
--             title = 'Zoom Audio',
--             informativeText = 'Zoom has turned off your audio'
--         }):send()
--     end
-- end
