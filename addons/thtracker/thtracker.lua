addon.name      = 'thtracker';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'tracks TH on mobs, several TH trackers out there but this is not a port';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local fonts = require('fonts');
local settings = require('settings');

local display = T{};
local osd = T{};
local mobs = T{};-- [id] = {name,HPP,THcount}
local defaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};

settings.register('settings', 'settings_update', function (s)
    if (s ~= nil) then
        osd = s;
    end
    settings.save();
end);

ashita.events.register('load', 'load_cb', function()
	osd = settings.load(defaults);
    
    display = fonts.new(osd);
end);

ashita.events.register('unload', 'unload_cb', function()
	settings.save();

    if (display ~= nil) then
		display:destroy();
	end
end);

ashita.events.register('text_in', 'text_in_cb', function(e)
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local player = AshitaCore:GetMemoryManager():GetPlayer();

    if e.message:contains('Treasure Hunter') or e.message:contains('AE: TH') then
        local index = AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0);
        if index == nil then return end;
	    local target = GetEntity(index);
        if AshitaCore:GetMemoryManager():GetEntity():GetType(index) ~= 2 then return end;
        local count = tonumber(string.match(e.message,'%d+'));
        mobs[index] = {target.Name, target.HPPercent, count};
    elseif (e.message:contains('hit') or e.message:contains('ranged attack') or e.message:contains('RA')) and e.message:contains(me) then
        local index = AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0);
        if index == nil then return end;
	    local target = GetEntity(index);
        if AshitaCore:GetMemoryManager():GetEntity():GetType(index) ~= 2 then return end;
        local count = 0;
        if player:GetMainJob(0) == 6 then--need to add a offset for gear bonus then adjust the for checks below to 8/4
            for k,v in pairs(mobs) do
                if k == index then
                    if v[3] >= 8 then return end;
                end
            end
            if player:GetMainJobLevel(0) >= 90 then
                count = 8;--assumes your wearing gear on THF main for now until i build a proper offset
            elseif player:GetMainJobLevel(0) >= 45 then
                count = 2;
            else
                count = 1;
            end
        elseif player:GetSubJob(0) == 6 then
            for k,v in pairs(mobs) do
                if k == index then
                    if v[3] >= 2 then return end;
                end
            end
            if player:GetSubJobLevel(0) >= 45 then
                count = 2;
            else
                count = 1;
            end
        end
        if target == nil then return end;
        mobs[index] = {target.Name, target.HPPercent, count};
    end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
	if (player:GetIsZoning() ~= 0) then
        mobs = T{};
		return;
	end

    if not osd.visible then
        return;
    end

    local t = 0;
    display.text = '';

    for k,v in pairs(mobs) do
        
        t = t + 1;
        
        if t == 1 then
            display.text = 'THtracker Tracking Mobs: ';
        end
        
        local mob = GetEntity(k);
        display.text = display.text .. '\n' .. v[1] .. '(' .. tostring(k) .. ')  HPP: ' .. tostring(v[2]) .. '  TH: ' .. tostring(v[3]);
        
    end

	if display.position_x ~= osd.position_x or display.position_y ~= osd.position_y then
        osd.position_x = display.position_x;
        osd.position_y = display.position_y;
        settings.save();
    end
    update();
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    
    if args[1] ~= '/thtracker' and args[1] ~= '/tht' then
        return;
    end

    e.blocked = true;

    if args[2] == 'test' then
        test(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    elseif args[2] == 'update' then
        update();
    end
end);

function test(index)
    if index == nil then return end;
	local target = GetEntity(index);
	if target == nil then return end;
    local item = AshitaCore:GetMemoryManager():GetInventory():GetEquippedItem(1);
    local item2 = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(item.Index);
    print(tostring(item2.Id))
end

function update()
    for k,v in pairs(mobs) do
        v[2] = AshitaCore:GetMemoryManager():GetEntity():GetHPPercent(k);
        
        if tonumber(('%2i'):fmt(math.sqrt(AshitaCore:GetMemoryManager():GetEntity():GetDistance(k)))) > 50 then v[2] = 0 end;
        
        for m = 0, 17 do
            if AshitaCore:GetMemoryManager():GetParty():GetMemberName(m) == v[1] then
                mobs[k] = nil
            end
        end

        if v[2] == 0 then mobs[k] = nil end
    end
end