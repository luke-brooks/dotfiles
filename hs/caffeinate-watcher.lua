
-- function f(event)
--     if event == hs.caffeinate.watcher.systemWillSleep then
--         -- kill window swap here
--         bluetooth('off')
--     -- if event == hs.caffeinate.watcher.screensDidLock then
--     --     bluetooth('off')
--     elseif event == hs.caffeinate.watcher.screensDidWake then
--         bluetooth('on')
--     elseif event == hs.caffeinate.watcher.screensDidUnlock then 
--         -- runBlueUtil({bt_connect, sen_headphones_mac})
--         -- runBlueUtil({bt_connect, logi_mx_mouse_mac})
--         -- print('screens unlocked ')
--         -- bluetooth('on')
--         -- reloadMenu()
--     end
-- end


-- watcher = hs.caffeinate.watcher.new(f)
-- watcher:start()