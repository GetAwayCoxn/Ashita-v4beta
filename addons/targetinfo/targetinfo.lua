addon.name      = 'TargetInfo';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Meant to just quickly display your targets ID.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local fonts = require('fonts');

local settings = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 1500,
	position_y = 300,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};

ashita.events.register('load', 'load_cb', function ()
    Display = fonts.new(settings);
end);

ashita.events.register('unload', 'unload_cb', function ()
	if (Display ~= nil) then
		Display:destroy();
	end
	ashita.events.unregister('d3d_present', 'gcdisplay_present_cb');
end);

ashita.events.register('d3d_present', 'present_cb', function() 
	if settings.visible == false then 
		return;
	end

    if (AshitaCore:GetMemoryManager():GetParty():GetMemberIsActive(0) == 0 or AshitaCore:GetMemoryManager():GetParty():GetMemberServerId(0) == 0) then
        Display.text = '';
        return;
    end

    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));

    if (target ~= nil) then
        Display.text = target.Name .. '   ' .. tostring(target.ServerId) .. '   ' .. tostring(target.TargetIndex) .. '   ' .. ('%.2f'):fmt(target.MovementSpeed);
    else
        Display.text = '';
    end
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (args[1] ~= '/targetinfo') and (args[1] ~= '/ti') then
        return;
    end
    if (args[1] == '/targetinfo') or (args[1] == '/ti') then
        settings.visible = not settings.visible;
    end
end);