addon.name      = 'VWhelper';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.00';
addon.desc      = 'Does VW related things.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local chat = require('chat');

-- defaults
local lastTimeCheck = os.time();
local active = true;
local towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',
};
local displacersHave = 0;
local displacersUse = 5; -- default displacers to use if any in inventory
local checkDisplacers = true;
local checkThirdParty = false;
local tryPop = true;
local usedDisplacers = false;

ashita.events.register('d3d_present', 'present_cb', function ()
    if not active then return; end

    local area = AshitaCore:GetResourceManager():GetString("zones.names", AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0));
    local player = AshitaCore:GetMemoryManager():GetPlayer();

    if not area or towns:contains(area) then
        active = false;
        return;
    end

    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    local myIndex = AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0);
	local my = GetEntity(myIndex);

    if target and target.Distance < 25 then
        if target.Name == 'Planar Rift' then
            if checkDisplacers then
                if displacersHave == 0 and tryPop then
                    usedDisplacers = false;
                    DoPop();
                    tryPop = false;
                elseif displacersHave >= displacersUse then
                    TradeDisplacers(displacersUse);
                    usedDisplacers = true;
                else
                    TradeDisplacers(displacersHave);
                    usedDisplacers = true;
                end
            end
        elseif target.Name == 'Riftworn Pyxis' then
            checkDisplacers = true;
            CheckDisplacers();
        end
    end

    --trying to deal with aggros
    if target and target.TargetIndex ~= myIndex then
		if my.Status == 0 and target.TargetedIndex == 0 and target.Status == 1 and os.time() - lastTimeCheck > 3 then
			AshitaCore:GetChatManager():QueueCommand(1, '/a <t>');
            lastTimeCheck = os.time();
		end
    end

    --trying to scootch forward if further than 4 yalms
    if target and target.Distance > 16 and my.Status == 1 then
        KeyPress('numpad8');
    end
end);

ashita.events.register('text_in', 'text_in_callback1', function (e)
    if not active then return; end

    if e.message:contains('Unable to see') or e.message:contains('You cannot see') then
		KeyPress('numpad2');
    elseif e.message:contains('Obtained') and e.message:contains('expending') and tryPop then
        tryPop = false;
        DoPop();
	end
end);

ashita.events.register('packet_in', '__settings_packet_in_cb', function (e)
    -- Packet: Zone Exit
    if (e.id == 0x000B) and checkThirdParty then
        AshitaCore:GetChatManager():QueueCommand(1, '/unload thirdparty');
        checkThirdParty = false;
    end
end);

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/vwhelper') and (args[1] ~= '/vw')) then
        return;
    end

    e.blocked = true;

    if (#args == 1) and ((args[1] == '/vwhelper') or (args[1] == '/vw')) then
        if not active then
            print(chat.header(addon.name) .. chat.message('Activated'));
            CheckDisplacers();
            local name = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
            AshitaCore:GetChatManager():QueueCommand(1, '/lw profile ' .. name);
            AshitaCore:GetChatManager():QueueCommand(1, '/load thirdparty');
            checkThirdParty = true;
        else
            print(chat.header(addon.name) .. chat.message('Deactivated'));
            if checkThirdParty then
                AshitaCore:GetChatManager():QueueCommand(1, '/unload thirdparty');
                checkThirdParty = false;
            end
        end
        active = not active;
    elseif (#args == 3) and (args[2] == 'use') then
        local use = tonumber(args[3]);
        if use > 0 and use <=5 then
            displacersUse = use;
        end
    elseif (#args == 2) and (args[2] == 'test') then
        DoPop();
    end
end);

function CheckDisplacers()
    local inventory = AshitaCore:GetMemoryManager():GetInventory();
    
    -- only search main inventory
    for bagSlot = 0, inventory:GetContainerCountMax(0), 1 do
        local itemEntry = inventory:GetContainerItem(0, bagSlot);
        if itemEntry then
            if itemEntry.Id == 3853 then
                displacersHave = itemEntry.Count;
                -- print(chat.header(addon.name) .. chat.message('Found Smoldering Lamp'));
            end
        end
    end
end

function TradeDisplacers(n)
    AshitaCore:GetChatManager():QueueCommand(1, '/bh tradenpc "Phase Displacer" ' .. n);
    checkDisplacers = false;
end

function KeyPress(key)
	AshitaCore:GetChatManager():QueueCommand(1, '/sendkey ' .. key .. ' down');
	local function KeyUp()
        AshitaCore:GetChatManager():QueueCommand(1, '/sendkey ' .. key .. ' up');
    end
    KeyUp:once(.3)
end

function DoPop()
    local function Enter()
        -- AshitaCore:GetChatManager():QueueCommand(1, '/sendkey RETURN down');
        KeyPress('RETURN');
    end
    local function Down()
        -- AshitaCore:GetChatManager():QueueCommand(1, '/sendkey RETURN down');
        KeyPress('DOWN');
    end
    local function Left()
        -- AshitaCore:GetChatManager():QueueCommand(1, '/sendkey LEFT down');
        KeyPress('LEFT');
    end
    local function Right()
        -- AshitaCore:GetChatManager():QueueCommand(1, '/sendkey RIGHT down');
        KeyPress('RIGHT');
    end
    local function Reset()
        tryPop = true;
    end

    Enter:once(0.5);
    Enter:once(1.5);
    Enter:once(2.5);
    Down:once(3.5);
    Enter:once(4.0);
    Left:once(4.5);
    Enter:once(5.0);
    if usedDisplacers then
        Right:once(5.5);
        Right:once(6.0);
        Enter:once(6.5);
    end
    Reset:once(8);
end

