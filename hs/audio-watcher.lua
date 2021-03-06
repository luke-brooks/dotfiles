local headsetIcon = nil

local function updateInputSettings(headsetName)
    local builtIn = hs.audiodevice.findInputByUID(LAPTOP_MIC)
    local senn_headsetInput = hs.audiodevice.findInputByUID(SENN_MIC)
    local logi_headsetInput = hs.audiodevice.findInputByUID(LOGI_HEADSET_INPUT)

    if (headsetName == 'senn') then
        builtIn:setDefaultInputDevice()
        builtIn:setInputVolume(50)
        senn_headsetInput:setInputMuted(true)
        senn_headsetInput:setInputVolume(0)
    elseif (headsetName == 'logi') then
        builtIn:setInputMuted(true)
        builtIn:setInputVolume(50)
        logi_headsetInput:setDefaultInputDevice()
        logi_headsetInput:setInputMuted(false)
        logi_headsetInput:setInputVolume(100)
    else
        builtIn:setDefaultInputDevice()
        builtIn:setInputMuted(false)
        builtIn:setInputVolume(50)
        if (hs.spotify.isRunning() == true) then
            hs.spotify.pause()
        end
    end
end

local function senseHeadset()
    local result = ''
    local headset = ''

    local senn_headset = hs.audiodevice.findOutputByUID(SENN_HEADPHONES)
    local logi_headset = hs.audiodevice.findOutputByUID(LOGI_HEADSET_OUTPUT)

    if (senn_headset ~= nil) then
        result = senn_headset:name()
        headsetIcon = createIcon(headsetIcon, HEADPHONES_ICON, 'hellz yeah bruh')
        headset = 'senn'
    elseif (logi_headset ~= nil) then
        result = logi_headset:name()
        headsetIcon = createIcon(headsetIcon, HEADPHONES_ICON, 'hellz yeah bruh')
        headset = 'logi'
    else
        headsetIcon = removeIcon(headsetIcon)
        result = 'Disconnected'
    end
    updateInputSettings(headset)
    return result
end

senseHeadset()

local watchFor = 'dev#'
hs.audiodevice.watcher.setCallback(function(watchFor)
    local msg = senseHeadset()
    -- hs.notify.new({
    --     title = 'AudioChange',
    --     informativeText = msg
    -- }):send()
end)

hs.audiodevice.watcher.start()
