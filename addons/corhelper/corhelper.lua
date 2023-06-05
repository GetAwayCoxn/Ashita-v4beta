addon.name      = 'CORhelper';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Does COR things.';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local imgui = require('imgui');
local chat = require('chat');
local settingsLib = require('settings');

local defaults = T{
    is_open = {true,},
    size = {400,200},
    text_color = { 1.0, 0.75, 0.25, 1.0 },
    enabled = 'Disabled',
    menu_holders = {-1,-1,},
    firstSelectedRoll = nil;
    secondSelectedRoll = nil;
    stopOnLucky = {true,};
};
local settings = T{};
local towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',};
local rollsMenuList = 'None\0Chaos Roll\0Fighter\'s Roll\0Wizard\'s Roll\0Evoker\'s Roll\0Rogue\'s Roll\0Corsair\'s Roll\0Hunter\'s Roll\0Magus\'s Roll\0Healer\'s Roll\0Drachen Roll\0Choral Roll\0Monk\'s Roll\0Beast Roll\0Samurai Roll\0Warlock\'s Roll\0Puppet Roll\0Gallant\'s Roll\0Dancer\'s Roll\0Bolter\'s Roll\0Caster\'s Roll\0Tactician\'s Roll\0Miser\'s Roll\0Ninja Roll\0Scholar\'s Roll\0Allies\' Roll\0Companion\'s Roll\0Avenger\'s Roll\0Blitzer\'s Roll\0Courser\'s Roll\0Runeist\'s Roll\0Naturalist\'s Roll\0';
local rollsArray = {nil,'Chaos Roll','Fighter\'s Roll','Wizard\'s Roll','Evoker\'s Roll','Rogue\'s Roll','Corsair\'s Roll','Hunter\'s Roll','Magus\'s Roll','Healer\'s Roll','Drachen Roll','Choral Roll','Monk\'s Roll','Beast Roll','Samurai Roll','Warlock\'s Roll','Puppet Roll','Gallant\'s Roll','Dancer\'s Roll','Bolter\'s Roll','Caster\'s Roll','Tactician\'s Roll','Miser\'s Roll','Ninja Roll','Scholar\'s Roll','Allies\' Roll','Companion\'s Roll','Avenger\'s Roll','Blitzer\'s Roll','Courser\'s Roll','Runeist\'s Roll','Naturalist\'s Roll'};
local lastAttempt = os.time();
local time = lastAttempt;
local trySecond = false;

ashita.events.register('load', 'load_cb', function()
    settings = settingsLib.load(defaults);

    settingsLib.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            settings = s;
        end
        settingsLib.save();
    end);
end);

ashita.events.register('unload', 'unload_cb', function()
    settingsLib.save();
end);

ashita.events.register('d3d_present', 'present_cb', function ()
    local party = AshitaCore:GetMemoryManager():GetParty();
    local area = AshitaCore:GetResourceManager():GetString("zones.names", party:GetMemberZone(0));
    local player = AshitaCore:GetMemoryManager():GetPlayer();

     -- Force Disabled under these conditions
    if (player:GetIsZoning() ~= 0) or (area == nil) or (towns:contains(area)) or (player:GetMainJob() ~= 17 and player:GetSubJob() ~= 17) then 
		settings.enabled = 'Disabled';
	end

    -- Also force gui hide when zoning
    if (player:GetIsZoning() ~= 0) then
        return;
    end

    -- Do Roll things
    if settings.enabled == 'Enabled' then
        -- local tp = party:GetMemberTP(0);
        -- local my = GetEntity(party:GetMemberTargetIndex(0));
        -- if my.Status == 0 and (trySecond or tryThird) then
        --     print('Disengaged; resetting trys')
        --     trySecond = false;
        --     tryThird = false;
        
        if firstSelectedRoll then
            time = os.time() - lastAttempt;
            if time > 3 then
                if CheckBuff(firstSelectedRoll, player) == 0 then -- Roll not found
                    -- if (first and first ~= 'None') and not trySecond and not tryThird then
                    --     print('WS1 (' .. tostring(first) .. ') go!')
                    --     DoWS(first);
                    --     if second and second ~= 'None' then
                    --         trySecond = true;
                    --     end
                    -- elseif (second and second ~= 'None') and trySecond and not tryThird and time < 11 then
                    --     print('WS2 (' .. tostring(second) .. ') go!')
                    --     DoWS(second);
                    --     if third and third ~= 'None' then
                    --         tryThird = true;
                    --     end
                    --     trySecond = false;
                    -- elseif third and third ~= 'None' and tryThird and time < 9 then
                    --     print('WS3 (' .. tostring(third) .. ') go!')
                    --     DoWS(third);
                    --     tryThird = false;
                    -- elseif time > 11 then
                    --     print('Times Up! (' .. time .. ' secs) Resetting trys')
                    --     trySecond = false;
                    --     tryThird = false;
                    -- end
                end
            end
        end
    end

    -- Boolean catch for drawing things
    if (not settings.is_open[1]) then
        return;
    end

    --Draw things
    imgui.SetNextWindowSize(settings.size);
    if imgui.IsWindowHovered(ImGuiHoveredFlags_AnyWindow) then
        if imgui.IsMouseDoubleClicked(ImGuiMouseButton_Left) then
            settings.is_open[1] = not settings.is_open[1];
        end
    end
    if (imgui.Begin('CORhelper', settings.is_open, ImGuiWindowFlags_NoDecoration)) then
        local roll1 = {settings.menu_holders[1] + 1};
        if (imgui.Combo('Roll 1', roll1, rollsMenuList)) then
            settings.menu_holders[1] = roll1[1] - 1;
            firstSelectedRoll = rollsArray[roll1[1]+1];
        end
        local roll2 = {settings.menu_holders[2] + 1};
        if (imgui.Combo('Roll 2', roll2, rollsMenuList)) then
            settings.menu_holders[2] = roll2[1] - 1;
            secondSelectedRoll = rollsArray[roll2[1]+1];
        end
        imgui.Checkbox('Stop on lucky', settings.stopOnLucky);
        if (imgui.Button(settings.enabled)) then
            if (settings.enabled == 'Disabled') then
                settings.enabled = 'Enabled';
            else
                settings.enabled = 'Disabled';
            end
        end
        imgui.SameLine();
        -- imgui.SameLine();
        -- if (imgui.Button('Reset WS List')) then
        --     Message('WS List Reset');
        --     Reset(job);
        -- end
        -- if (imgui.Button('Rebuild WS Menus')) then
        --     RebuildMenu(job);
        --     Message('WS Menu Rebuilt');
        -- end
    end
    imgui.End();
end);

ashita.events.register('text_in', 'text_in_cb', function (e)
    if toggle then
        if e.message:contains('Corsair\'s Roll') and e.message:contains(me:GetMemberName(0)) then
            roll = tonumber(string.match(e.message,'%d+')) or 12;
        end
    end
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or (args[1] ~= '/corhelper') then
        return;
    end

    e.blocked = true;

    if #args == 1 then
        settings.is_open[1] = not settings.is_open[1];
    elseif #args >= 2 and args[2]:any('test') then
        TEST();
    end
end);

-- helpers
function Message(str)
    print(chat.header(addon.name) .. chat.message(tostring(str)));
end

-- Checks buffs and returns 0 if roll not found, -1 if you cant use JA's currently because of ailments etc, 
-- 1 if roll and double up is found, 2 if roll is found with no double up
function CheckBuff(rollString, player)
    local buffs = player:GetBuffs();
    local r = AshitaCore:GetResourceManager();
    local rollFound = false;
    local dblUpFound = false;
    for _, buff in pairs(buffs) do
        local buffString = r:GetString("buffs.names", buff);
        
        if buffString and ((buffString == 'Amnesia') or (buffString == 'Sleep') or (buffString == 'Charm') or (buffString == 'Terror') or (buffString == 'Petrification') or (buffString == 'Stun')) then
            return -1;
        elseif buffString and buffString == 'Mounted' then
            settings.enabled = 'Disabled';
            return -1;
        elseif buffString and buffString == rollString then
            rollFound = true;
        elseif buffString and buffString == 'Double-Up Chance' then
            dblUpFound = true;
        end
    end

    if rollFound then
        if dblUpFound then
            return 1
        end
        return 2
    end
    return 0
end

function DoWS(ws)
	if not ws then return end

    if ws == 'Myrkr' then
	    AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. ws .. '" <me>');
    else
        AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. ws .. '" <t>');
    end

    lastAttempt = os.time();
end

function TEST()
    -- settingsLib.reset()
end