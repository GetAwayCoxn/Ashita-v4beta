addon.name      = 'Test';
addon.author    = 'Thorny';
addon.version   = '1.00';
addon.desc      = 'Parses zone message dats';
addon.link      = 'https://github.com/ThornyFFXI/';

require('common');

local activeMenu;
local menuDelay = 0;
local function GetMenu(e)
    if (e.id == 0x32) then
            return { Id = struct.unpack('L', e.data, 0x04 + 1), Index = struct.unpack('H', e.data, 0x08 + 1), MenuId = struct.unpack('H', e.data, 0x0C + 1) };
    elseif (e.id == 0x33) then
            return { Id = struct.unpack('L', e.data, 0x04 + 1), Index = struct.unpack('H', e.data, 0x08 + 1), MenuId = struct.unpack('H', e.data, 0x0C + 1) };
    elseif (e.id == 0x34) then
            return { Id = struct.unpack('L', e.data, 0x04 + 1), Index = struct.unpack('H', e.data, 0x28 + 1), MenuId = struct.unpack('H', e.data, 0x2C + 1) };
    end
end

ashita.events.register('packet_in', 'incoming', function (e)
    if (e.id == 0x32) or (e.id == 0x34) or (e.id == 0x33) then   
        local menu = GetMenu(e);
        if menu then
            activeMenu = menu;
            menuDelay = os.clock() + 2;
        end
        e.blocked = true;
    end
end);

ashita.events.register('d3d_present', 'render', function ()
    if activeMenu and (os.clock() > menuDelay) then
        local param1 = 0;
        local param2 = 0;
        local zone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0);
        local packet = struct.pack('LLHHHBBHH',
        0, activeMenu.Id, param1, param2, activeMenu.Index, 0, 0, zone, activeMenu.MenuId);
        AshitaCore:GetPacketManager():AddOutgoingPacket(0x5B, packet:totable());
        print('Injecting menu complete..');
        activeMenu = nil;
    end
end);