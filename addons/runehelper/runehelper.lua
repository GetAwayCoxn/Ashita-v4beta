addon.name      = 'RuneHelper';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Does runefencer things.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local display = require('display');

ashita.events.register('load', 'load_cb', display.Load);

ashita.events.register('unload', 'unload_cb', display.Unload);

ashita.events.register('d3d_present', 'present_cb', display.Render);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (#args == 0) then
        return;
    end
    if (args[1] == '/runehelper') or (args[1] == '/rh') then
        display.is_open[1] = not display.is_open[1];
    else
        return;
    end

end);