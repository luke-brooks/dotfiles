

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