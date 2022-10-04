
local customMenu = createIcon(customMenu, MY_HS_ICON, 'beep boop')

-- this cannot be local so other scripts can redraw the menu to show checkmarks
function ReloadCustomMenu ()
    local custMenuLayout = {
        {
            title = 'Ethernet',
            checked = IS_ETHERNET_CONNECTED,
            fn = function()
                if (IS_ETHERNET_CONNECTED) then
                    hs.notify.new({title='Ethernet IP', informativeText=ETHERNET_IP}):send() 
                    hs.pasteboard.setContents(ETHERNET_IP)
                end
            end
        },
        {
            title = 'Temp Key Binding',
            checked = TEMP_APP_HOTKEY_BINDING ~= nil,
            fn = function()
                if (TEMP_APP_HOTKEY_BINDING ~= nil) then
                    local msg = 'Temp binding is set to: ' .. TEMP_APP_HOTKEY_BINDING:name() .. ' on HYPER + f'
                    hs.notify.new({title='Temp Key Binding', informativeText=msg}):send()
                else
                    hs.notify.new({title='Temp Key Binding', informativeText='No App set to temp binding.'}):send()
                end
            end
        },
        {
            title = "-" -- separator
        },
        {
            title = 'Vertical Setup',
            fn = function() 
                configVerticalMonitor(VERTICAL_MONITOR_DETAILS[1])
            end
        },
        {
            title = "-" -- separator
        },
        {
            title = 'Configure Monitors',
            fn = function() 
                determineMonitorConnection()
            end
        },
        {
            title = 'Swap Monitors',
            fn = function() 
                swapMonitorIds()
            end
        },
        {
            title = 'Reverse Screen Order',
            checked = SHARED_SCREEN_REVEARSE,
            fn = function() 
                reverseScreenOrder()
            end
        },
        {
          title = "-" -- separator
        },
        {
            title = 'Reload Config',
            fn = function() 
                hs.reload()
            end
        }
    }
    customMenu:setMenu(custMenuLayout)   
end

ReloadCustomMenu()