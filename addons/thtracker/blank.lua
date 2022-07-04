addon.name      = 'THtracker';
addon.author    = 'GetAwayCoxn, based on windower addon by Krizzz';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local fonts = require('fonts');
local settings = require('settings');

local display = {};
local osd = {};
local defaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 18,
	color = 0xFFFFFFFF,
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};

settings.register('settings', 'settings_update', function (s)
    if (s ~= nil) then
        osd.settings = s;
    end
    settings.save();
end);

ashita.events.register('load', 'load_cb', function()
	osd.settings = settings.load(defaults);
    
    display = fonts.new(osd.settings);
end);

ashita.events.register('unload', 'unload_cb', function()
	settings.save();

    if (display ~= nil) then
		display:destroy();
	end
end);

ashita.events.register('incoming_text', 'incoming_text_cb', function()

end);

ashita.events.register('d3d_present', 'present_cb', function ()
	
	display.text = 'TH: 8';
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/thtracker') then and (args[1] ~= '/tht')) then
        return;
    end
end);