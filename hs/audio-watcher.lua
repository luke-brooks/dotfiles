----------------------------
-- Audio Watcher Setup
----------------------------
local headsetIcon = nil
local watchFor = 'dev#' -- event name used to identify audio device changes

----------------------------
-- Local Functions
----------------------------
local function updateInputSettings(headsetName)
    local builtIn = hs.audiodevice.findInputByUID(LAPTOP_MIC)
    -- local senn_headsetInput = hs.audiodevice.findInputByUID(SENN_MIC)
    local logi_headsetInput = hs.audiodevice.findInputByUID(LOGI_HEADSET_INPUT)

    if (headsetName == 'senn') then
        builtIn:setDefaultInputDevice()
        builtIn:setInputVolume(50)
        -- senn_headsetInput:setInputMuted(true)
        -- senn_headsetInput:setInputVolume(0)
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

    -- local senn_headset = hs.audiodevice.findOutputByUID(SENN_HEADPHONES_UID) -- the mac address sometimes is capitalized & sometimes not...
    local senn_headset = hs.audiodevice.findOutputByName(SENN_HEADPHONES_NAME)
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

----------------------------
-- Script Load Executions
----------------------------
senseHeadset()

-- there is only one audio device watcher instance, you cannot create multiple
hs.audiodevice.watcher.setCallback(function(watchFor)
    local msg = senseHeadset()
    -- hs.notify.new({
    --     title = 'AudioChange',
    --     informativeText = msg
    -- }):send()
end)

hs.audiodevice.watcher.start()
