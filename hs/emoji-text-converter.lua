local asciiMap = {}

local function buildAsciiMap()
    asciiMap["a"] = {"0000", "1111", "1001", "1111", "1001", "1001", "0000"}
    asciiMap["b"] = {"0000", "1111", "1001", "1110", "1001", "1111", "0000"}
    asciiMap["c"] = {"0000", "0111", "1000", "1000", "1000", "0111", "0000"}
    asciiMap["d"] = {"0000", "1110", "1001", "1001", "1001", "1110", "0000"}
    asciiMap["e"] = {"0000", "1111", "1000", "1110", "1000", "1111", "0000"}
    asciiMap["f"] = {"0000", "1111", "1000", "1110", "1000", "1000", "0000"}
    asciiMap["g"] = {"0000", "1111", "1000", "1011", "1001", "1111", "0000"}
    asciiMap["h"] = {"0000", "1001", "1001", "1111", "1001", "1001", "0000"}
    asciiMap["i"] = {"000", "111", "010", "010", "010", "111", "000"}
    asciiMap["j"] = {"0000", "0111", "0010", "0010", "1010", "0110", "0000"}
    asciiMap["k"] = {"0000", "1001", "1010", "1100", "1010", "1001", "0000"}
    asciiMap["l"] = {"000", "100", "100", "100", "100", "111", "000"}
    asciiMap["m"] = {"00000", "10001", "11011", "10101", "10001", "10001", "00000"}
    asciiMap["n"] = {"00000", "10001", "11001", "10101", "10011", "10001", "00000"}
    asciiMap["o"] = {"0000", "0110", "1001", "1001", "1001", "0110", "0000"}
    asciiMap["p"] = {"0000", "1110", "1001", "1110", "1000", "1000", "0000"}
    asciiMap["q"] = {"00000", "01100", "10010", "10010", "10010", "01111", "00000"}
    asciiMap["r"] = {"0000", "1110", "1001", "1110", "1010", "1001", "0000"}
    asciiMap["s"] = {"0000", "0111", "1000", "0110", "0001", "1110", "0000"}
    asciiMap["t"] = {"00000", "11111", "00100", "00100", "00100", "00100", "00000"}
    asciiMap["u"] = {"00000", "10001", "10001", "10001", "10001", "01110", "00000"}
    asciiMap["v"] = {"00000", "10001", "10001", "10001", "01010", "00100", "00000"}
    asciiMap["w"] = {"0000000", "1000001", "1000001", "1001001", "1010101", "0100010", "0000000"}
    asciiMap["x"] = {"00000", "10001", "01010", "00100", "01010", "10001", "00000"}
    asciiMap["y"] = {"00000", "10001", "01010", "00100", "00100", "00100", "00000"}
    asciiMap["z"] = {"00000", "11111", "00010", "00100", "01000", "11111", "00000"}
    asciiMap[" "] = {"0", "0", "0", "0", "0", "0", "0"}
end

buildAsciiMap()

local function buildStringFrom(text)
    local result = ''
    if (not text) then
        return result
    end
    local spacedText = ' '
    for i = 1, #text do
        local letter = text:sub(i, i)
        spacedText = spacedText .. letter .. ' '
    end
    for letterLayer = 1, 7 do -- each character has 7 layers of ascii
        for letterOrdinal = 1, #spacedText do -- letter's location in the "spacedText" string
            local letter = spacedText:sub(letterOrdinal, letterOrdinal) -- pick letter from string using its ordinal
            if letter == nil or letter == '' then
                letter = ' ' -- converts empty strings to usable asciiMap identifier
            end
            result = result .. asciiMap[letter][letterLayer]
        end
        result = result .. '\n'
    end
    return result
end

local function convertToEmoji(str, light, dark)
    local result = buildStringFrom(str:lower()):gsub(0, light):gsub(1, dark)
    return result
end

function misc_emojiAsciiArt()
    local emojiPayload = hs.pasteboard.getContents()
    sleep(.3) -- brief pause to allow unpress of trigger key
    hs.notify.new({title='Emoji ASCII Art', informativeText=test}):send()
    local split = splitStringToTable(emojiPayload)

    local slackText = convertToEmoji(split[1], split[2], split[3])
    hs.pasteboard.setContents(slackText)
    hs.osascript.applescript(force_paste_script)
end


