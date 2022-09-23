----------------------------
-- Network Watcher Setup
----------------------------
ETHERNET_IP = nil
IS_ETHERNET_CONNECTED = false
local ethernetKey = 'State:/Network/Interface/en9/IPv4'
local ethernetIcon = nil

local netConfig = hs.network.configuration.open()
netConfig:monitorKeys({ethernetKey}, true)

local function senseEthernet()
    sleep(2) -- pause script to ensure ip has time to get assigned
    -- the # operator gets the length of a table/list, this helps us pull the last entry
    ETHERNET_IP = hs.network.addresses(ETHERNET_INTERFACE)[#hs.network.addresses(ETHERNET_INTERFACE)]
    if (ETHERNET_IP ~= nil) then
        hs.notify.new({
            title = 'Ethernet',
            informativeText = ETHERNET_IP
        }):send()
        IS_ETHERNET_CONNECTED = true
        ethernetIcon = createIcon(ethernetIcon, ETHERNET_ICON, 'supah fast interwebs')
    else
        hs.notify.new({
            title = 'Ethernet',
            informativeText = 'Disconnected'
        }):send()
        IS_ETHERNET_CONNECTED = false
        ethernetIcon = removeIcon(ethernetIcon)
    end
end

----------------------------
-- Script Load Executions
----------------------------
senseEthernet()

netConfig:setCallback(function(storeObject, changedKeys)
    senseEthernet()
    ReloadCustomMenu()
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
