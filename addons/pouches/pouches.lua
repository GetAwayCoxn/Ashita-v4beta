addon.name      = 'pouches';
addon.author    = 'getawaycoxn';
addon.version   = '1.0';
addon.desc      = 'Uses any silt and bead pouches in your inventory';
addon.link      = 'https://ashitaxi.com/';

require('common');
local active = false;
local past = ashita.time.qpc();
local current = ashita.time.qpc();
local frequency = ashita.time.qpf();
local inventory = AshitaCore:GetMemoryManager():GetInventory();
local silt = AshitaCore:GetResourceManager():GetItemByName('Silt Pouch',0);
local bead = AshitaCore:GetResourceManager():GetItemByName('Bead Pouch',0);
local silt_total = 0;
local bead_total = 0;

ashita.events.register('command', 'command_cb', function (e)
    -- Parse the command arguments..
    local args = e.command:args();
    if (#args == 0) then
        return;
    end
    if (args[1] ~= '/pouches') then
        return;
    end

    -- Block all related commands..
    e.blocked = true;

    if (#args == 1) or (args[2] == 'start') then
        active = true;
        count_pouches();
    end

    if (args[2] == 'stop') then
        active = false;
    end
end);

function count_pouches()
    for x = 0, 80, 1 do
        local item = inventory:GetContainerItem(0, x); -- 0 for main inventory container only
        if (item ~= nil and item.Id == silt.Id) then
            silt_total = silt_total + item.Count;
        end
    end

    for y = 0, 80, 1 do
        local item = inventory:GetContainerItem(0, y); -- 0 for main inventory container only
        if (item ~= nil and item.Id == bead.Id) then
            bead_total = bead_total + item.Count;
        end
    end
end

function use_silt()
    AshitaCore:GetChatManager():QueueCommand(1, '/item "Silt Pouch" <me>');
end

function use_bead(count)
    AshitaCore:GetChatManager():QueueCommand(1, '/item "Bead Pouch" <me>');
end

ashita.events.register('d3d_beginscene', 'beginscene_cb', function ()
    if (active == false) then return end;

    -- Obtain the current time info..
    current = ashita.time.qpc();

    -- Calculate the difference (in ms)..
    local delay = (current.q - past.q) * 1000.0 / frequency.q;

    -- Check if the delay time has passed..
    if (delay >= 5000.0) then
        last = current;

        if (silt_total > 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/item "Silt Pouch" <me>');
            print(silt_total .. ' Silt Pouches');
        elseif (bead_total > 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/item "Bead Pouch" <me>');
            print(bead_total .. ' Bead Pouches');
        else
            active = false;
        end
    end
end);