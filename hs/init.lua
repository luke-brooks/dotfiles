
local function customRequire(scriptName)
    dofile('/Users/LukeBrooks/code/learning-repos/dotfiles/hs/' .. scriptName .. '.lua')
end

-- notify config load
hs.notify.new({
    title = 'Hammerspoon',
    informativeText = 'Loading Config Breh'
}):send()

-- import utils & config scripts
customRequire('utils')
customRequire('config')
customRequire('icons')
-- import manager scripts
customRequire('zoom-manager')
customRequire('app-manager')
customRequire('monitor-manager')
customRequire('window-manager')
-- import watcher scripts
customRequire('audio-watcher')
customRequire('battery-watcher')
customRequire('network-watcher')
customRequire('custom-menu')
customRequire('osa-script-manager')
customRequire('rails-console-clipper')
customRequire('emoji-ascii-art-converter')
customRequire('hotkey-manager')


-- not really using the bt stuff right now
-- customRequire('bluetooth-util')
-- customRequire('caffeinate-watcher')

----------------------------
-- TODO
----------------------------

-- Multi-payload clipboard for easily pasting several different snippets without having to re-copy anything

-- toggle spotify play/pause when leaving/entering a zoom meeting
-- find a more reliable way to identify monitors
--   the IDs frequently get switched for some reason

-- sense when i have been connected to prod vpn for more than hour

----------------------------
-- Useful Links
----------------------------

-- my first setup guide <3
-- https://blog.craftlab.hu/how-to-become-a-modern-magician-productivity-tips-for-devs-on-macos-7a886c43d870

-- professional dev's hs scripts
-- https://github.com/anishathalye/dotfiles-local/tree/mac/hammerspoon

-- create custom app from chrome site
-- https://apple.stackexchange.com/a/363381/379371

-- window management guide
-- https://medium.com/@jhkuperus/window-management-with-hammerspoon-personal-productivity-c77adc436888

-- ascii icon drawing guide
-- http://cocoamine.net/blog/2015/03/20/replacing-photoshop-with-nsstring/


----------------------------
-- SETUP INFO
----------------------------

-- Accessibility needs enabled for Hammerspoon.app
-- Notification Settings needs to have Hammerspoon.app "allow" desktop notifications, otherwise hs.notify.send will not work