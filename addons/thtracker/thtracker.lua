addon.name      = 'thtracker';
addon.author    = 'GetAwayCoxn, based on windower addon by Krizz';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local fonts = require('fonts');
local settings = require('settings');

local display = {};
local osd = {};
local monster = '';
local proc = '8';
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

ashita.events.register('text_in', 'text_in_cb', function(e)
    local name, count = e.message:match('Additional effect: Treasure Hunter effectiveness against[%s%a%a%a]- (.*) increases to (%d+).')
    
    if name and count then
        name = name.gsub(name, "the ", "")
        monster = name
        mob = name
        proc = count;
        display.visible = true;
    end

    local deadmob = e.message:match('%w+ defeats[%s%a%a%a]- (.*).')
    
    if deadmob then
        deadmob = deadmob.gsub(deadmob, "the ", "")
    end
    
    if deadmob and deadmob == mob then
        display.visible = false;
        proc = '8';
        mob = nil
    end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	if player:GetMainJob() ~= 6 then return end;
    local status = AshitaCore:GetMemoryManager():GetEntity():GetStatus(AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0));

    if (status == 1) then
        display.visible = true;
    else
        display.visible = false;
    end

    display.text = 'TH: ' .. proc .. ' on ' .. monster;
	if display.position_x ~= osd.settings.position_x or display.position_y ~= osd.settings.position_y then
        osd.settings.position_x = display.position_x;
        osd.settings.position_y = display.position_y;
        settings.save();
    end
end);