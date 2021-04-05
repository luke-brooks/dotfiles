

-- hs.loadSpoon('Zoom')
local zoom = dofile('/Users/LukeBrooks/code/learning-repos/Zoom.spoon/init.lua')

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

zoom:setStatusCallback(updatedZoomStatus)
zoom:start()

hs.hotkey.bind(MEH, '8', function()
    hs.printf('zoom focus priority window')
    zoom:focus()
end)
hs.hotkey.bind(MEH, '9', function()
    hs.printf('zoom toggle audio mute')
    zoom.audio:toggleMute()
end)
hs.hotkey.bind(MEH, '0', function()
    hs.printf('zoom toggle video mute')
    zoom.video:toggleMute()
end)
hs.hotkey.bind(MEH, 'y', function()
    hs.printf('zoom leave meeting')
    zoom:leaveMeeting()
end)
hs.hotkey.bind(MEH, 'u', function()
    hs.printf('zoom open chat window')
    zoom.chat:open()
end)
hs.hotkey.bind(MEH, 'i', function()
    hs.printf('zoom show share controls')
    zoom.share:showControls()
end)
