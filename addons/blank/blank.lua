addon.name      = 'blank';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');

ashita.events.register('load', 'load_cb', function()

end);

ashita.events.register('unload', 'unload_cb', function()

end);

ashita.events.register('d3d_present', 'present_cb', function ()

end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/blank') then --and (args[1] ~= '/ph')) then
        return;
    end

    e.blocked = true;
end);