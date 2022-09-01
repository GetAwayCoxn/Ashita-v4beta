addon.name      = 'GaolCheck';
addon.author    = 'Thorny';
addon.version   = '1.0';
addon.desc      = 'Prints the status of Sheol - Gaol equipment.';
addon.link      = 'https://github.com/ThornyFFXI/';

require('common');
chat = require('chat');

local equipment = {
    23761,
    23768,
    23775,
    23782,
    23789,
    23755,
    23762,
    23769,
    23776,
    23783,
    23756,
    23763,
    23770,
    23777,
    23784,
    23757,
    23764,
    23771,
    23778,
    23785,
    23759,
    23766,
    23773,
    23780,
    23787,
    23760,
    23767,
    23774,
    23781,
    23788,
    23758,
    23765,
    23772,
    23779,
    23786,
    26218,
    26116,
    26362,
    26363,
    21430,
    21432,
    21433,
    21431
};
local weapons = {
    21723,
    21884,
    21567,
    22150,
    21527,
    21637,
    21675,
    21724,
    21832,
    21780,
    22041,
    22100,
    22151,
    21568,
    21926
};

local function GetItemRank(id)
    local inventoryManager = AshitaCore:GetMemoryManager():GetInventory();
    for i = 0,13,1 do
        for j = 1,80,1 do
            local containerItem = inventoryManager:GetContainerItem(i, j);
            if containerItem and containerItem.Id == id then
                local extData = containerItem.Extra;
                local augType = struct.unpack('B', extData, 1);
                if (augType == 2) or (augType == 3) then
                    local augFlag = struct.unpack('B', extData, 2);
                    if (augFlag == 131) then
                        local rankByte = struct.unpack('B', extData, 7);
                        local rank = ((rankByte % 128) - (rankByte % 4)) / 4;
                        return rank;
                    end
                end
                return 0;
            end    
        end
    end
    return -1;
end

local function PrintItem(id)
    local rank = GetItemRank(id);
    local resource = AshitaCore:GetResourceManager():GetItemById(id);
    if (rank == -1) then
        print(chat.header('GaolCheck') .. chat.error(resource.Name[1] .. ' not found.'));
    elseif (rank < 25) then
        print(chat.header('GaolCheck') .. chat.message(resource.Name[1] .. ': R' .. rank));
    else
        print(chat.header('GaolCheck') .. chat.color1(2, resource.Name[1] .. ': R' .. rank));
    end
end

for _,v in pairs(equipment) do
    PrintItem(v);
end

for _,v in pairs(weapons) do
    PrintItem(v);
end

AshitaCore:GetChatManager():QueueCommand(-1, '/addon unload GaolCheck');