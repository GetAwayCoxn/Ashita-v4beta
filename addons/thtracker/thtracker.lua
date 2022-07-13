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
local mobs = T{};
local defaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
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
    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    local name, count = e.message:match('Additional effect: Treasure Hunter effectiveness against[%s%a%a%a]- (.*) increases to (%d+).');
    local count = e.message:contains('AE: TH (%d+)');
    
    if count then
        display.visible = true;
        if target ~= nil then
            mobs[target.TargetIndex] = AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(target.TargetIndex);
        end
        update();
    end

end);

ashita.events.register('d3d_present', 'present_cb', function ()
    local status = AshitaCore:GetMemoryManager():GetEntity():GetStatus(AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0));
    local t = 0;
    display.text = '';

    if (status == 1) then
        display.visible = true;
    else
        display.visible = false;
    end

    for k,v in pairs(mobs) do
        t = t + 1;
        if v == nil or v == 0 then
            if t == 1 then t = 0 end
        else
            if t > 1 then
                display.text = display.text .. '\n';
            end
            local mobname = GetEntity(k);
            display.text = display.text .. mobname.Name[1] .. '(' .. tostring(k) .. '): ' .. AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(k);
        end
    end
	if display.position_x ~= osd.settings.position_x or display.position_y ~= osd.settings.position_y then
        osd.settings.position_x = display.position_x;
        osd.settings.position_y = display.position_y;
        settings.save();
    end
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    
    if args[1] ~= '/tht' then
        return;
    end

    e.blocked = true;

    if args[2] == 'test1' then
        test();
    elseif args[2] == 'test2' then
        update();
    end
end);

function test()
    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    local t = 0;
    display.text = '';

    if target ~= nil then
        mobs[target.TargetIndex] = AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(target.TargetIndex);
    end

    for k,v in pairs(mobs) do
        t = t + 1;
        if v == nil or v == 0 then
            if t == 1 then t = 0 end
        else
            if t > 1 then
                display.text = display.text .. '\n';
            end
            local mobname = GetEntity(k);
            display.text = display.text .. mobname.Name[1] .. '(' .. tostring(k) .. '): ' .. AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(k);
        end
    end
end

function update()
    for k,v in pairs(mobs) do
        mobs[k] = AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(k);
    end

    test();
end