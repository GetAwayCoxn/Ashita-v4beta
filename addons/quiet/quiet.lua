addon.name      = 'Quiet';
addon.author    = 'Thorny';
addon.version   = '1.0';
addon.desc      = 'Blocks action packets that don\'t effect alliance members.';
addon.link      = 'https://github.com/ThornyFFXI/';
require('common');

ashita.events.register('packet_in', 'packetdata_cb', function (e)
    -- Packet: Zone Exit
    if (e.id == 0x000B) then
        AshitaCore:GetChatManager():QueueCommand(1, '/addon unload quiet');
    elseif (e.id == 0x028) then
        local userId = struct.unpack('L', e.data, 0x05 + 1);
        local userIndex = bit.band(userId, 0x7FF);
        
        --Allow any packet from a dat allocated mob/npc.
        if (AshitaCore:GetMemoryManager():GetEntity():GetServerId(userIndex) == userId) then
            return;
        end
        
        local myAlliance = T{};
        local party = AshitaCore:GetMemoryManager():GetParty()
        for i = 0,17 do
            if (party:GetMemberIsActive(i)) then
                myAlliance:append(party:GetMemberServerId(i));
            end
        end
        
        --Allow any packet from alliance members.
        if (myAlliance:contains(userId)) then
            return;
        end
        
        local targetCount = ashita.bits.unpack_be(e.data_raw, 0, 72, 10);
        local bitOffset = 150;
        for i = 1,targetCount do
            local targetId = ashita.bits.unpack_be(e.data_raw, 0, bitOffset, 32);
            --Allow any packet that targets alliance members.
            if (myAlliance:contains(targetId)) then
                return;
            end
            bitOffset = bitOffset + 32;
            local actionCount = ashita.bits.unpack_be(e.data_raw, 0, bitOffset, 4);
            bitOffset = bitOffset + 4;
            for j = 1,actionCount do
                bitOffset = bitOffset + 85;            
                if (ashita.bits.unpack_be(e.data_raw, 0, bitOffset, 1) == 1) then
                    bitOffset = bitOffset + 38;
                else
                    bitOffset = bitOffset + 1;
                end            
                if (ashita.bits.unpack_be(e.data_raw, 0, bitOffset, 1) == 1) then
                    bitOffset = bitOffset + 35;
                else
                    bitOffset = bitOffset + 1;
                end
            end
        end
        
        e.blocked = true;
    end
end);