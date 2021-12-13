local manager = T{
};

local jobsabrv = T{'WAR','MNK','WHM','BLM','RDM','THF','PLD','DRK','BST','BRD','RNG','SAM','NIN','DRG','SMN','BLU','COR','PUP','DNC','SCH','GEO','RUN'};
local relics = T{'Spharai', 'Mandau', 'Excalibur', 'Ragnarok', 'Guttler', 'Bravura', 'Apocalypse', 'Gungnir', 'Kikoku', 'Amanomurakumo', 'Mjollnir', 'Claustrum', 'Yoichinoyumi', 'Annihilator', 'Gjallarhorn', 'Aegis' };
local mythics = T{'Verethragna', 'Twashtar', 'Almace', 'Caladbolg', 'Farsha', 'Ukonvasara', 'Redemption', 'Rhongomiant', 'Kannagi', 'Masamune', 'Gambanteinn', 'Hvergelmir', 'Gandiva', 'Armageddon', };
local empys = T{'Verethragna', 'Twashtar', 'Almace', 'Caladbolg', 'Farsha', 'Ukonvasara', 'Redemption', 'Rhongomiant', 'Kannagi', 'Masamune', 'Gambanteinn', 'Hvergelmir', 'Gandiva', 'Armageddon', 'Daurdabla', 'Ochain' };
local aeonics = T{'Verethragna', 'Twashtar', 'Almace', 'Caladbolg', 'Farsha', 'Ukonvasara', 'Redemption', 'Rhongomiant', 'Kannagi', 'Masamune', 'Gambanteinn', 'Hvergelmir', 'Gandiva', 'Armageddon', };
local dynastage2 = {'Militant Knuckles', 'Malefic Dagger', 'Glyptic Sword', 'Gilded Blade', 'Leonine Axe', 'Agonal Bhuj', 'Memento Scythe', 'Hotspur Lance', 'Mimizuku', 'Hayatemaru', 'Battering Maul', 'Sage\'s Staff', 'Wolver Bow', 'Marksman Gun', 'Pyrrhic Horn', 'Bulwark Shield' };
local dynastage3 = {'Dynamis Knuckles', 'Dynamis Dagger', 'Dynamis Sword', 'Dynamis Blade', 'Dynamis Axe', 'Dynamis Bhuj', 'Dynamis Scythe', 'Dynamis Lance', 'Rogetsu', 'Oboromaru', 'Dynamis Maul', 'Dynamis Staff', 'Dynamis Bow', 'Dynamis Gun', 'Dynamis Horn', 'Dynamis Shield' };
local dynastage4 = {'Caestus', 'Batardeau', 'Caliburn', 'Valhalla', 'Ogre Killer', 'Abaddon Killer', 'Bec de Faucon', 'Gae Assail', 'Yoshimitsu', 'Totsukanotsurugi', 'Gullintani', 'Thyrus', 'Futatokoroto', 'Ferdinand', 'Millennium Horn', 'Ancile' };


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

function manager.UpdateEmpyreanWeapons()
    local t = T{};

    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for n = 1, #empys do
                if (item.Name[1] == (empys[n])) then
                    local check = false;
                    check = manager.CheckWeapon(x);
                    t:append({ x, item.Name[1], check });
                end
            end
            interface.data.ids.weapons.empyrean:merge(t, true);
        end
    end
end

function manager.UpdateRelicWeapons()
    local t = T{};

    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for n = 1, #relics do
                if (item.Name[1] == (relics[n])) then
                    local check = false;
                    check = manager.CheckWeapon(x);
                    t:append({ x, item.Name[1], check });
                end
            end
            interface.data.ids.weapons.relic:merge(t, true);
        end
    end
end

function manager.UpdateDynaWeapons()
    local t = T{};
    local u = T{};
    local v = T{};

    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for n = 1, #dynastage2 do
                if (item.Name[1] == (dynastage2[n])) then
                    local check = false;
                    check = manager.CheckWeapon(x);
                    t:append({ x, item.Name[1], check });
                end
            end
            interface.data.ids.weapons.dynastage2:merge(t, true);

            for n = 1, #dynastage3 do
                if (item.Name[1] == (dynastage3[n])) then
                    local check = false;
                    check = manager.CheckWeapon(x);
                    u:append({ x, item.Name[1], check });
                end
            end
            interface.data.ids.weapons.dynastage3:merge(u, true);

            for n = 1, #dynastage4 do
                if (item.Name[1] == (dynastage4[n])) then
                    local check = false;
                    check = manager.CheckWeapon(x);
                    v:append({ x, item.Name[1], check });
                end
            end
            interface.data.ids.weapons.dynastage4:merge(v, true);
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

function manager.DisplayEmpyreans()
    for n=1, #empys do
        local weapon = empys[n];;
        local stage = 0;
        local ochain = false;
        local harp = false;

        if weapon == 'Daurdabla' then
            imgui.TableNextRow(ImGuiTableRowFlags_Headers);
            imgui.TableNextColumn();
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Complete');
            imgui.TableNextColumn();imgui.TableNextColumn();imgui.TableNextColumn();imgui.TableNextColumn();
        end
        
        imgui.TableNextRow();imgui.TableNextColumn();imgui.TextColored(colors.header, weapon);
        
        -- skip 300 rift stage and very stupid SE stuff for shield/harp/ranged IDs
        for w=1, #interface.data.ids.weapons.empyrean do
            if weapon == 'Daurdabla' and interface.data.ids.weapons.empyrean[w][2] == weapon then
                stage = stage + 1;

                if stage < 5 and stage ~= 1 then
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.empyrean[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    else
                    local fwdcount = false;
                        for y = 1, #interface.data.ids.weapons.empyrean do
                            if (interface.data.ids.weapons.empyrean[y][3] == true and interface.data.ids.weapons.empyrean[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        end
                    end
                elseif stage == 1 and interface.data.ids.weapons.empyrean[w][3] == true then harp = true;
                elseif stage == 5 then
                    imgui.TableNextColumn();
                    if harp == true then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    else
                        imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    end
                end
            elseif weapon == 'Ochain' and interface.data.ids.weapons.empyrean[w][2] == weapon then
                stage = stage + 1;

                if stage < 5 and stage ~= 1 then
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.empyrean[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    else
                    local fwdcount = false;
                        for y = 1, #interface.data.ids.weapons.empyrean do
                            if (interface.data.ids.weapons.empyrean[y][3] == true and interface.data.ids.weapons.empyrean[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        end
                    end
                elseif stage == 1 and interface.data.ids.weapons.empyrean[w][3] == true then ochain = true;
                elseif stage == 5 then
                    imgui.TableNextColumn();
                    if ochain == true then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    else
                        imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    end
                end
            elseif (interface.data.ids.weapons.empyrean[w][2] == weapon) then
                stage = stage + 1;
                
                if stage ~= 6 and stage < 10 then 
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.empyrean[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                    else
                    local fwdcount = false;
                        for y = w, #interface.data.ids.weapons.empyrean do
                            if (interface.data.ids.weapons.empyrean[y][3] == true and interface.data.ids.weapons.empyrean[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.empyrean[w][1]));
                        end
                    end
                end
            end
        end
    end
end

function manager.DisplayDynaStage2()
    for n = 1, #dynastage2 do
        local weapon = dynastage2[n];

        for w = 1, #interface.data.ids.weapons.dynastage2 do
            if (interface.data.ids.weapons.dynastage2[w][2] == weapon) then
                imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.dynastage2[w][1]));
            else
                imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.dynastage2[w][1]));
            end
        end
    end
end

function manager.DisplayRelics()
    for n=1, #relics do    
        local weapon = relics[n];
        local stage = 0;
        local aegis = false;
        local ghorn = false;
        -- skip 250 marrow stage and very stupid SE stuff for shield/horn/ranged IDs
        if weapon == 'Gjallarhorn' then
            imgui.TableNextRow(ImGuiTableRowFlags_Headers);
            imgui.TableNextColumn();
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 75');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 80');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Complete');
            imgui.TableNextColumn();imgui.TableNextColumn();imgui.TableNextColumn();
        end
        
        imgui.TableNextRow();imgui.TableNextColumn();imgui.TextColored(colors.header, weapon);

        for w = 1, #interface.data.ids.weapons.relic do
            if weapon == 'Gjallarhorn' and interface.data.ids.weapons.relic[w][2] == weapon then
                stage = stage + 1;
                
                if stage < 7 and stage ~= 2 then
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.relic[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                    else
                    local fwdcount = false;
                        for y = 1, #interface.data.ids.weapons.relic do
                            if (interface.data.ids.weapons.relic[y][3] == true and interface.data.ids.weapons.relic[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.relic[w][1]));
                        end
                    end
                elseif stage == 2 and interface.data.ids.weapons.relic[w][3] == true then ghorn = true;
                elseif stage == 7 then
                    imgui.TableNextColumn();
                    if ghorn == true then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                    else
                        imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.relic[w][1]));
                    end
                end
            elseif weapon == 'Aegis' and interface.data.ids.weapons.relic[w][2] == weapon then
                stage = stage + 1;

                if stage < 7 and stage ~= 1 then
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.relic[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                    else
                    local fwdcount = false;
                        for y = 1, #interface.data.ids.weapons.relic do
                            if (interface.data.ids.weapons.relic[y][3] == true and interface.data.ids.weapons.relic[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.relic[w][1]));
                        end
                    end
                elseif stage == 1 and interface.data.ids.weapons.relic[w][3] == true then aegis = true;
                elseif stage == 7 then
                    imgui.TableNextColumn();
                    if aegis == true then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                    else
                        imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.relic[w][1]));
                    end
                end
            elseif (interface.data.ids.weapons.relic[w][2] == weapon) then
                stage = stage + 1;
                if stage < 4 then
                    imgui.TableNextColumn();
                elseif stage ~= 7 and stage < 11 then
                    imgui.TableNextColumn();
                    if (interface.data.ids.weapons.relic[w][3] == true) then
                        imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                    else
                    local fwdcount = false;
                        for y = w, #interface.data.ids.weapons.relic do
                            if (interface.data.ids.weapons.relic[y][3] == true and interface.data.ids.weapons.relic[y][2] == weapon) then
                                fwdcount = true;
                            end
                        end
                        if fwdcount == true then
                            imgui.TextColored(colors.text1, tostring(interface.data.ids.weapons.relic[w][1]));
                        else
                            imgui.TextColored(colors.error, tostring(interface.data.ids.weapons.relic[w][1]));
                        end
                    end
                end
            end
        end
    end
end

return manager;