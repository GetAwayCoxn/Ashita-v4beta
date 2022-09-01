addon.name      = 'wscount';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Simply tracks and displays how many times you use a set WS.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local chat = require('chat');
local fonts = require('fonts');

local fontdefaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 800,
	position_y = 700,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};
local count = 0;
local weaponskill = 'Fast Blade';
local display = {};
local data = {
    [18720] = {218,'Leaden Salute'}--quicksilver
},

ashita.events.register('load', 'load_cb', function()
	display = fonts.new(fontdefaults);
end );

ashita.events.register('unload', 'unload_cb', function()
    if (display ~= nil) then
		display:destroy();
	end
end );

ashita.events.register('text_in', 'text_in_cb', function (e)
    if e.message_modified:contains('readies ' .. weaponskill) then
        count = count + 1;
    end
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (args[1] ~= '/wscount') then
        return;
    end

    e.blocked = true;

    if (args[2] == 'test') then
        test();
    elseif (args[2] == 'reset') then
        count = 0;
        print(chat.header('WScount'):append(chat.message('Reset ' .. weaponskill .. ' Count')));
    elseif (#args == 2) then
        weaponskill = args[2];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    elseif (#args == 3) then
        weaponskill = args[2] .. ' ' .. args[3];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    elseif (#args == 4) then
        weaponskill = args[2] .. ' ' .. args[3] .. ' ' .. args[4];
        print(chat.header('WScount'):append(chat.message('Changed WS to: ' .. weaponskill)));
    else
        print(chat.header('WScount'):append(chat.message('Invalid Command')));
    end
end );

ashita.events.register('d3d_present', 'present_cb', function ()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local main = get_equipped_item(0);
    local range = get_equipped_item(2);--18720
    local check = false;
    local name = '';


    for k,v in pairs(data) do
        if range == k then
            name = v[2];
            if player:HasWeaponSkill(v[1]) then
                check = true;
            end
        elseif main == k then
            name = v[2];
            if player:HasWeaponSkill(v[1]) then
                check = true;
            end
        end
    end

	local text = 'Current ' .. weaponskill .. ' Count: ' .. count .. ' Test: ' .. name .. ' Check: ' .. tostring(check);
	
	display.text = text;
end);

function test()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local main = AshitaCore:GetMemoryManager():GetInventory():GetEquippedItem(0);
    local range = AshitaCore:GetMemoryManager():GetInventory():GetEquippedItem(2);--18720

    print(tostring(get_equipped_item(2)));
end;

function get_equipped_item(slot)
    local inv = AshitaCore:GetMemoryManager():GetInventory();

    local eitem = inv:GetEquippedItem(slot);
    if (eitem == nil or eitem.Index == 0) then
        return nil;
    end

    local iitem = inv:GetContainerItem(bit.band(eitem.Index, 0xFF00) / 0x0100, eitem.Index % 0x0100);
    if(iitem == nil or T{ nil, 0, -1, 65535 }:hasval(iitem.Id)) then return nil; end

    return iitem.Id;
end