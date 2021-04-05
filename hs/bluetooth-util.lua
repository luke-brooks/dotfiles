require 'string'

function checkBluetoothResult(rc, stdout, stderr)
    if rc ~= 0 then
        print(string.format('Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s', rc, stderr, stdout))
    end
end

function runBlueUtil(commands)
-- print('Setting bluetooth to ')
    local t = hs.task.new('/usr/local/bin/blueutil', checkBluetoothResult, commands)
    t:start()
end

-- this is currently the only useful function lol
function bluetooth(power)
    print('Setting bluetooth to ' .. power)
    local t = hs.task.new('/usr/local/bin/blueutil', checkBluetoothResult, {'--power', power})
    t:start()
end

sen_headphones_mac = '00-16-94-3a-85-49'
logi_mx_mouse_mac = 'c2-75-c5-6b-a6-cd'

bt_connect = '--connect'
bt_disconnect = '--disconnect'

-- runBlueUtil({bt_disconnect, sen_headphones_mac})


-- hs.task.new('bin/bash', nil, {'printer_ip', })