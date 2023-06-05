interface = T{
    is_open = {false,},
    bg_alpha = 0.9,
    colors = {
        title = { 1.0, 0.65, 0.26, 0.9 },
        name = { 1.0, 1.0, 1.0, 0.9 },
        kihas = { 1.0, 1.0, 0.0, 0.9 },
        kidonthas = { .5, 0.0, 1.0, 0.9 },
        has = { 0.2, 0.9, 0.0, 0.9 },
        donthas = {0.5, 0.5, 0.5, 0.9 },
    },
    tradetime = os.time();
};
function interface.render()
    local party = AshitaCore:GetMemoryManager():GetParty();
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if (party:GetMemberIsActive(0) == 0 or party:GetMemberServerId(0) == 0) or player:GetIsZoning() ~= 0 then
        return;
    end
    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    
    if target ~= nil then
        if data.tradeitems:haskey(target.ServerId) and math.sqrt(target.Distance) < 5 and (os.time() - interface.tradetime > 3) then
            interface.tradetime = os.time()
            interface.dotrade();
        end
    end

    if  not interface.is_open[1] then
        return;
    end

    imgui.SetNextWindowSize({ 975, 615, });
    imgui.SetNextWindowBgAlpha(interface.bg_alpha);
    if imgui.IsWindowHovered(ImGuiHoveredFlags_AnyWindow) then
        if imgui.IsMouseDoubleClicked(ImGuiMouseButton_Left) then
            interface.is_open[1] = not interface.is_open[1];
        end
    end
    if (imgui.Begin('abyhelper', interface.is_open, ImGuiWindowFlags_NoDecoration)) then
        imgui.BeginChild('NmPane', { 960, 560 }, true);
            imgui.BeginChild('TinninPane', { 310, 540}, true);
                imgui.Indent(100.0);
                imgui.TextColored(interface.colors.title, 'TINNIN PATH');
                imgui.Separator();
            imgui.EndChild();
            imgui.SameLine();
            imgui.BeginChild('SarameyaPane', { 310, 540}, true);
                imgui.Indent(95.0);
                imgui.TextColored(interface.colors.title, 'SARAMEYA PATH');
                imgui.Indent(-95.0);
                imgui.Separator();
            imgui.EndChild();
            imgui.SameLine();
            imgui.BeginChild('TygerPane', { 310, 540}, true);
                imgui.Indent(110);
                imgui.TextColored(interface.colors.title, 'TYGER PATH');
                imgui.Indent(-110);
                imgui.Separator();
            imgui.EndChild();
        imgui.EndChild();
    end
    imgui.End();
end

function interface.kiprint(str)
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if player:HasKeyItem(data.keyitems[str]) then
        imgui.TextColored(interface.colors.kihas, str);
    else
        imgui.TextColored(interface.colors.kidonthas, str);
    end
end

function interface.update()
    for k,v in pairs(data.items.tinnin.t1) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tinnin.t1[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tinnin.t1[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tinnin.t2) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tinnin.t2[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tinnin.t2[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tinnin.t3) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tinnin.t3[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tinnin.t3[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tinnin.t4) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tinnin.t4[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tinnin.t4[k][4] = false;
                    end
                end
            end
        end
    end

    for k,v in pairs(data.items.sarameya.t1) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.sarameya.t1[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.sarameya.t1[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.sarameya.t2) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.sarameya.t2[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.sarameya.t2[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.sarameya.t3) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.sarameya.t3[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.sarameya.t3[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.sarameya.t4) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.sarameya.t4[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.sarameya.t4[k][4] = false;
                    end
                end
            end
        end
    end

    for k,v in pairs(data.items.tyger.t1) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tyger.t1[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tyger.t1[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tyger.t2) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tyger.t2[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tyger.t2[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tyger.t3) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tyger.t3[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tyger.t3[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.tyger.t4) do
        local count1 = 0;
        local count2 = 0;
        local str1 = v[1];
        local str2 = v[2];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        local trophy = AshitaCore:GetResourceManager():GetItemByName(str2, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[3] = true;
                    count1 = count1 +1;
                end
                if (trophy ~= nil and tempitem ~= nil and trophy.Id == tempitem.Id) then
                    v[4] = true;
                    count2 = count2 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.tyger.t4[k][3] = false;
                    end
                    if count2 == 0 then
                        data.items.tyger.t4[k][4] = false;
                    end
                end
            end
        end
    end
    for k,v in pairs(data.items.pw) do
        local count1 = 0;
        local str1 = v[1];
        local popitem = AshitaCore:GetResourceManager():GetItemByName(str1, 0);
        for x = 0, 16 do
            for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
                local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
                if (popitem ~= nil and tempitem ~= nil and popitem.Id == tempitem.Id) then
                    v[2] = true;
                    count1 = count1 +1;
                end
                if x == 16 and y == AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) then
                    if count1 == 0 then
                        data.items.pw[k][2] = false;
                    end
                end
            end
        end
    end
end

function interface.itemcheck(str)
    local item = AshitaCore:GetResourceManager():GetItemByName(str, 0);
    for x = 0, 1 do
        for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
            local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and tempitem ~= nil and item.Id == tempitem.Id) then
                return true;
            end
        end
    end
    
    return false;
end

function interface.dotrade()
    local target = GetEntity(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
    if target == nil then
        print(chat.header(addon.name) .. chat.message('Nothing targeted'));
        return;
    end

    for k,v in pairs(data.tradeitems) do
        if target.ServerId == k then
            if math.sqrt(target.Distance) > 6 then
                print(chat.header(addon.name) .. chat.message('Target is too far away'));
                return;
            else
                for _,item in pairs(v) do
                    if not interface.itemcheck(item) then
                        print(chat.header(addon.name) .. chat.message('Missing ' .. item .. ' in inventory'));
                    return;
                    end
                end
                if v:length() > 1 then
                    local itemList = ''
                    for i = 1, #v do
                        itemList = itemList .. '"' .. v[i] .. '"' .. ' 1 '
                    end
                    AshitaCore:GetChatManager():QueueCommand(1, '/bh tradenpc ' .. itemList);
                    print(chat.header(addon.name) .. chat.message('Trading Items'));
                    return;
                else
                    AshitaCore:GetChatManager():QueueCommand(1, '/item "' .. v[1] .. '" <t>');
                    print(chat.header(addon.name) .. chat.message('Trading ' .. v[1]));
                    return;
                end
            end
        end
    end
    print(chat.header(addon.name) .. chat.message('No Abyssea NM ??? targeted'));
end

function interface.comma_value(n) --credit--http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

return interface;