addon.name      = 'boxhelper'
addon.author    = 'GetAwayCoxn'
addon.version   = '1.0'
addon.desc      = 'blank'
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons'

require('common')
local chat = require('chat')
local imgui = require('imgui')

--defaults
local listening = false
local newBox = true
local newGuess = true
local bestGuess = 0
local offset = 0
local options = T{}
local settings = T{
    is_open = {true},
    size = { 360, 235 },
    debug = true,
    text_color = { 1.0, 0.75, 0.25, 1.0 },
}
local debugMessage = ''

ashita.events.register('load', 'load_cb', function()
    ResetOptions()
end)

ashita.events.register('d3d_present', 'present_cb', function ()
    local player = AshitaCore:GetMemoryManager():GetPlayer()
    local playerStatus = AshitaCore:GetMemoryManager():GetEntity():GetStatus(AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0))


    if (player:GetIsZoning() ~= 0) or (newBox and playerStatus == 0) then
        newBox = false
        ResetOptions()
    end


    -- if not settings.is_open[1] or not newBox then
    --     return
    -- end

    imgui.SetNextWindowSize(settings.size)
    if imgui.Begin('BoxHelper', settings.is_open, ImGuiWindowFlags_NoResize) then

        if settings.debug then
            imgui.SameLine()
            imgui.Text('newBox: ' .. tostring(newBox) .. ' ')
            imgui.SameLine()
            imgui.Text('listening: ' .. tostring(listening) .. ' ')
            imgui.SameLine()
            imgui.Text('bestGuess: ' .. tostring(bestGuess) .. ' ')
        end

        if newGuess then
            SetBestGuess()
        end

        imgui.BeginTable('jobs table', 10, ImGuiTableFlags_Borders)
        imgui.TableNextRow()
        for k, v in pairs(options) do
            imgui.TableNextColumn()
            if v then
                if k == bestGuess then
                    imgui.TextColored(settings.text_color, tostring(k))
                else
                    imgui.Text(tostring(k))
                end
            else
                imgui.Text('  ')
            end
            if (k-9) % 10 == 0 and k ~= 99 then
                imgui.TableNextRow()
            end
        end
        imgui.EndTable()
        if settings.debug then imgui.Text(debugMessage) end
    end
    imgui.End()
end)

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args()
    if (#args == 0) or (args[1] ~= '/boxhelper') then
        return
    end

    e.blocked = true

    if #args == 1 then
        settings.is_open[1] = not settings.is_open[1]
    elseif (args[2] == 'debug') then
        settings.debug = not settings.debug
    elseif (args[2] == 'test') then
        test()
    end
end)

ashita.events.register('text_in', 'text_in_callback1', function (e)
    if string.match(e.message, 'You have a hunch') and listening then
        listening = false
        local words = e.message:args()
        offset = 0
        if words[5] == 'hunch' then offset = 1 end
        if string.match(e.message, 'the first digit is') then
            ProcessFirst(words, offset)
        elseif string.match(e.message, 'the second digit is') then
            ProcessSecond(words,offset)
        elseif string.match(e.message, 'one of the two digits is') then
            ProcessTwoDigits(words,offset)
        elseif string.match(e.message, 'lock\'s combination is greater than') then
            ProcessGreaterThan(words[12 + offset])
        elseif string.match(e.message, 'lock\'s combination is less than') then
            ProcessLessThan(words[12 + offset])
        elseif string.match(e.message, 'greater than') and string.match(e.message, 'less than') then
            ProcessBetween(words,offset)
        elseif string.match(e.message, 'the combination is greater than') then
            ProcessGreaterThan(words[11 + offset])
        elseif string.match(e.message, 'the combination is less than') then
            ProcessLessThan(words[11 + offset])
        end
    elseif string.match(e.message, 'The chest is locked.') then
        listening = true
        if not newBox then
            newBox = true
        end
    elseif string.match(e.message, 'succeeded in opening') then
        ResetOptions('succeeded')
    elseif string.match(e.message, 'failed to open the lock.') then
        ResetOptions('failed')
    end
end)

function ResetOptions(s)
    s = s or 'resetting options'
    listening = false
    newbox = false
    newGuess = true
    options = options:clear()
    for x = 10, 99 do
        options[x] = true
    end
    if s then debugMessage='Found ' .. s .. ' message' end
end

function SetBestGuess()
    newGuess = false
    local guesses = T{}
    for k, v in pairs(options) do
        if v then
            guesses:append(k)
        end
    end
    local i = math.floor(guesses:length() / 2)
    bestGuess = guesses[i]
    return guesses[i]
end

function ProcessFirst(words,o)
    if words[10 + o]:contains('even') then
        debugMessage = 'found first even'

    elseif words[10 + o]:contains('odd') then
        debugMessage = 'found first odd'

    else
        debugMessage = 'found first triple message'--need to handle the period
        local first = words[10 + o]
        local second = words[11 + o]
        local third = words[13 + o]

        debugMessage = 'words[10+offset] ' .. tostring(words[10+offset])
        debugMessage = tostring(first) .. ' ' .. tostring(second) .. ' ' .. tostring(third) .. ' '
    end
end

function ProcessSecond(words, o)
    if words[10 + o]:contains('even') then
        debugMessage = 'found second even'

    elseif words[10 + o]:contains('odd') then
        debugMessage = 'found second odd'

    else
        debugMessage = 'found second triple message' --need to handle the period
        local first = words[10 + o]
        local second = words[11 + o]
        local third = words[13 + o]

        debugMessage = 'words[10+offset] ' .. tostring(words[10+o])
        debugMessage = tostring(first) .. ' ' .. tostring(second) .. ' ' .. tostring(third) .. ' '
    end
end

function ProcessTwoDigits(words, o)
    debugMessage = 'Two digits found: ' .. words[12 + o]
end

function ProcessGreaterThan(numStr)
    debugMessage = 'GreaterThan found: ' .. numStr
    local fStr = string.sub(numStr,1,2)
    local n = tonumber(fStr) or 20
    for k in pairs(options) do
        if k <= n then
            options[k] = false
        end
    end
    newGuess = true
end

function ProcessLessThan(numStr)
    debugMessage = 'LessThan found: ' .. numStr
    local fStr = string.sub(numStr,1,2)
    local n = tonumber(fStr) or 80
    for k in pairs(options) do
        if k >= n then
            options[k] = false
        end
    end
    newGuess = true
end

function ProcessBetween(words, o) --need to handle the period here on second number maybe?
    debugMessage = 'found: ' .. words[11 + o] .. ' and ' .. words[15 + o]

    local min = tonumber(words[11 + o])
    for k in pairs(options) do
        if k <= min then
            options[k] = false
        end
    end

    local fStr = string.sub(words[15 + o],1,2)
    debugMessage = 'FStr: ' .. tostring(fStr)
    local max = tonumber(fStr) or 80
    debugMessage = 'max: ' .. tostring(max)
    for k in pairs(options) do
        if k >= max then
            options[k] = false
        end
    end
end

function Message(str)
    print(chat.header(addon.name):append(chat.message(str)))
end

function test()
    -- for k,v in pairs(options) do
    --     Message('key: ' .. tostring(k) .. ' value: ' .. tostring(v))
    -- end
    -- newBox = not newBox
    ProcessLessThan('55.')
    -- ProcessGreaterThan('25')
end
