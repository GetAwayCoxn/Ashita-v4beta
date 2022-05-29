addon.name      = 'wscount';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Simply tracks and displays how many times you use a set WS.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local chat = require('chat');
local fonts = require('fonts');

local fontdefaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 800,
	position_y = 700,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};
local count = 0;
local weaponskill = 'Fast Blade';
local display = {};


ashita.events.register('load', 'load_cb', function()
	display = fonts.new(fontdefaults);
end );

ashita.events.register('unload', 'unload_cb', function()
    if (display ~= nil) then
		display:destroy();
	end
end );

ashita.events.register('text_in', 'text_in_cb', function (e)
    if e.message_modified:contains('readies ' .. weaponskill) then
        count = count + 1;
    end
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (args[1] ~= '/wscount') then
        return;
    end

    e.blocked = true;

    if (args[2] == 'reset') then
        count = 0;
        print(chat.header('WScount'):append(chat.message('Reset ' .. weaponskill .. ' Count')));
    elseif (#args == 2) then
        weaponskill = args[2];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    elseif (#args == 3) then
        weaponskill = args[2] .. ' ' .. args[3];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    elseif (#args == 4) then
        weaponskill = args[2] .. ' ' .. args[3] .. ' ' .. args[4];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    else
        print(chat.header('WScount'):append(chat.message('Invalid Command')));
    end
end );

ashita.events.register('d3d_present', 'present_cb', function ()
	local text = 'Current ' .. weaponskill .. ' Count: ' .. count;
	
	display.text = text;
end);