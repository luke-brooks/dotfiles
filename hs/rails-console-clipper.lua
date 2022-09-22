local irbLinePattern = "irb%(%a*%):%d*:%d*[>*]"
local skipPayloadEdit = false;

local function handlePaste(payload)
    -- print('new paste payload ' .. payload)
    if (not skipPayloadEdit) then
        local lines = {}
        local firstLine = true
        for str in payload:gmatch("[^\r\n]+") do
            local result, count = string.gsub(str, irbLinePattern, "")
            if (count > 0) then
                if (result:len() > 0) then result = result:sub(2) end -- remove first space if not blank line
                -- print('saving ruby snippet ' .. result)
                table.insert(lines, result)
            elseif (not firstLine) then
                -- print('saving comment ' .. '# ' .. str)
                table.insert(lines, '# ' .. str)
            end

            -- print('lines table length' .. tableLength(lines))
            if (firstLine and tableLength(lines) == 0) then
                -- print('breaking loop due to no irb in first line')
                -- end loop because first line wasnt from irb
                break
            end
            firstLine = false
        end
        if (tableLength(lines) > 0) then
            skipPayloadEdit = true -- skip self-triggered event created by updating pasteboard
            local newPayload = tableToString(lines)
            -- print('new payload ' .. newPayload)
            hs.pasteboard.setContents(newPayload)
        end
    else
        skipPayloadEdit = false
    end
end

pasteboardWatcher = hs.pasteboard.watcher.new(handlePaste)

pasteboardWatcher:start()