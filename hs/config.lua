-- modifier definitions
HYPER = { 'cmd', 'alt', 'ctrl', 'shift' }
MEH = { 'alt', 'ctrl', 'shift' }

-- standard network names
NETWORK_SERVICE = 'State:/Network/Service/'
VPN_PROTOCOL = '/PPP'
PPP_INTERFACE = 'ppp0'
ETHERNET_INTERFACE = 'en9'

-- personal device mac addresses
SEN_HEADPHONES_MAC = '00-16-94-3a-85-49'
LOGI_MC_MOUSE_MAC = 'c2-75-c5-6b-a6-cd'

-- audio device uids
LAPTOP_MIC = 'BuiltInMicrophoneDevice'
WIRELESS_MIC = 'AppleUSBAudioEngine:Antlion Audio:Antlion Wireless Microphone:14123220:1'
SENN_MIC = SEN_HEADPHONES_MAC .. ':input'
SENN_HEADPHONES_UID = SEN_HEADPHONES_MAC .. ':output'
SENN_HEADPHONES_NAME = 'HD 4.50BTNC'
LOGI_HEADSET_OUTPUT = 'AppleUSBAudioEngine:Logitech:Logitech Wireless Headset:C0288D589BCC:2'
LOGI_HEADSET_INPUT = 'AppleUSBAudioEngine:Logitech:Logitech Wireless Headset:C0288D589BCC:1'

-- monitor details tables
-- these details can be found via:
--     s = hs.screen.find("PHL")
--     s:currentMode()
-- table format: id, rotation angle, width, height, resolution mode, frequency, depth
BUILT_IN_ONLY = {69734662, 0, 1792, 1120, 2, 59.0, 4.0}
BUILT_IN_DETAILS = {69734662, 0, 1152, 720, 2, 59.0, 4.0}
STANDARD_MONITOR_DETAILS = {'(1)', 0, 2560, 1440, 2, 24.0, 4.0}
VERTICAL_MONITOR_DETAILS = {'(2)', 270, 1440, 2560, 2, 24.0, 4.0}
CURVED_MONITOR_DETAILS = {'PHL', 0, 2560, 1080, 1, 60.0, 8.0}

-- app variables
LOFI_HIPHOP_YOUTUBE_URL = 'https://www.youtube.com/watch?v=jfKfPfyJRdk'