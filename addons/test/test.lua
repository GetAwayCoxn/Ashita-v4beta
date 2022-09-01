addon.name      = 'test';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'test';
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
    if (#args == 0) or (args[1] ~= '/test') then --and (args[1] ~= '/ph')) then
        return;
    end

    e.blocked = true;
end);

ashita.events.register('packet_in', 'packet_in_callback1', function (e)
    --[[ Valid Arguments
        e.id                 - (ReadOnly) The id of the packet.
        e.size               - (ReadOnly) The size of the packet.
        e.data               - (ReadOnly) The data of the packet.
        e.data_raw           - The raw data pointer of the packet. (Use with FFI.)
        e.data_modified      - The modified data.
        e.data_modified_raw  - The modified raw data. (Use with FFI.)
        e.chunk_size         - The size of the full packet chunk that contained the packet.
        e.chunk_data         - The data of the full packet chunk that contained the packet.
        e.chunk_data_raw     - The raw data pointer of the full packet chunk that contained the packet. (Use with FFI.)
        e.injected           - (ReadOnly) Flag that states if the packet was injected by Ashita or an addon/plugin.
        e.blocked            - Flag that states if the packet has been, or should be, blocked.
    --]]

    -- Look for emote packets..
    if (e.id == 0x01D) then
        print("found " .. e.id)
    end
end);
