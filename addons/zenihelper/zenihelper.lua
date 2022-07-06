addon.name      = 'zenihelper';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local interface = require('interface');
imgui = require('imgui');
data = require('data');

ashita.events.register('load', 'load_cb', function()

end);

ashita.events.register('unload', 'unload_cb', function()

end);

ashita.events.register('d3d_present', 'present_cb', interface.render);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/zenihelper') and (args[1] ~= '/zh')) then
        return;
    end

    e.blocked = true;

    if (#args <= 1) and ((args[1] == '/zenihelper') or (args[1] == '/zh')) then
        interface.is_open[1] = not interface.is_open[1];
    elseif (#args >= 2 and args[2]:any('trade')) then
        interface.dotrade();
    --[[elseif (#args >= 2 and args[2]:any('set')) then
        local eles = {'dark','light','earth','wind','fire','ice','thunder','water'};
        for x = 1, #eles do
            for y = 1, #manager.menu_holders do
                if args[y+2] == nil then
                elseif string.lower(args[y+2]) == eles[x] then
                    manager.menu_holders[y] = x - 1;
                end
            end
        end]]
    end
end);