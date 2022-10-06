addon.name      = 'doorman';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'blank';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');

local doorIds = T{16982068,};
ashita.events.register('load', 'load_cb', function()

end);

ashita.events.register('unload', 'unload_cb', function()

end);

ashita.events.register('d3d_present', 'present_cb', function ()
    if (AshitaCore:GetMemoryManager():GetParty():GetMemberIsActive(0) == 0 or AshitaCore:GetMemoryManager():GetParty():GetMemberServerId(0) == 0) then
        return;
    end

    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));

    if (target ~= nil) and doorIds:contains(target.ServerId) and math.sqrt(target.Distance) < 5.5 then
        AshitaCore:GetChatManager():QueueCommand(1, '/item "' .. v .. '" <t>');
    end
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/doorman') then --and (args[1] ~= '/ph')) then
        return;
    end

    e.blocked = true;
end);