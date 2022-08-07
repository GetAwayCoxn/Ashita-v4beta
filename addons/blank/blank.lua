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

ashita.events.register('text_in', 'text_in_callback1', function (e)
    --[[ Valid Arguments
        e.mode               - (ReadOnly) The message mode.
        e.indent             - (ReadOnly) Flag that determines if the message is indented.
        e.message            - (ReadOnly) The raw message string.
        e.mode_modified      - The modified mode.
        e.indent_modified    - The modified indent flag.
        e.message_modified   - The modified message.
        e.injected           - (ReadOnly) Flag that states if the text was injected by Ashita or an addon/plugin.
        e.blocked            - Flag that states if the text has been, or should be, blocked.
    --]]

    --[[ Note: Deadlock Warning!
            If you directly print from this function, you can cause a deadlock in any addon not properly filtering
            and reprocessing text_in calls. The below example will deadlock and crash the client if not checking
            for the injected flag or if you only re-process injected messages over and over.
            You should avoid printing from this function as much as possible!
    --]]

    if (not e.injected) then
        print(string.format("[Example] 'text_in' event was called: (non-injected) %s", e.message));
    end

    -- Mark all incoming text as indented to demo modding e..
    if (not e.blocked and not e.indent) then
        e.indent_modified = true;
    end

    -- Look for and modify messages starting with '1' as an example.. (/echo 1)
    if (not e.blocked and not e.injected) then
        if (string.sub(e.message, 1, 1) == '1') then
            e.mode_modified      = 4;
            e.message_modified   = '(Modified!)';
        end
    end
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
    if (e.id == 0x5A) then
        -- Look for /dance emotes and replace them with /wave instead..
        local emoteId = struct.unpack('b', e.data, 0x10 + 1);
        if (emoteId == 31) then
            -- Use FFI to convert to the data and modify it to /wave..
            local ffi = require('ffi');
            local ptr = ffi.cast('uint8_t*', e.data_modified_raw);
            ptr[0x10] = 8;
        end
    end
end);

ashita.events.register('packet_out', 'packet_out_callback1', function (e)
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
    if (e.id == 0x5D) then
        -- Look for /panic emotes and replace them with /wave instead.. (All via FFI)
        local ffi = require('ffi');
        local ptr = ffi.cast('uint8_t*', e.data_modified_raw);

        -- Replace the emote..
        if (ptr[0x0A] == 29) then
            ptr[0x0A] = 8;
        end        
    end
end);