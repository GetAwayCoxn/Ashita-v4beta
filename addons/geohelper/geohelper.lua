addon.name      = 'GEOhelper'
addon.author    = 'GetAwayCoxn'
addon.version   = '1.0'
addon.desc      = 'Automates some GEO things.'
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons'

require('common')
local fonts = require('fonts')
local chat = require('chat')
local settings = require('settings')
local display = {}
local osd = {}
local newpet = true
local casttime = nil
local casting = false
local towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',}
local indis = T { 'indi-poison', 'indi-voidance', 'indi-precision', 'indi-regen', 'indi-attunement',
    'indi-focus', 'indi-barrier', 'indi-refresh', 'indi-chr', 'indi-mnd',
    'indi-fury', 'indi-int', 'indi-agi', 'indi-fend', 'indi-vit',
    'indi-dex', 'indi-acumen', 'indi-str', 'indi-slow', 'indi-torpor',
    'indi-slip', 'indi-languor', 'indi-paralysis', 'indi-vex', 'indi-frailty',
    'indi-wilt', 'indi-gravity', 'indi-malaise', 'indi-haste', 'indi-fade',}
local geos = T { 'geo-poison', 'geo-voidance', 'geo-precision', 'geo-regen', 'geo-attunement',
    'geo-focus', 'geo-barrier', 'geo-refresh', 'geo-chr', 'geo-mnd',
    'geo-fury', 'geo-int', 'geo-agi', 'geo-fend', 'geo-vit',
    'geo-dex', 'geo-acumen', 'geo-str', 'geo-slow', 'geo-torpor',
    'geo-slip', 'geo-languor', 'geo-paralysis', 'geo-vex', 'geo-frailty',
    'geo-wilt', 'geo-gravity', 'geo-malaise', 'geo-haste', 'geo-fade',}
--defaults
local active = true
local defaults = T{
    indi = 'Indi-Haste',
    geo = 'Geo-INT',
    glory = false,
	visible = true,
	font_family = 'Arial',
	font_height = 14,
    bold = true,
	color = 0xFFFFFFFF,
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0x88000000,
	}
}

ashita.events.register('load', 'load_cb', function()
    osd = settings.load(defaults)

    display = fonts.new(osd)
end)

ashita.events.register('unload', 'unload_cb', function()
    settings.save()

    if display then
		display:destroy()
	end
    ashita.events.unregister('d3d_present', 'geohelper_present_cb');
	ashita.events.unregister('command', 'geohelper_command_cb');
end)

ashita.events.register('d3d_present', 'geohelper_present_cb', function ()
    -- Gates
    local party = AshitaCore:GetMemoryManager():GetParty()
    local area = AshitaCore:GetResourceManager():GetString("zones.names", party:GetMemberZone(0))
    if (area == nil) or (towns:contains(area)) or (party:GetMemberHPPercent(0) < 1) then
        active = false
	end

    -- If GEO is main job then draw things
    local player = AshitaCore:GetMemoryManager():GetPlayer()
    if player:GetMainJob() ~= 21 then
        display.visible = false
        return
    else
        display.visible = true
    end
    if display.position_x ~= osd.position_x or display.position_y ~= osd.position_y then
        osd.position_x = display.position_x
        osd.position_y = display.position_y
        settings.save()
    end

    local mm = AshitaCore:GetMemoryManager()
    local petID = mm:GetEntity():GetPetTargetIndex(mm:GetParty():GetMemberTargetIndex(0))
    local output = 'Indi: ' .. osd.indi .. '  Geo:' .. osd.geo .. '  Luopan Time: '
    if osd.glory then
        output = 'Indi: ' .. osd.indi .. '  Geo(auto-glory):' .. osd.geo .. '  Luopan Time: '
    end
    local petHP = 0

    if petID and petID ~= 0 then
        petHP = mm:GetEntity():GetHPPercent(petID)
    end

    if petHP >= 0 and newpet then
        newpet = false
        casttime = os.clock()
        display.color = 0xFFFFFFFF
    end

    if casttime then
        if petID and petID ~= 0 and active then
            output = output .. '  ' .. remaining(casttime)
        else
            output = output .. '  N/A'
        end
    end
    display.text = output

    -- manipulate background color for active status
    if active then
        display.background.color = 0x88008800
    else
        display.background.color = 0x88880000
    end

    if not active then return end
    -- Do GEO things
    local indiUp = false
    local gloryUp = false
    local buffs = player:GetBuffs()
    local moving = mm:GetTarget():GetIsPlayerMoving()

    for _, buff in pairs(buffs) do
        local buffString = AshitaCore:GetResourceManager():GetString("buffs.names", buff)
        if buffString and buffString == 'Colure Active' and not indiUp then
            indiUp = true
        elseif buffString and buffString == 'Blaze of Glory' and not gloryUp then
            gloryUp = true
        elseif buffString and buffString == 'Mounted' then
            active = false
            return
        elseif ((buffString == 'Weakness') or (buffString == 'Sleep') or (buffString == 'Charm') or (buffString == 'Terror') or (buffString == 'Paralysis') or (buffString == 'Stun') or (buffString == 'Petrification') or (buffString == 'Silence')) then
            return
        end
    end

    if os.clock() - casttime > 585 and osd.glory and not gloryUp then
        local gloryRecast = CheckAbilityRecast('Blaze of Glory')
        if gloryRecast <= 0 then
            AshitaCore:GetChatManager():QueueCommand(1, '/ja "Blaze of Glory" <me>')
        end
    elseif petHP <= 0 and not newpet and geos:contains(string.lower(osd.geo)) then
        if not casting then
            if osd.glory and not gloryUp then
                local gloryRecast = CheckAbilityRecast('Blaze of Glory')
                if gloryRecast <= 0 then
                    AshitaCore:GetChatManager():QueueCommand(1, '/ja "Blaze of Glory" <me>')
                end
            elseif moving == 0 then
                newpet = true
                casting = true
                DoSpell(osd.geo)
            end
        end
    elseif not indiUp and not casting and indis:contains(string.lower(osd.indi)) then
        if moving == 0 then
            casting = true
            DoSpell(osd.indi)
        end
    end
end)

ashita.events.register('command', 'geohelper_command_cb', function (e)
	local args = e.command:args()
    if (#args == 0) or (args[1] ~= '/geohelper' and args[1] ~= '/gh') then
        return
    end

    e.blocked = true

    if #args == 1 then
        active = not active
        if active then
		    print(chat.header(addon.name):append(chat.message('is now active')))
        else
		    print(chat.header(addon.name):append(chat.message('is now deactive')))
        end
    elseif #args == 3 and args[2] == 'setindi' then
        if indis:contains(string.lower(args[3])) or string.match(string.lower(args[3]), 'none') then
            osd.indi = args[3]
            if active then DoSpell(osd.indi) end
        else
            osd.indi = 'None'
            print(chat.header(addon.name):append(chat.message('That is not a known spell, check spelling')))
        end
    elseif #args == 3 and args[2] == 'setgeo' then
        if geos:contains(string.lower(args[3])) or string.match(string.lower(args[3]), 'none') then
            osd.geo = args[3]
        else
            osd.geo = 'None'
            print(chat.header(addon.name):append(chat.message('That is not a known spell, check spelling')))
        end
    elseif #args == 2 and args[2] == 'glory' then
        osd.glory = not osd.glory
        if osd.glory then
		    print(chat.header(addon.name):append(chat.message('Auto blaze of glory is now active')))
        else
		    print(chat.header(addon.name):append(chat.message('Auto blaze of glory is now deactive')))
        end
    end
end)

function remaining(casttime)
    local t = os.clock() - casttime
    local m = string.format("%02i", (600 - t)/60)
    local s = string.format("%02i", (600-(60*m)) - t)
    local str = m .. ':' .. s
    if m == '00' and s == '45' then
        display.color = 0xFFFFFF00
    elseif m == '00' and s == '15' then
        display.color = 0xFFFF0000
    end
    
    return str
end

function DoSpell(spell)
    AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. spell .. '" <me>')
    local function CastingHelper()
        casting = false
    end
    CastingHelper:once(5)
end

function CheckAbilityRecast(name)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);
			if ability and ability.Name[1] == name then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end
