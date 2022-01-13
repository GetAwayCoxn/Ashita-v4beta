addon.name      = 'Data';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Tracks things.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
chat = require('chat');
local interface = require('interface');
imgui = require('imgui');

ashita.events.register('load', 'load_cb', interface.Load);

ashita.events.register('unload', 'unload_cb', interface.Unload);

ashita.events.register('d3d_present', 'present_cb', interface.Render);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (#args == 0) then
        return;
    end
    if (args[1] ~= '/data') then
        return;
    end

    e.blocked = true;
    
    if (#args == 1 or (#args >= 2 and args[2]:any('interface'))) then
        interface.is_open[1] = not interface.is_open[1];
        return;
    end

end);