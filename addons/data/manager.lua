local manager = T{ -- functions for data management
};

function manager.UpdateJobs()  
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local jobleveltotal = 0.0;
    local JPspenttotal = 0.0;
    local masterleveltotal = 0.0;
    local joblevelmax = 99.0 * 22.0;
    local JPmax = 2100.0 * 22.0;
    local masterlevelmax = 20.0 * 22.0;
    local JPhastotal = 0.0;
    
    for n = 1, #interface.data.jobsabrv do
        interface.data.jobs[n] = {player:GetJobLevel(n),player:GetJobPointsSpent(n),player:GetJobMasterLevel(n),player:GetJobPoints(n)};
    end

    for a = 1, #interface.data.jobsabrv do
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
    for n=1, #interface.data.jobsabrv do
        imgui.TableNextRow();imgui.TableNextColumn();imgui.TextColored(colors.header, interface.data.jobsabrv[n]);
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

function manager.CountItemId(id)
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

function manager.CountItemName(name)
    local total = 0;
    for x = 0, 12 do
        for y = 0, 80 do
            local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and item.Name == name) then
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
                            interface.data.weapons.relics[r][c] = {x,true,0,0,0,};
                            for b = r -1, 2, -1 do
                            interface.data.weapons.relics[b][c] = {interface.data.weapons.relics[b][c][1],true,0,0,0,};
                            end
                        end
                    end
                end
            end
        end
    end

    local bynes = 0;local bronze = 0;local shells = 0;local marrows = 0;local plutons = 0;local crystals = 0;
    local countbynes = 0;local countbronze = 0;local countshells = 0;local countmarrows = 0;local countplutons = 0;local countcrystals = 0;

    for r = 2, #interface.data.weapons.relics do --need to rebuild default relics tables to eliminate the double use of [3][4][5] values, this works but is very sloppy
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
                crystals = crystals + interface.data.weapons.relics[r][i][4]; -- careful of the keys here, again sloppy, need to rebuild the relic weapons arrays
            end
        end
    end

    countbynes = ( (10000 * manager.CountItemId(1457)) + (100 * manager.CountItemId(1456)) + (manager.CountItemId(1455)) );
    countbronze = ( (10000 * manager.CountItemId(1454)) + (100 * manager.CountItemId(1453)) + (manager.CountItemId(1452)) );
    countshells = ( (10000 * manager.CountItemId(1457)) + (100 * manager.CountItemId(1456)) + (manager.CountItemId(1455)) );
    countmarrows = manager.CountItemId(3502);
    countplutons = manager.CountItemId(4509);
    countcrystals = manager.CountItemId(9875);

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
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'SPECIALS');
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
                if (r == 1) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.relics[r][c][1]));
                elseif (interface.data.weapons.relics[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.relics[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.relics[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (r == 1) then
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
                            interface.data.weapons.empyreans[r][c] = {x,true,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
                            for b = r -1, 2, -1 do
                            interface.data.weapons.empyreans[b][c] = {interface.data.weapons.empyreans[b][c][1],true,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
                            end
                        end
                    end
                end
            end
        end
    end

    local chloris = 0;local glavoid = 0;local briareus = 0;local cara = 0;local fistule = 0;local kukulkan = 0;local ironplates = 0;local ulhuadshi = 0;local itzpapalotl = 0;local sobek = 0;local lanterns = 0;local bukhis = 0;local sedna = 0;local souls = 0;local dragua = 0;local orthus = 0;local apademak = 0;local isgebind = 0;local alfard = 0;local azdaja = 0;local hmp = 0;local dross = 0;local cinder = 0;local boulders = 0;local empycrystals = 0;

    for r = 2, #interface.data.weapons.empyreans do
        for i = 1, #interface.data.weapons.empyreans[r] do
            chloris = chloris + interface.data.weapons.empyreans[r][i][3];
            glavoid = glavoid + interface.data.weapons.empyreans[r][i][4];
            briareus = briareus + interface.data.weapons.empyreans[r][i][5];
            cara = cara + interface.data.weapons.empyreans[r][i][6];
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
            azdaja = azdaja + interface.data.weapons.empyreans[r][i][22];
            hmp = hmp + interface.data.weapons.empyreans[r][i][23];
            dross = dross + interface.data.weapons.empyreans[r][i][24];
            cinder = cinder + interface.data.weapons.empyreans[r][i][25];
            boulders = boulders + interface.data.weapons.empyreans[r][i][26];
            empycrystals = empycrystals + interface.data.weapons.empyreans[r][i][27];
        end
    end

    chloris = chloris - manager.CountItemId(2928);
    glavoid = glavoid - manager.CountItemId(2927);
    briareus = briareus - manager.CountItemId(2929);
    cara = cara - manager.CountItemId(2930);
    fistule = fistule - manager.CountItemId(2931);
    kukulkan = kukulkan - manager.CountItemId(2932);
    ironplates = ironplates - manager.CountItemId(3293);
    ulhuadshi = ulhuadshi - manager.CountItemId(2963);
    itzpapalotl = itzpapalotl - manager.CountItemId(2962);
    sobek = sobek - manager.CountItemId(2964);
    lanterns = lanterns - manager.CountItemId(2965);
    bukhis = bukhis - manager.CountItemId(2966);
    sedna = sedna - manager.CountItemId(2967);
    souls = souls - manager.CountItemId(3294);
    dragua = dragua - manager.CountItemId(3288);
    orthus = orthus - manager.CountItemId(3287);
    apademak = apademak - manager.CountItemId(3289);
    isgebind = isgebind - manager.CountItemId(3290);
    alfard = alfard - manager.CountItemId(3291);
    azdaja = azdaja - manager.CountItemId(3292);
    hmp = hmp - manager.CountItemId(3509);
    dross = dross - manager.CountItemId(3498);
    cinder = cinder - manager.CountItemId(3499);
    boulders = boulders - manager.CountItemId(4061);

    -- empycrystals is fucked up. need to count these sad cystals globally i think
    interface.data.progress.empyreans = {chloris, glavoid, briareus, cara, fistule,kukulkan, ironplates,ulhuadshi,itzpapalotl,sobek,lanterns,bukhis,sedna,souls,dragua,orthus,apademak,isgebind,alfard,azdaja,hmp,dross,cinder,boulders,empycrystals};
end

function manager.DisplayEmpyreans()
    imgui.TableNextRow();
    for c = 1, #interface.data.weapons.empyreans[1] do
        for r = 1, #interface.data.weapons.empyreans do
            if (interface.data.weapons.empyreans[r][c][1] == 'Daurdabla') then
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'SPECIALS');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base v2');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99 Glow');
                imgui.TableNextColumn();imgui.TextColored(colors.header, '');
                imgui.TableNextColumn();
                if (r == 1) then
                    imgui.TextColored(colors.header,tostring(interface.data.weapons.empyreans[r][c][1]));
                elseif (interface.data.weapons.empyreans[r][c][2] == true) then
                    imgui.TextColored(colors.text1,tostring(interface.data.weapons.empyreans[r][c][1]));
                else
                    imgui.TextColored(colors.error,tostring(interface.data.weapons.empyreans[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (r == 1) then
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

function manager.UpdateMythics()
    for x = 0, 65535 do
        local item = AshitaCore:GetResourceManager():GetItemById(x);
        if (item ~= nil and item.Name[1] ~= nil) then
            for c = 1, #interface.data.weapons.mythics[1] do
                for r = 2, #interface.data.weapons.mythics do
                    if (item.Id == (interface.data.weapons.mythics[r][c][1])) then
                        local check = false;
                        check = manager.CheckWeapon(x);
                        if (check == true) then
                            interface.data.weapons.mythics[r][c] = {x,true,0,0,0,0,0};
                            for b = r -1, 2, -1 do
                            interface.data.weapons.mythics[b][c] = {interface.data.weapons.mythics[b][c][1],true,0,0,0,0,0};
                            end
                        end
                    end
                end
            end
        end
    end

    local alex = 0;local scoria = 0;local beitetsu = 0;local bayld = 0;local crystals = 0;

    for r = 2, #interface.data.weapons.mythics do
        for i = 1, #interface.data.weapons.mythics[r] do
            alex = alex + interface.data.weapons.mythics[r][i][3];
            scoria = scoria + interface.data.weapons.mythics[r][i][4];
            beitetsu = beitetsu + interface.data.weapons.mythics[r][i][5];
            bayld = bayld + interface.data.weapons.mythics[r][i][6];
            crystals = crystals + interface.data.weapons.mythics[r][i][7];
        end
    end

    interface.data.progress.mythics = {alex, scoria, beitetsu, bayld, crystals};
end

function manager.DisplayMythics()
    imgui.TableNextRow();
    for c = 1, #interface.data.weapons.mythics[1] do
        for r = 1, #interface.data.weapons.mythics do
            imgui.TableNextColumn();
            if (r == 1) then
                imgui.TextColored(colors.header,tostring(interface.data.weapons.mythics[r][c][1]));
            elseif (interface.data.weapons.mythics[r][c][2] == true) then
                imgui.TextColored(colors.text1,tostring(interface.data.weapons.mythics[r][c][1]));
            else
                imgui.TextColored(colors.error,tostring(interface.data.weapons.mythics[r][c][1]));
            end
        end
    end
end

function manager.UpdateWeapons()
	manager.UpdateRelics();
    manager.UpdateEmpyreans();
    manager.UpdateMythics();
end

function manager.DisplayAmbuGear()
    imgui.TableNextRow();
    for a = 1, #interface.data.gear.ambu do
        for b = 1, 1 do
            imgui.TableNextColumn();
            if a == 1 then
                imgui.TextColored(colors.header,interface.data.gear.ambu[a][b]);
            else
                imgui.TextColored(colors.header,interface.data.gear.ambu[a][b]);
            end
        end
    end
end

function manager.UpdateGear()
	--manager.UpdateRelicGear();
    --manager.UpdateEmpyreans();
    --manager.UpdateMythics();
end


return manager;