----------------------------
-- Emoji ASCII Art Converter Setup
----------------------------
local asciiMap = {}

-- supported alpha characters
asciiMap['a'] = {'0000', '1111', '1001', '1111', '1001', '1001', '0000'}
asciiMap['b'] = {'0000', '1111', '1001', '1110', '1001', '1111', '0000'}
asciiMap['c'] = {'0000', '0111', '1000', '1000', '1000', '0111', '0000'}
asciiMap['d'] = {'0000', '1110', '1001', '1001', '1001', '1110', '0000'}
asciiMap['e'] = {'0000', '1111', '1000', '1110', '1000', '1111', '0000'}
asciiMap['f'] = {'0000', '1111', '1000', '1110', '1000', '1000', '0000'}
asciiMap['g'] = {'0000', '1111', '1000', '1011', '1001', '1111', '0000'}
asciiMap['h'] = {'0000', '1001', '1001', '1111', '1001', '1001', '0000'}
asciiMap['i'] = {'000', '111', '010', '010', '010', '111', '000'}
asciiMap['j'] = {'0000', '0111', '0010', '0010', '1010', '0110', '0000'}
asciiMap['k'] = {'0000', '1001', '1010', '1100', '1010', '1001', '0000'}
asciiMap['l'] = {'000', '100', '100', '100', '100', '111', '000'}
asciiMap['m'] = {'00000', '10001', '11011', '10101', '10001', '10001', '00000'}
asciiMap['n'] = {'00000', '10001', '11001', '10101', '10011', '10001', '00000'}
asciiMap['o'] = {'0000', '0110', '1001', '1001', '1001', '0110', '0000'}
asciiMap['p'] = {'0000', '1110', '1001', '1110', '1000', '1000', '0000'}
asciiMap['q'] = {'00000', '01100', '10010', '10010', '10010', '01111', '00000'}
asciiMap['r'] = {'0000', '1110', '1001', '1110', '1010', '1001', '0000'}
asciiMap['s'] = {'0000', '0111', '1000', '0110', '0001', '1110', '0000'}
asciiMap['t'] = {'00000', '11111', '00100', '00100', '00100', '00100', '00000'}
asciiMap['u'] = {'00000', '10001', '10001', '10001', '10001', '01110', '00000'}
asciiMap['v'] = {'00000', '10001', '10001', '10001', '01010', '00100', '00000'}
asciiMap['w'] = {'0000000', '1000001', '1000001', '1001001', '1010101', '0100010', '0000000'}
asciiMap['x'] = {'00000', '10001', '01010', '00100', '01010', '10001', '00000'}
asciiMap['y'] = {'00000', '10001', '01010', '00100', '00100', '00100', '00000'}
asciiMap['z'] = {'00000', '11111', '00010', '00100', '01000', '11111', '00000'}

-- supported number characters
asciiMap['0'] = {'0000', '0110', '1001', '1001', '1001', '0110', '0000'} -- equivalent to 'O'
asciiMap['1'] = {'000', '010', '110', '010', '010', '111', '000'}
asciiMap['2'] = {'0000', '0110', '1001', '0010', '0100', '1111', '0000'}
asciiMap['3'] = {'000', '110', '001', '010', '001', '110', '000'}
asciiMap['4'] = {'0000', '1010', '1010', '1111', '0010', '0010', '0000'}
asciiMap['5'] = {'000', '111', '100', '111', '001', '111', '000'}
asciiMap['6'] = {'000', '111', '100', '111', '101', '111', '000'}
asciiMap['7'] = {'000', '111', '001', '001', '001', '001', '000'}
asciiMap['8'] = {'0000', '0110', '1001', '0110', '1001', '0110', '0000'}
asciiMap['9'] = {'000', '111', '101', '111', '001', '001', '000'}

-- other supported characters 
asciiMap[' '] = {'0', '0', '0', '0', '0', '0', '0'}
asciiMap['.'] = {'0', '0', '0', '0', '0', '1', '0'}
asciiMap['!'] = {'0', '1', '1', '1', '0', '1', '0'}
-- asciiMap[':'] = {'00', '11', '011', '00', '11', '11', '00'} -- nope
asciiMap["'"] = {'0', '1', '1', '0', '0', '0', '0'}
asciiMap['"'] = {'000', '101', '101', '000', '000', '000', '000'}
asciiMap['('] = {'00', '01', '10', '10', '10', '01', '00'}
asciiMap[')'] = {'00', '10', '01', '01', '01', '10', '00'}
asciiMap['-'] = {'000', '000', '000', '111', '000', '000', '000'}
asciiMap['+'] = {'000', '000', '010', '111', '010', '000', '000'}

----------------------------
-- Local Functions
----------------------------
local function buildAsciiFromText(text)
    local result = ''
    if (not text) then
        return result
    end
    local spacedText = ' '
    for i = 1, #text do
        local character = text:sub(i, i)
        spacedText = spacedText .. character .. ' '
    end
    for characterLayer = 1, 7 do -- each character has 7 layers of ascii
        for characterOrdinal = 1, #spacedText do -- character's location in the 'spacedText' string
            local character = spacedText:sub(characterOrdinal, characterOrdinal) -- pick character from string using its ordinal
            if character == nil or character == '' then
                character = ' ' -- converts empty strings to usable asciiMap identifier
            end
            result = result .. asciiMap[character][characterLayer]
        end
        result = result .. '\n'
    end
    return result
end

local function convertToEmojiArt(str, textFill, backgroundFill)
    local result = buildAsciiFromText(str:lower()):gsub(1, textFill):gsub(0, backgroundFill)
    return result
end

----------------------------
-- Shared Functions
----------------------------
function misc_emojiAsciiArt()
    sleep(.05) -- brief pause to allow unpress of trigger key

    hs.eventtap.keyStroke({'cmd'}, 'a') -- simulate 'select all' shortcut
    hs.eventtap.keyStroke({'cmd'}, 'c') -- simulate 'copy' shortcut

    local emojiPayload = hs.pasteboard.getContents()

    -- payload will be in the form:
    -- 'message :text_fill_emoji: :bg_fill_emoji:'
    -- need to add string format validation

    hs.notify.new({
        title = 'Emoji ASCII Art',
        informativeText = emojiPayload
    }):send()

    local split = splitStringToTable(emojiPayload) -- this currently doesnt allow spaces in the display text
    local slackText = convertToEmojiArt(split[1], split[2], split[3])

    hs.pasteboard.setContents(slackText) -- set art payload for delivery
    hs.eventtap.keyStroke({'cmd'}, 'v') -- simulate 'paste' shortcut
    hs.pasteboard.setContents(emojiPayload) -- reset pasteboard contents to original input
end
