local manager = T{
};

local jobsabrv = T{'WAR','MNK','WHM','BLM','RDM','THF','PLD','DRK','BST','BRD','RNG','SAM','NIN','DRG','SMN','BLU','COR','PUP','DNC','SCH','GEO','RUN'};



function manager.UpdateJobs()  
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local jobleveltotal = 0.0;
    local JPspenttotal = 0.0;
    local masterleveltotal = 0.0;
    local joblevelmax = 99.0 * 22.0;
    local JPmax = 2100.0 * 22.0;
    local masterlevelmax = 20.0 * 22.0;
    local JPhastotal = 0.0;
    
    for n = 1, #jobsabrv do
        interface.data.jobs[n] = {player:GetJobLevel(n),player:GetJobPointsSpent(n),player:GetJobMasterLevel(n),player:GetJobPoints(n)};
    end

    for a = 1, #jobsabrv do
        jobleveltotal = jobleveltotal + player:GetJobLevel(a);
        JPspenttotal = JPspenttotal + player:GetJobPointsSpent(a);
        masterleveltotal = masterleveltotal + player:GetJobMasterLevel(a);
        if (player:GetJobPointsSpent(a) == 2100) then
            JPhastotal = JPhastotal + player:GetJobPoints(a);
        end
    end
    interface.data.progress.jobs = {(jobleveltotal / joblevelmax),(JPspenttotal / JPmax),(masterleveltotal / masterlevelmax),JPhastotal};
end

function manager.DisplayJobs()
    for n=1, #jobsabrv do
        imgui.TableNextRow();imgui.TableNextColumn();imgui.TextColored(colors.header, jobsabrv[n]);
            for x = 1, 4 do 
                local t = T{};
                imgui.TableNextColumn();
                t:merge(interface.data.jobs[n], true);
                imgui.Text(tostring(t[x]));
            end
    end
end


function manager.CheckWeapon(id)  
    local inventory = AshitaCore:GetMemoryManager():GetInventory();
    local total = 0;

    for x = 0, 12 do
        for y = 0, 80 do
            local item = inventory:GetContainerItem(x, y);
            if (item ~= nil and item.Id == id) then
                total = total + item.Count;
            end
        end
    end
    if total ~= 0 then return true;
    else return false end
end

function manager.UpdateRelics()
    --[[local t = T{};
    local key = '';

    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for n = 1, #interface.data.weapons.relics do
                for m = 2, #interface.data.weapons.relics[n] do
                    if (item.Id[1] == (interface.data.weapons.relics[n][m])) then
                        local check = false;
                        check = manager.CheckWeapon(x);
                        t:append({ x, item.Name[1], check });
                    end
                end
            end
            interface.data.acquired.weapons.relics:merge(t, true);




    for n = 1, #interface.data.weapons.relics do
        for m = 1, #interface.data.weapons.relics[n] do
            if (m == 1) then
                key = interface.data.weapons.relics[m];
            else
                local o = m - 1;
                interface.data.acquired.weapons.relics[key][o] = manager.CheckWeapon(m);
            end
        end
    end]]

    local t = T{};
    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for n = 1, #interface.data.weapons.relics[1] do
                for m = 2, #interface.data.weapons.relics do
                    if (item.Id[1] == (interface.data.weapons.relics[m])) then
                        local check = false;
                        check = manager.CheckWeapon(x);
                        t:append({ x, check });
                    end
                end
                interface.data.weapons.relics[n]:merge(t, true);
            end
        end
    end
end

function manager.DisplayRelics()
    imgui.TableNextRow();
    for m = 1, #interface.data.weapons.relics[1] do
        for n = 1, #interface.data.weapons.relics do
            if (interface.data.weapons.relics[n][m][1] == 'Gjallarhorn') then
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base Wep');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 2');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 3');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 4');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 75');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 80');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                imgui.TableNextColumn();
                if (interface.data.weapons.relics[n][m][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.relics[n][m][1]));
                elseif (interface.data.weapons.relics[n][m][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.relics[n][m][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.relics[n][m][1]));
                end
            else
                imgui.TableNextColumn();
                if (interface.data.weapons.relics[n][m][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.relics[n][m][1]));
                elseif (interface.data.weapons.relics[n][m][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.relics[n][m][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.relics[n][m][1]));
                end
            end
        end
    end
end

return manager;