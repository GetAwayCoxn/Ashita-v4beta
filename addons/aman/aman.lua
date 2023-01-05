addon.name      = 'aman';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'aman';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local fonts = require('fonts');
local settings = require('settingsTest');

local display = T{};
local osd = T{};
local lasttarget = T{};
local zone_bool = false;
local thwack_bool = true;
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
	},
    zones = T{'Horlais Peak','Waughroon Shrine','Balga\'s Dais',},
    chests = T{
        ['Chest O\'Plenty'] = T{},
        ['Coffer O\'Plenty'] = T{},
    },
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

ashita.events.register('packet_in', '__settings_packet_in_cb', function (e)
    -- Packet: Zone Exit
    if (e.id == 0x000B) and zone_bool then
        settings.save();
        zone_bool = false;
        thwack_bool = true;
    end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    display.text = '';
    local area = AshitaCore:GetResourceManager():GetString("zones.names", AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0));
    if not osd.zones:hasval(area) then return end;

    local lasttargetID = lasttarget.ServerId or '0';

    display.text = 'AMAN Zone (lastID: ' .. lasttargetID .. '): ' .. area;
    zone_bool = true;

    if display.position_x ~= osd.position_x or display.position_y ~= osd.position_y then--force settings save when dragging the text box
        osd.position_x = display.position_x;
        osd.position_y = display.position_y;
        settings.save();
    end

    local targetIndex = AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0);
    if targetIndex == nil then 
        return;
    end
        
    local target = GetEntity(targetIndex);
    if target == nil then return end;

    if not osd.chests:haskey(target.Name) then
        return;
    else
        lasttarget = target;
    end

    display.text = display.text .. '\n' .. lasttarget.Name

    if osd.chests[lasttarget.Name][lasttarget.ServerId] == nil then
        osd.chests[lasttarget.Name][lasttarget.ServerId] = T{0,};--set if first load
    end
    
    local avg = 0;
    for x = 1, #osd.chests[lasttarget.Name][lasttarget.ServerId] do
        avg = avg + osd.chests[lasttarget.Name][lasttarget.ServerId][x]
    end
    avg = string.format('%2i',(avg/#osd.chests[lasttarget.Name][lasttarget.ServerId])*100);

    display.text = display.text .. '(' .. tostring(lasttarget.ServerId) .. ') Mimic: ' .. avg .. '%  Records: ' .. tostring(#osd.chests[lasttarget.Name][lasttarget.ServerId])
end);

ashita.events.register('text_in', 'text_in_callback1', function (e)
    if lasttarget == nil then
        return;
    elseif not osd.chests:haskey(lasttarget.Name) then
        return;
    end

    local str = string.lower(e.message)
    if thwack_bool and (str:contains('ka-thwack') or str:contains('chest') or str:contains('coffer') or str:contains('defeated by')) then
        if #osd.chests[lasttarget.Name][lasttarget.ServerId] == 1 then
            osd.chests[lasttarget.Name][lasttarget.ServerId][1] = 1;
        else
            osd.chests[lasttarget.Name][lasttarget.ServerId][#osd.chests[lasttarget.Name][lasttarget.ServerId]+1] = 1;
        end
        thwack_bool = false;--preventing multiple adds of mimics, resets on zone out and on first load
    elseif str:contains('thud') or str:contains('noise') then
        if #osd.chests[lasttarget.Name][lasttarget.ServerId] == 1 then
            osd.chests[lasttarget.Name][lasttarget.ServerId][1] = 0;
        else
            osd.chests[lasttarget.Name][lasttarget.ServerId][#osd.chests[lasttarget.Name][lasttarget.ServerId]+1] = 0;
        end
    end
end);