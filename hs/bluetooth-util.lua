-- require 'string'

-- function checkBluetoothResult(rc, stdout, stderr)
--     if rc ~= 0 then
--         print(string.format('Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s', rc, stderr, stdout))
--     end
-- end

-- function runBlueUtil(commands)
-- -- print('Setting bluetooth to ')
--     local t = hs.task.new('/usr/local/bin/blueutil', checkBluetoothResult, commands)
--     t:start()
-- end

-- -- this is currently the only useful function lol
-- function bluetooth(power)
--     print('Setting bluetooth to ' .. power)
--     local t = hs.task.new('/usr/local/bin/blueutil', checkBluetoothResult, {'--power', power})
--     t:start()
-- end

-- bt_connect = '--connect'
-- bt_disconnect = '--disconnect'

-- runBlueUtil({bt_disconnect, sen_headphones_mac})


-- hs.task.new('bin/bash', nil, {'printer_ip', })