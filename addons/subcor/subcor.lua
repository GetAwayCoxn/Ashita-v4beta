addon.name      = 'subcor';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Ashita v4 addon to auto roll Corsair\'s Roll, intended for subjob use only';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local toggle = false;
local roll = 12;
local Player = AshitaCore:GetMemoryManager():GetPlayer();
local me = AshitaCore:GetMemoryManager():GetParty();


local Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',
};

ashita.events.register('text_in', 'text_in_cb', function (e)
    if toggle then
        if e.message:contains('Corsair\'s Roll') and e.message:contains(me:GetMemberName(0)) then
            roll = tonumber(string.match(e.message,'%d+')) or 12;
        end
    end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    if not toggle then
        return;
    end

    local Area = AshitaCore:GetResourceManager():GetString("zones.names", me:GetMemberZone(0));
    
    -- Force Disabled under these conditions
    if (Player:GetIsZoning() ~= 0) or (Area == nil) or (Towns:contains(Area)) or (Player:GetSubJob() ~= 17) or (Player:GetHPPercent() <= 1) then 
		toggle = false;
        print('SubCor Auto Rolling is: ' .. tostring(toggle));
        return;
	end

    local corbuff = 0;
    local dblup = 0;

    --check for cor roll and dbl up, also kick out under some circumstances
    local buffs = AshitaCore:GetMemoryManager():GetPlayer():GetBuffs();
    for _, buff in pairs(buffs) do
        local buffString = AshitaCore:GetResourceManager():GetString("buffs.names", buff);
		
        if (buffString ~= nil) and ((buffString == 'Mounted') or (buffString == 'Sleep') or (buffString == 'Terror') or (buffString == 'Amnesia')) then
            return;
        elseif (buffString ~= nil) and (buffString == 'Corsair\'s Roll') then
            corbuff = corbuff + 1;
        elseif (buffString ~= nil) and (buffString == 'Double-Up Chance') then
            dblup = dblup + 1;
        end
    end

    if corbuff == 0 and (CheckAbilityRecast('Phantom Roll') == 0) then
        AshitaCore:GetChatManager():QueueCommand(1, '/ja "Corsair\'s Roll" <me>');
        return;
    elseif corbuff > 0 and (roll < 6 and roll ~= 5) and (CheckAbilityRecast('Double-Up') == 0) then
        AshitaCore:GetChatManager():QueueCommand(1, '/ja "Double-Up" <me>');
        return;
    end
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 1) and (args[1] == '/subcor') then
        toggle = not toggle;
        print('SubCor Auto Rolling is: ' .. tostring(toggle));
        return;
    end
end);

function CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);
            
			if (ability ~= nil and ability.Name[1] == check) then
				RecastTime = timer;
			end
		end
	end
	return RecastTime;
end