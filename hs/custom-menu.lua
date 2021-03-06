
customMenu = createIcon(customMenu, MY_HS_ICON, 'beep boop')

-- this cannot be local so other scripts can redraw the menu to show checkmarks
function reloadMenu ()
    custMenuLayout = {
        {
            title = 'Ethernet',
            checked = ethernetConnected,
            fn = function()
                if (ethernetConnected) then
                    hs.notify.new({title='Ethernet IP', informativeText=ethernetIp}):send() 
                    hs.pasteboard.setContents(ethernetIp)
                end
            end
        },
        -- {
        --     title = 'Temp Key Binding',
        --     checked = tempBinding ~= nil,
        --     fn = function()
        --         if (tempBinding ~= nil) then
        --             local msg = 'Temp binding is set to: ' .. tempBinding:name() .. ' on HYPER + ' .. tempKey
        --             hs.notify.new({title='Temp Key Binding', informativeText=msg}):send()
        --         else
        --             hs.notify.new({title='Temp Key Binding', informativeText='No App set to temp binding.'}):send()
        --         end
        --     end
        -- },
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
            checked = screenReverse,
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

reloadMenu()