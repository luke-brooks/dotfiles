local ethernetKey = 'State:/Network/Interface/en9/IPv4'

ethernetIp = nil
ethernetIcon = nil
ethernetConnected = false

netConfig = hs.network.configuration.open()
netConfig:monitorKeys({ethernetKey}, true)

local function senseEthernet ()
    sleep(2) -- pause script to ensure ip has time to get assigned
    -- the # operator gets the length of a table/list, this helps us pull the last entry
    ethernetIp = hs.network.addresses(ETHERNET_INTERFACE)[#hs.network.addresses(ETHERNET_INTERFACE)]
    if (ethernetIp ~= nil) then
        hs.notify.new({title='Ethernet', informativeText=ethernetIp}):send()
        ethernetConnected = true
        ethernetIcon = createIcon(ethernetIcon, ETHERNET_ICON, 'supah fast interwebs')
    else
        hs.notify.new({title='Ethernet', informativeText='Disconnected'}):send()
        ethernetConnected = false
        ethernetIcon = removeIcon(ethernetIcon)
    end
end

senseEthernet()

netConfig:setCallback(function (storeObject, changedKeys)
    senseEthernet()
    reloadMenu()
end)

netConfig:start()

----------------------------
-- deprecated
----------------------------
-- reason: i will not be using the corporate vpn frequently in the future

-- custom network service names
-- CORPORATE_VPN_NAME = '2B77D4DF-D1A3-407A-8E89-335154A790B1'

-- local corporateVpnKey = NETWORK_SERVICE .. CORPORATE_VPN_NAME .. VPN_PROTOCOL

-- corporateVpnIp = nil
-- corporateVpnConnected = false

-- local function senseCorporateVpn ()
--     corporateVpnIp = hs.network.addresses(PPP_INTERFACE)[1]
--     if (corporateVpnIp ~= nil and not corporateVpnConnected) then
--         corporateVpnConnected = true
--         hs.notify.new({title='Corporate VPN', informativeText=corporateVpnIp}):send()
--     elseif (corporateVpnIp == nil) then
--         corporateVpnConnected = false
--         hs.notify.new({title='Corporate VPN', informativeText='Disconnected'}):send()
--     end
-- end