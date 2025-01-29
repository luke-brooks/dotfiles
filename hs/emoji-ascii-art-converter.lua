-- code moved to: https://github.com/luke-brooks/EmojiAsciiArt.spoon

----------------------------
-- EmojiAsciiArt.spoon Config
----------------------------
-- commenting out spoon pkg load for source load
local emojiAsciiArt = hs.loadSpoon('EmojiAsciiArt')
-- loading straight from Zoom.spoon local source for dev purposes
-- local emojiAsciiArt = dofile('/Users/LukeBrooks/code/learning-repos/EmojiAsciiArt.spoon/init.lua')

emojiAsciiArt:debug()

function misc_emojiAsciiArt()
    hs.printf("spooned! getting dat emoji art bby")
    emojiAsciiArt:convertToAsciiArt()
end
