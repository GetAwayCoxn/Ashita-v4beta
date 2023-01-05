addon.name      = 'boxhelper';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local fonts = require('fonts');
local settings = require('settings');
local chat = require('chat');

--defaults
local listening = true;
local newBox = true;
local display = {};
local osd = {};
local options = T{};
local defaults = T{
    visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	green = '|cFF00FF00|';
	red = '|cFFFF0000|';
	yellow = '|cFFFFFF00|';
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0xFF000000,
	},
};

settings.register('settings', 'settings_update', function (s)
    if (s ~= nil) then
        osd = s;
    end
    settings.save();
end);

ashita.events.register('load', 'load_cb', function()
    osd = settings.load(defaults);
    display = fonts.new(osd);
end);

ashita.events.register('unload', 'unload_cb', function()
    settings.save();

    if (display ~= nil) then
		display:destroy();
	end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local myTarget = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    
    if not myTarget or myTarget.Name ~= 'Treasure Casket' then return end;

    if (player:GetIsZoning() ~= 0) then
        newBox = true;
        ResetOptions();
    end

    if display.position_x ~= osd.position_x or display.position_y ~= osd.position_y then
        osd.position_x = display.position_x;
        osd.position_y = display.position_y;
        settings.save();
    end

    if newBox then
        ResetOptions();
        newBox = false;
    end

    display.text = '';
    display.text = 'Casket (' .. myTarget.TargetIndex .. ')\n';
    display.text = display.text .. 'Best Guess: ' .. options[math.ceil(options:length()/2)] .. '\n';

    for op = 1, options:length() do
        display.text = display.text .. options[op] .. '|'
    end
    
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/boxhelper') then -- and (args[1] ~= '/bh')) then
        return;
    end

    e.blocked = true;

    if (args[2] == 'test') then
        test()
    end
end);

ashita.events.register('text_in', 'text_in_callback1', function (e)
    if e.message:contains('You have a hunch') then
        listening = false;
        local words = e.message:args();
        local offset = 0;
        if words[5] == 'hunch' then offset = 1; end

        if e.message:contains('the first digit is') then
            ProcessFirst(words,offset);
        elseif e.message:contains('the second digit is') then
            ProcessSecond(words,offset);
        elseif e.message:contains('one of the two digits is') then
            ProcessTwoDigits(words,offset);
        elseif e.message:contains('the combination is greater than') then
            ProcessGreaterThan(words,offset);
        end
    elseif e.message:contains('The chest is locked.') then
        listening = true;
    end
end);

function ResetOptions()
    options = options:clear();
    for x = 10, 99 do
        options:append(x);
    end
end

function ProcessFirst(words,offset)
    if words[10 + offset] == 'even.' then
        local newOptions = T{};
        for num = 1, options:length() do
            if math.floor(options[num] / 10) % 2 == 0 then
                newOptions:append(options[num]);
            end
        end
        options:clear();
        options = newOptions:copy();
    elseif words[10 + offset] == 'odd.' then
        local newOptions = T{};
        for num = 1, options:length() do
            if math.floor(options[num] / 10) % 2 ~= 0 then
                newOptions:append(options[num]);
            end
        end
        options:clear();
        options = newOptions:copy();
    else
        local newOptions = T{};
        local first = tonumber(string.sub(words[10 + offset],1,1));
        local second = tonumber(string.sub(words[11 + offset],1,1));
        local third = tonumber(string.sub(words[13 + offset],1,1));
        for num = 1, options:length() do
            local numStr = string.sub(tostring(options[num]),1,1)
            if numStr == first or numStr == second or numStr == third then
                newOptions:append(options[num]);
            end
        end
        options:clear();
        options = newOptions:copy();
    end
end

function ProcessSecond(words)

end

function ProcessTwoDigits(words)

end

function ProcessGreaterThan(words)

end

function test()
    ResetOptions()
    print(tostring(options[options:length()]))
end
