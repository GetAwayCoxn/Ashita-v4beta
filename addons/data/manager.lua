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

function manager.CountItem(id)
    local total = 0;
    for x = 0, 12 do
        for y = 0, 80 do
            local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and item.Id == id) then
                total = total + item.Count;
            end
        end
    end
    return total;
end


function manager.UpdateRelics()
    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for c = 1, #interface.data.weapons.relics[1] do
                for r = 2, #interface.data.weapons.relics do
                    if (item.Id == (interface.data.weapons.relics[r][c][1])) then
                        local check = false;
                        check = manager.CheckWeapon(x);
                        if (check == true) then
                            interface.data.weapons.relics[r][c] = {x, true, 0,0,0,};
                            for b = r -1, 2, -1 do
                            interface.data.weapons.relics[b][c] = {interface.data.weapons.relics[b][c][1], true, 0,0,0,};
                            end
                        end
                    end
                end
            end
        end
    end

    local bynes = 0;local bronze = 0;local shells = 0;local marrows = 0;local plutons = 0;local crystals = 0;
    local countbynes = 0;local countbronze = 0;local countshells = 0;local countmarrows = 0;local countplutons = 0;local countcrystals = 0;

    for r = 2, #interface.data.weapons.relics do --need to rebuild default relics tables to eliminate the double use of [3][4][5] values
        if (r < 7) then
            for i = 1, #interface.data.weapons.relics[r] do
                bynes = bynes + interface.data.weapons.relics[r][i][3];
                bronze = bronze + interface.data.weapons.relics[r][i][4];
                shells = shells + interface.data.weapons.relics[r][i][5];
            end
        else
            for i = 1, #interface.data.weapons.relics[r] do
                marrows = marrows + interface.data.weapons.relics[r][i][3];
                plutons = plutons + interface.data.weapons.relics[r][i][5];
                crystals = crystals + interface.data.weapons.relics[r][i][4]; -- whoops afterthought
            end
        end
    end

    countbynes = ( (10000 * manager.CountItem(1457)) + (100 * manager.CountItem(1456)) + (manager.CountItem(1455)) );
    countbronze = ( (10000 * manager.CountItem(1454)) + (100 * manager.CountItem(1453)) + (manager.CountItem(1452)) );
    countshells = ( (10000 * manager.CountItem(1457)) + (100 * manager.CountItem(1456)) + (manager.CountItem(1455)) );
    countmarrows = manager.CountItem(3502);
    countplutons = manager.CountItem(4509);
    countcrystals = manager.CountItem(9875);

    bynes = math.abs(bynes - countbynes);
    bronze = math.abs(bronze - countbronze);
    shells = math.abs(shells - countshells);
    marrows = math.abs(marrows - countmarrows);
    plutons = math.abs(plutons - countplutons);
    crystals = math.abs(crystals - countcrystals);

    interface.data.progress.relics = {bynes, bronze, shells, marrows, plutons, crystals};
end

function manager.DisplayRelics()
    imgui.TableNextRow();
    for c = 1, #interface.data.weapons.relics[1] do
        for r = 1, #interface.data.weapons.relics do
            if (interface.data.weapons.relics[r][c][1] == 'Gjallarhorn') then
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
                if (interface.data.weapons.relics[r][c][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.relics[r][c][1]));
                elseif (interface.data.weapons.relics[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.relics[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.relics[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (interface.data.weapons.relics[r][c][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.relics[r][c][1]));
                elseif (interface.data.weapons.relics[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.relics[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.relics[r][c][1]));
                end
            end
        end
    end
end

function manager.UpdateEmpyreans()
    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for c = 1, #interface.data.weapons.empyreans[1] do
                for r = 2, #interface.data.weapons.empyreans do
                    if (item.Id == (interface.data.weapons.empyreans[r][c][1])) then
                        local check = false;
                        check = manager.CheckWeapon(x);
                        if (check == true) then
                            interface.data.weapons.empyreans[r][c] = {x, true, 0,0,0,};
                            for b = r -1, 2, -1 do
                            interface.data.weapons.empyreans[b][c] = {interface.data.weapons.empyreans[b][c][1], true, 0,0,0,};
                            end
                        end
                    end
                end
            end
        end
    end

    local chloris = 0;local glavoid = 0;local briareus = 0;local cara = 0;local fistule = 0;local kukulkan = 0;local ironplates = 0;local ulhuadshi = 0;local itzpapalotl = 0;local sobek = 0;local lanterns = 0;local bukhis = 0;local sedna = 0;local souls = 0;local dragua = 0;local orthus = 0;local apademak = 0;local isgebind = 0;local alfard = 0;local orthus = 0;local azdaja = 0;local hmp = 0;local dross = 0;local cinder = 0;

    local countchloris = 0;local countglavoid = 0;local countbriareus = 0;local countcara = 0;local countfistule = 0;local countkukulkan = 0;local countironplates = 0;local countulhuadshi = 0;local countitzpapalotl = 0;local countsobek = 0;local countlanterns = 0;local countbukhis = 0;local countsedna = 0;local countsouls = 0;local countdragua = 0;local countorthus = 0;local countapademak = 0;local countisgebind = 0;local countalfard = 0;local countorthus = 0;local countazdaja = 0;local counthmp = 0;local countdross = 0;local countcinder = 0;

    for r = 2, #interface.data.weapons.empyreans do
        for i = 1, #interface.data.weapons.empyreans[r] do
            print ('R: ' .. r);
            print ('I: ' .. i);
            chloris = chloris + interface.data.weapons.empyreans[r][i][3];
            print (tostring(chloris) .. ' chloris');
            glavoid = glavoid + interface.data.weapons.empyreans[r][i][4];
            print (tostring(glavoid) .. ' glavoid');
            briareus = briareus + interface.data.weapons.empyreans[r][i][5];
            print (tostring(briareus) .. ' briareus');
            cara = cara + interface.data.weapons.empyreans[r][i][6];
            print (tostring(cara) .. ' cara');
            fistule = fistule + interface.data.weapons.empyreans[r][i][7];
            kukulkan = kukulkan + interface.data.weapons.empyreans[r][i][8];
            ironplates = ironplates + interface.data.weapons.empyreans[r][i][9];
            ulhuadshi = ulhuadshi + interface.data.weapons.empyreans[r][i][10];
            itzpapalotl = itzpapalotl + interface.data.weapons.empyreans[r][i][11];
            sobek = sobek + interface.data.weapons.empyreans[r][i][12];
            lanterns = lanterns + interface.data.weapons.empyreans[r][i][13];
            bukhis = bukhis + interface.data.weapons.empyreans[r][i][14];
            sedna = sedna + interface.data.weapons.empyreans[r][i][15];
            souls = souls + interface.data.weapons.empyreans[r][i][16];
            dragua = dragua + interface.data.weapons.empyreans[r][i][17];
            orthus = orthus + interface.data.weapons.empyreans[r][i][18];
            apademak = apademak + interface.data.weapons.empyreans[r][i][19];
            isgebind = isgebind + interface.data.weapons.empyreans[r][i][20];
            alfard = alfard + interface.data.weapons.empyreans[r][i][21];
            orthus = orthus + interface.data.weapons.empyreans[r][i][22];
            azdaja = azdaja + interface.data.weapons.empyreans[r][i][23];
            hmp = hmp + interface.data.weapons.empyreans[r][i][24];
            dross = dross + interface.data.weapons.empyreans[r][i][25];
            cinder = cinder + interface.data.weapons.empyreans[r][i][26];
        end
    end
    

    --countbynes = ( (10000 * manager.CountItem(1457)) + (100 * manager.CountItem(1456)) + (manager.CountItem(1455)) );

    --bynes = math.abs(bynes - countbynes);

    --interface.data.progress.empyreans = {bynes, bronze, shells, marrows, plutons, crystals};
end

function manager.DisplayEmpyreans()
    imgui.TableNextRow();
    for c = 1, #interface.data.weapons.empyreans[1] do
        for r = 1, #interface.data.weapons.empyreans do
            if (interface.data.weapons.empyreans[r][c][1] == 'Daurdabla') then
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base v2');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99 Glow');
                imgui.TableNextColumn();imgui.TextColored(colors.header, '');
                imgui.TableNextColumn();
                if (interface.data.weapons.empyreans[r][c][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.empyreans[r][c][1]));
                elseif (interface.data.weapons.empyreans[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.empyreans[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.empyreans[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (interface.data.weapons.empyreans[r][c][2] == 0) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.empyreans[r][c][1]));
                elseif (interface.data.weapons.empyreans[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.empyreans[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.empyreans[r][c][1]));
                end
            end
        end
    end
end

function manager.UpdateWeapons()
	manager.UpdateRelics();
    manager.UpdateEmpyreans();
end


return manager;