addon.name      = 'nomnom';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.00';
addon.desc      = 'Eats food.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local imgui = require('imgui');

local settings = {
    is_open = {true,},
    size = {400,100},
    text_color = { 1.0, 0.75, 0.25, 1.0 },
    enabled = 'Disabled',
    update = 'Update Foods',
    runes = {{'Ignis',0},{'Gelus',0},{'Flabra',0},{'Tellus',0},{'Sulpor',0},{'Unda',0},{'Lux',0},{'Tenebrae',0}},
    menu_holder = {-1,},
    pulse = {70,},
    list = 'None\0';
    foods = {};
};
local Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',
};

ashita.events.register('d3d_present', 'present_cb', function ()
    local Area = AshitaCore:GetResourceManager():GetString("zones.names", AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0));
    local Player = AshitaCore:GetMemoryManager():GetPlayer();

    -- Force Disabled under these conditions
    if (Player:GetIsZoning() ~= 0) or (Area == nil) or (Towns:contains(Area)) then 
		settings.enabled = 'Disabled';
	end

    -- Also force gui hide when zoning
    if (Player:GetIsZoning() ~= 0) then
        return;
    end

    -- Do Work here if Enabled and before the is_open check
    if (settings.enabled == 'Enabled') then
        
    end

    if (not settings.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize(settings.size);
    if (imgui.Begin('NomNom', settings.is_open, ImGuiWindowFlags_NoDecoration)) then
        imgui.TextColored(settings.text_color, '           Nom Nom !');
        imgui.ShowHelp('Long story short, some non-food items might show up here for now, so just like, don\'t select that stuff?');
        imgui.Spacing();
        local selection = {settings.menu_holder[1] + 1};
        if (imgui.Combo('', selection, settings.list)) then
            settings.menu_holder[1] = selection[1] - 1;
        end
        imgui.Spacing();imgui.Spacing();
        if (imgui.Button(settings.update)) then
            if (settings.update == 'Update Foods') then
                settings.update = 'Update Foods';
            else
                settings.update = 'Update Foods';
            end
            settings.food = FindFood();
        end
        imgui.ShowHelp('Foods update with button or when hiding/unhiding with /nn or /nomnom');
        imgui.SameLine();
        if (imgui.Button(settings.enabled)) then
            if (settings.enabled == 'Disabled') then
                settings.enabled = 'Enabled';
            else
                settings.enabled = 'Disabled';
            end
        end
        imgui.ShowHelp('Can use /nomnom toggle or /nn toggle as well');
    end
    imgui.End();
end);

function test()
	settings.food = FindFood();
end

function CountItemId(id)
    local total = 0;
    for i = 1, 81 do
        local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(0, i); --0 for actual inventory only
        if (item ~= nil and item.Id == id) then
            total = total + item.Count;
        end
    end
    return total;
end

function FindFood()
    local foods = T{};
    local list = 'None\0';
    for i = 1, 81 do
        local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(0, i); --0 for actual inventory only
        if (item ~= nil) then
            local check = AshitaCore:GetResourceManager():GetItemById(item.Id);
            if check ~= nil and check.Flags == 1548 then
                foods[#foods + 1] = {check.Name[1],item.Count};
                list = list .. check.Name[1] .. '\0';
            end
        end
    end
    settings.list = list;
    return foods;
end

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/nomnom') and (args[1] ~= '/nn')) then
        return;
    end

    e.blocked = true;

    if (#args <= 1) then
        settings.is_open[1] = not settings.is_open[1];
        settings.food = FindFood();
    elseif (args[2]:any('toggle')) then
        if (settings.enabled == 'Enabled') then
            settings.enabled = 'Disabled';
        elseif (settings.enabled == 'Disabled') then
            settings.enabled = 'Enabled';
        end
    else
        print(chat.header('NomNom'):append(chat.message('Invalid Command')));
    end
end);