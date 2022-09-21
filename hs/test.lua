

hs.hotkey.bind({ 'alt', 'ctrl', 'shift' }, 'h', function()
    hs.printf('testing worked!')
    -- spoon.Zoom:focus()
end)
--         hs.notify.new({
--             title = 'Zoom Audio',
--             informativeText = 'Zoom has turned off your audio'
--         }):send()

m = hs.screen.find('(2)')
vm = hs.screen.find('(1)')

printTable(vm:currentMode())
vm:rotate()

hs.grid.setGrid('1x4', vm)

hs.grid.getGrid(vm)

verticalMonitorTopAndMid = hs.geometry.rect(0.0,0.0,1,3.0)

hs.grid.set(stockApp:mainWindow(), verticalMonitorTopAndMid, vm)


stockApp = hs.application.find('Stonks')

appInstance = hs.application.find('Code')

shot = hs.application.open('Notes')



-- rails console example payload
-- irb(main):093:2>   end
-- irb(main):094:1>
-- irb(main):095:1>   def remove_webhook(webhook_id:)
-- irb(main):096:2>     edi_api_client.webhooks.delete(webhook_id: webhook_id)
-- irb(main):097:2>   end
-- => :edi_api_client

str = "irb(main):109:1>   end"

myPattern = "irb%(%a*%):%d*:%d*>"
result, count = string.gsub(str, myPattern, "")

result = string.match(str, irbLineMatch)


str = "irb(main):109:1> end"
irbLineFind = "irb%(%a*%):%d*:%d*> "
first, last = string.find(str, irbLineFind)

-- test = 

first, last = string.gmatch(str, irbLineMatch)

first= string.gsub(str, irbLineMatch, "")
