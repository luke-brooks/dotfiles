
local headsetIcon = nil

local function updateInputSettings (usingHeadset)
    local builtIn = hs.audiodevice.findInputByUID(LAPTOP_MIC)
    local headsetInput = hs.audiodevice.findInputByUID(SENN_MIC)

    if usingHeadset then
        builtIn:setDefaultInputDevice()
        builtIn:setInputVolume(50)
        headsetInput:setInputMuted(true)
        headsetInput:setInputVolume(0)
    else
        builtIn:setDefaultInputDevice()
        builtIn:setInputMuted(false)
        builtIn:setInputVolume(50)
        if (hs.spotify.isRunning() == true) then hs.spotify.pause() end
    end
end

local function senseHeadset ()
    local result = ''
    local headset = hs.audiodevice.findOutputByUID(SENN_HEADPHONES)
    if (headset ~= nil) then
        result = headset:name()
        headsetIcon = createIcon(headsetIcon, HEADPHONES_ICON, 'hellz yeah bruh')
    else
        headsetIcon = removeIcon(headsetIcon)
        result = 'Disconnected'
    end
    updateInputSettings(headset)
    return result
end

senseHeadset()

local watchFor = 'dev#'
hs.audiodevice.watcher.setCallback(function (watchFor)
    local msg = senseHeadset()
    -- hs.notify.new({title='AudioChange', informativeText=msg}):send()
end)

hs.audiodevice.watcher.start()