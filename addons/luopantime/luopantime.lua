addon.name      = 'luopantime';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Light weight count down timer for Luopans';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local fonts = require('fonts');
local settings = require('settings');

local display = {};
local osd = {};
local newpet = true;
local casttime = nil;
local active = false;
local indi = 'Indi-Acumen';
local indiUp = false;
local geo = 'Geo-INT';
local defaults = T{
	visible = true,
	font_family = 'Arial',
	font_height = 14,
	color = 0xFFFFFFFF,
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};

ashita.events.register('load', 'load_cb', function()
    osd.settings = settings.load(defaults);
    
    display = fonts.new(osd.settings);
end);

ashita.events.register('unload', 'unload_cb', function()
    settings.save();

    if (display ~= nil) then
		display:destroy();
	end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if player:GetMainJob() ~= 21 then return end;
    if display.position_x ~= osd.settings.position_x or display.position_y ~= osd.settings.position_y then
        osd.settings.position_x = display.position_x;
        osd.settings.position_y = display.position_y;
        settings.save();
    end
    
    local MM = AshitaCore:GetMemoryManager();
    local petID = MM:GetEntity():GetPetTargetIndex(MM:GetParty():GetMemberTargetIndex(0));
    local output = 'Luopan Time: ';
    local petHP = 0;
    local buffs = player:GetBuffs();

    -- Colure Active
    if not petID or petID == 0 then
        display.visible = false;
    else
        display.visible = true;
        petHP = MM:GetEntity():GetHPPercent(petID);
    end

    if petHP <= 0 and not newpet then
        newpet = true;
        if geo and active then
            DoGeoSpell:once(2);
        end
    end
    if petHP >= 0 and newpet then
        newpet = false;
        casttime = os.clock();
        display.color = 0xFFFFFFFF;
    end

    if casttime then
        output = output .. '  ' .. remaining(casttime);
    end

    display.text = output;

    for _, buff in pairs(buffs) do
        local buffString = AshitaCore:GetResourceManager():GetString("buffs.names", buff);
        if buffString and buffString == 'Colure Active' and not indiUp then
            indiUp = true;
        end
        if buffString and ((buffString == 'Mounted') or (buffString == 'Weakness') or (buffString == 'Sleep') or (buffString == 'Charm') or (buffString == 'Terror') or (buffString == 'Paralysis') or (buffString == 'Stun') or (buffString == 'Petrification') or (buffString == 'Silence')) then
            return;
        end
    end
    if not indiUp and indi and active then
        DoIndiSpell()
    end
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or (args[1] ~= '/luopantime') then
        return;
    end

    e.blocked = true;

    if #args == 1 then
        active = not active;
    end
end);

function remaining(casttime)
    local t = os.clock() - casttime;
    local m = string.format("%02i", (600 - t)/60);
    local s = string.format("%02i", (600-(60*m)) - t);
    local str = m .. ':' .. s;
    if m == '00' and s == '45' then
        display.color = 0xFFFFFF00;
    elseif m == '00' and s == '15' then
        display.color = 0xFFFF0000;
    end
    return str;
end

function DoGeoSpell()
    print('Casting ' .. geo)
    AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. geo .. '" <me>');
end

function DoIndiSpell()
    print('Casting ' .. indi)
    AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. indi .. '" <me>');
end