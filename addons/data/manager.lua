local modifind = require('modifind');
local manager = T{ -- functions for data management
    nuggets = true;
    gems = true;
    animas = true;
    matters = true;
    guilditemsgil = 0;
    plasm = 0;
};

function manager.UpdateJobs()  
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local jobleveltotal = 0.0;
    local JPspenttotal = 0.0;
    local masterleveltotal = 0.0;
    local joblevelmax = 99.0 * #defaults.jobsabrv;
    local JPmax = 2100.0 * #defaults.jobsabrv;
    local masterlevelmax = 30.0 * #defaults.jobsabrv;
    local JPhastotal = 0.0;
    
    for n = 1, #interface.defaults.jobsabrv do
        interface.defaults.jobs[n] = {player:GetJobLevel(n),player:GetJobPointsSpent(n),player:GetJobMasterLevel(n),player:GetJobPoints(n)};
    end

    for a = 1, #interface.defaults.jobsabrv do
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
    for n=1, #interface.defaults.jobsabrv do
        imgui.TableNextRow();imgui.TableNextColumn();imgui.TextColored(interface.colors.header, interface.defaults.jobsabrv[n]);
        for x = 1, 4 do 
            local t = T{};
            imgui.TableNextColumn();
            if (interface.defaults.jobs[n] ~= nil) then
                t:merge(interface.defaults.jobs[n], true);
                if ((x == 1) and (t[x] == 99)) or ((x == 2) and (t[x] == 2100)) or ((x == 3) and (t[x] == 30)) then
                    imgui.TextColored(interface.colors.text1, tostring(t[x]));
                else
                    imgui.Text(tostring(t[x]));
                end
                
            else
                imgui.Text('0');
            end
        end
    end
end

function manager.CheckItemId(id)
    local total = 0;

    for x = 0, 16 do
        for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
            local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and item.Id == id) then
                total = total + item.Count;
            end
        end
    end
    if total ~= 0 then return true;
    else return false end
end

function manager.CheckItemName(name)
    local total = 0;
    local tempitem = AshitaCore:GetResourceManager():GetItemByName(name, 0);
    if tempitem == nil then return end

    for x = 0, 16 do
        for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
            local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and tempitem ~= nil and item.Id == tempitem.Id) then
                total = total + item.Count;
            end
        end
    end
    if total ~= 0 then return true;
    else return false end
end

function manager.CountItemId(id)
    local total = 0;
    for x = 0, 16 do
        for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
            local item = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and item.Id == id) then
                total = total + item.Count;
            end
        end
    end
    return total;
end

function manager.UpdateRelics()
    for c = 1, #interface.defaults.weapons.relics[1] do
        for r = 2, (#interface.defaults.weapons.relics) do
            if (manager.CheckItemId(interface.defaults.weapons.relics[r][c][1])) then
                interface.defaults.weapons.relics[r][c] = {interface.defaults.weapons.relics[r][c][1],true,0,0,0,};
                for b = r -1, 2, -1 do
                interface.defaults.weapons.relics[b][c] = {interface.defaults.weapons.relics[b][c][1],true,0,0,0,};
                end
            end
        end
    end

    local bynes = 0;local bronze = 0;local shells = 0;local marrows = 0;local plutons = 0;local crystals = 0;
    local countbynes = 0;local countbronze = 0;local countshells = 0;local countmarrows = 0;local countplutons = 0;local countcrystals = 0;

    for r = 2, #interface.defaults.weapons.relics do --need to rebuild default relics tables to eliminate the double use of [3][4][5] values, this works but is very sloppy
        if (r < 7) then
            for i = 1, #interface.defaults.weapons.relics[r] do
                bynes = bynes + interface.defaults.weapons.relics[r][i][3];
                bronze = bronze + interface.defaults.weapons.relics[r][i][4];
                shells = shells + interface.defaults.weapons.relics[r][i][5];
            end
        else
            for i = 1, #interface.defaults.weapons.relics[r] do
                marrows = marrows + interface.defaults.weapons.relics[r][i][3];
                plutons = plutons + interface.defaults.weapons.relics[r][i][5];
                crystals = crystals + interface.defaults.weapons.relics[r][i][4]; -- careful of the keys here, again sloppy, need to rebuild the relic weapons arrays
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

    interface.data.progress.weapons.relics = {bynes, bronze, shells, marrows, plutons, crystals};
end

function manager.DisplayRelics()
    imgui.TableNextRow();
    for c = 1, #interface.defaults.weapons.relics[1] do
        for r = 1, #interface.defaults.weapons.relics do
            if (interface.defaults.weapons.relics[r][c][1] == 'Gjallarhorn') then
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'SPECIALS');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Base Wep');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 2');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 3');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 4');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 75');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 80');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 85');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 90');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 95');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99');
                imgui.TableNextColumn();
                if (r == 1) then
                    imgui.TextColored(interface.colors.header,tostring(interface.defaults.weapons.relics[r][c][1]));
                elseif (interface.defaults.weapons.relics[r][c][2] == true) then
                    imgui.TextColored(interface.colors.text1,tostring(interface.defaults.weapons.relics[r][c][1]));
                else
                    imgui.TextColored(interface.colors.error,tostring(interface.defaults.weapons.relics[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (r == 1) then
                    imgui.TextColored(interface.colors.header,tostring(interface.defaults.weapons.relics[r][c][1]));
                elseif (interface.defaults.weapons.relics[r][c][2] == true) then
                    imgui.TextColored(interface.colors.text1,tostring(interface.defaults.weapons.relics[r][c][1]));
                else
                    imgui.TextColored(interface.colors.error,tostring(interface.defaults.weapons.relics[r][c][1]));
                end
            end
        end
    end
end

function manager.UpdateEmpyreans()
    for c = 1, #interface.defaults.weapons.empyreans[1] do
        for r = 2, #interface.defaults.weapons.empyreans do
            if (manager.CheckItemId(interface.defaults.weapons.empyreans[r][c][1])) then
                interface.defaults.weapons.empyreans[r][c] = {interface.defaults.weapons.empyreans[r][c][1],true,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
                for b = r -1, 2, -1 do
                interface.defaults.weapons.empyreans[b][c] = {interface.defaults.weapons.empyreans[b][c][1],true,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
                end
            end
        end
    end

    local chloris = 0;local glavoid = 0;local briareus = 0;local cara = 0;local fistule = 0;local kukulkan = 0;local ironplates = 0;local ulhuadshi = 0;local itzpapalotl = 0;local sobek = 0;local lanterns = 0;local bukhis = 0;local sedna = 0;local souls = 0;local dragua = 0;local orthus = 0;local apademak = 0;local isgebind = 0;local alfard = 0;local azdaja = 0;local hmp = 0;local dross = 0;local cinder = 0;local boulders = 0;local empycrystals = 0;

    for r = 2, #interface.defaults.weapons.empyreans do
        for i = 1, #interface.defaults.weapons.empyreans[r] do
            chloris = chloris + interface.defaults.weapons.empyreans[r][i][3];
            glavoid = glavoid + interface.defaults.weapons.empyreans[r][i][4];
            briareus = briareus + interface.defaults.weapons.empyreans[r][i][5];
            cara = cara + interface.defaults.weapons.empyreans[r][i][6];
            fistule = fistule + interface.defaults.weapons.empyreans[r][i][7];
            kukulkan = kukulkan + interface.defaults.weapons.empyreans[r][i][8];
            ironplates = ironplates + interface.defaults.weapons.empyreans[r][i][9];
            ulhuadshi = ulhuadshi + interface.defaults.weapons.empyreans[r][i][10];
            itzpapalotl = itzpapalotl + interface.defaults.weapons.empyreans[r][i][11];
            sobek = sobek + interface.defaults.weapons.empyreans[r][i][12];
            lanterns = lanterns + interface.defaults.weapons.empyreans[r][i][13];
            bukhis = bukhis + interface.defaults.weapons.empyreans[r][i][14];
            sedna = sedna + interface.defaults.weapons.empyreans[r][i][15];
            souls = souls + interface.defaults.weapons.empyreans[r][i][16];
            dragua = dragua + interface.defaults.weapons.empyreans[r][i][17];
            orthus = orthus + interface.defaults.weapons.empyreans[r][i][18];
            apademak = apademak + interface.defaults.weapons.empyreans[r][i][19];
            isgebind = isgebind + interface.defaults.weapons.empyreans[r][i][20];
            alfard = alfard + interface.defaults.weapons.empyreans[r][i][21];
            azdaja = azdaja + interface.defaults.weapons.empyreans[r][i][22];
            hmp = hmp + interface.defaults.weapons.empyreans[r][i][23];
            dross = dross + interface.defaults.weapons.empyreans[r][i][24];
            cinder = cinder + interface.defaults.weapons.empyreans[r][i][25];
            boulders = boulders + interface.defaults.weapons.empyreans[r][i][26];
            empycrystals = empycrystals + interface.defaults.weapons.empyreans[r][i][27];
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
    interface.data.progress.weapons.empyreans = {chloris, glavoid, briareus, cara, fistule,kukulkan, ironplates,ulhuadshi,itzpapalotl,sobek,lanterns,bukhis,sedna,souls,dragua,orthus,apademak,isgebind,alfard,azdaja,hmp,dross,cinder,boulders,empycrystals};
end

function manager.DisplayEmpyreans()
    imgui.TableNextRow();
    for c = 1, #interface.defaults.weapons.empyreans[1] do
        for r = 1, #interface.defaults.weapons.empyreans do
            if (interface.defaults.weapons.empyreans[r][c][1] == 'Daurdabla') then
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'SPECIALS');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Base');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Base v2');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 85');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 90');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 95');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99 Glow');
                imgui.TableNextColumn();imgui.TextColored(interface.colors.header, '');
                imgui.TableNextColumn();
                if (r == 1) then
                    imgui.TextColored(interface.colors.header,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                elseif (interface.defaults.weapons.empyreans[r][c][2] == true) then
                    imgui.TextColored(interface.colors.text1,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                else
                    imgui.TextColored(interface.colors.error,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                end
            else
                imgui.TableNextColumn();
                if (r == 1) then
                    imgui.TextColored(interface.colors.header,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                elseif (interface.defaults.weapons.empyreans[r][c][2] == true) then
                    imgui.TextColored(interface.colors.text1,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                else
                    imgui.TextColored(interface.colors.error,tostring(interface.defaults.weapons.empyreans[r][c][1]));
                end
            end
        end
    end
end

function manager.UpdateMythics()
    for c = 1, #interface.defaults.weapons.mythics[1] do
        for r = 2, #interface.defaults.weapons.mythics do
            if (manager.CheckItemId(interface.defaults.weapons.mythics[r][c][1])) then
                interface.defaults.weapons.mythics[r][c] = {interface.defaults.weapons.mythics[r][c][1],true,0,0,0,0,0};
                for b = r -1, 2, -1 do
                interface.defaults.weapons.mythics[b][c] = {interface.defaults.weapons.mythics[b][c][1],true,0,0,0,0,0};
                end
            end
        end
    end

    local alex = 0;local scoria = 0;local beitetsu = 0;local bayld = 0;local crystals = 0;

    for r = 2, #interface.defaults.weapons.mythics do
        for i = 1, #interface.defaults.weapons.mythics[r] do
            alex = alex + interface.defaults.weapons.mythics[r][i][3];
            scoria = scoria + interface.defaults.weapons.mythics[r][i][4];
            beitetsu = beitetsu + interface.defaults.weapons.mythics[r][i][5];
            bayld = bayld + interface.defaults.weapons.mythics[r][i][6];
            crystals = crystals + interface.defaults.weapons.mythics[r][i][7];
        end
    end

    interface.data.progress.weapons.mythics = {alex, scoria, beitetsu, bayld, crystals};
end

function manager.DisplayMythics()
    imgui.TableNextRow();
    for c = 1, #interface.defaults.weapons.mythics[1] do
        for r = 1, #interface.defaults.weapons.mythics do
            imgui.TableNextColumn();
            if (r == 1) then
                imgui.TextColored(interface.colors.header,tostring(interface.defaults.weapons.mythics[r][c][1]));
            elseif (interface.defaults.weapons.mythics[r][c][2] == true) then
                imgui.TextColored(interface.colors.text1,tostring(interface.defaults.weapons.mythics[r][c][1]));
            else
                imgui.TextColored(interface.colors.error,tostring(interface.defaults.weapons.mythics[r][c][1]));
            end
        end
    end
end

function manager.UpdateAmbuWeps()
    for a = 1, #interface.defaults.weapons.ambu do
        local count = 1;
        if interface.data.progress.weapons.ambu[a][1] == #interface.defaults.weapons.ambu[a] then
            count = #interface.defaults.weapons.ambu[a] + 1;
        elseif interface.data.progress.weapons.ambu[a][1] == 0 then
        else count = interface.data.progress.weapons.ambu[a][1] end
        for b = count, #interface.defaults.weapons.ambu[a] do
            if (modifind.search(interface.defaults.weapons.ambu[a][b])) then
                interface.data.progress.weapons.ambu[a][1] = b;
            end
        end
    end
end

function manager.DisplayAmbuWeps()
    imgui.Spacing();imgui.Spacing();
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'WEAPONS');
    for a = 1, #interface.data.progress.weapons.ambu do
        imgui.TableNextColumn();
        local temp = {interface.data.progress.weapons.ambu[a][1]};
        if (imgui.Combo(interface.data.progress.weapons.ambu[a][2], temp, 'None\0Tokko\0Ajja\0Eletta\0Kaja\0Complete\0')) then
            interface.data.progress.weapons.ambu[a][1] = temp[1];
        end
    end
end

function manager.DisplayAmbuWepsNeed()
    local items = T{0,0,0,0,0,0}; --voucher,nugget,gem,anima,matter,pulse,

    for a = 1, #interface.data.progress.weapons.ambu do
        if (interface.data.progress.weapons.ambu[a][1] < 5) then
            items[6] = items[6] + 1;
            items[5] = items[5] + 5;
        end
        if (interface.data.progress.weapons.ambu[a][1] < 4) then
            items[4] = items[4] + 5;
        end
        if (interface.data.progress.weapons.ambu[a][1] < 3) then
            items[3] = items[3] + 5;
        end
        if (interface.data.progress.weapons.ambu[a][1] < 2) then
            items[2] = items[2] + 5;
        end
        if (interface.data.progress.weapons.ambu[a][1] < 1) then
            items[1] = items[1] + 1;
        end
    end

    imgui.Spacing();imgui.Spacing();
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'NEEDED:');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Vouchers');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Nuggets');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Gems:');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Animas');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Matters');
    imgui.TableNextColumn();

    for b = 1, (#items -1) do
        imgui.TableNextColumn();
        imgui.Text(tostring(items[b]));
    end
    local pulsecount = 0;
    for i = 1, #interface.defaults.weapons.pulse do
        pulsecount = pulsecount + manager.CountItemId(interface.defaults.weapons.pulse[i]);
    end
    if (pulsecount > items[6]) then
        items[6] = 0
    else
        items[6] = items[6] - pulsecount;
    end
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Need Pulse Weapons:  ');
    imgui.TableNextColumn();imgui.Text(tostring(items[6]));

    interface.data.progress.weapons.ambuWepItems = items:merge(items, true);
end

function manager.UpdateWeapons()
	manager.UpdateRelics();
    manager.UpdateEmpyreans();
    manager.UpdateMythics();
    manager.UpdateAmbuWeps();
end

function manager.UpdateAFGear()
    local countgear = 0;
    local totalgear = #interface.defaults.gear.af * #interface.defaults.gear.af[1] * #interface.defaults.gear.af[1][1];

    for a = 1, (#interface.defaults.gear.af - 1) do
        for b = 1, #interface.defaults.gear.af[a] do
            local count = 1;
            if interface.data.progress.gear.af[a][b][1] == #interface.defaults.gear.af[a][b] then
                count = #interface.defaults.gear.af[a][b] + 1;
            elseif interface.data.progress.gear.af[a][b][1] == 0 then
            else count = interface.data.progress.gear.af[a][b][1] end
            for c = count, #interface.defaults.gear.af[a][b] do
                if (modifind.search(interface.defaults.gear.af[a][b][c])) then
                    interface.data.progress.gear.af[a][b][1] = c;
                elseif (a == (#interface.defaults.gear.af - 1)) then
                    if (modifind.search(interface.defaults.gear.af[#interface.defaults.gear.af][b][c])) then --checking female DNC AF
                        interface.data.progress.gear.af[19][b][1] = c;
                    end
                end
            end
            countgear = countgear + interface.data.progress.gear.af[a][b][1];
        end
    end

    interface.data.progress.gear.afProgress[1] = (totalgear-countgear)/totalgear;
    manager.CountAFGear();
end

function manager.CountAFGearInv(items)
    if items == nil then return end
    local chap1 = 0;local chap2 = 0;local slot1 = 0;local slot2 = 0;local slot3 = 0;
    
    for y=1, #items[1] do
        if y == 1 then -- set IDs for some of the variables
            chap1 = 4064;
            chap2 = 4069;
            slot1 = 844;
            slot2 = 8720;
            slot3 = 8983;
        elseif y == 2 then
            chap1 = 4065;
            chap2 = 4070;
            slot1 = 837;
            slot2 = 8722;
            slot3 = 8986;
        elseif y == 3 then
            chap1 = 4066;
            chap2 = 4071;
            slot1 = 1110;
            slot2 = 8724;
            slot3 = 8979;
        elseif y == 4 then
            chap1 = 4067;
            chap2 = 4072;
            slot1 = 836;
            slot2 = 8726;
            slot3 = 8988;
        elseif y == 5 then
            chap1 = 4068;
            chap2 = 4073;
            slot1 = 1311;
            slot2 = 8728;
            slot3 = 8981;
        end
        items[1][y][1] = 0 - manager.CountItemId(chap1); --countchapt 1-5
        items[2][y][1] = 0 - manager.CountItemId(chap2); --countchapt 6-10
        items[1][y][2] = 0 - manager.CountItemId(slot1); --count 109slot
        items[2][y][2] = 0 - manager.CountItemId(slot2); --count 1191slot
        items[3][y][1] = 0 - manager.CountItemId(slot3); --count 1192slot
    end

    local checks1 = {0,0,855,823,2340,2288,1699,752,664,657}; -- lv109 extra items in order of default array: blank,blank,tiger leather,gold thread,imp.silk cloth,karakul cloth,scarlet linen,gold sheet,DS sheet,Tama Hagane
    local checks2 = {0,0,862,2476,1132,2200,1313,668,758,658}; -- lv119+1 extra items in order of default array: blank,blank,behe leather, plat silk thread, raxa, twill damask, siren's hair, ori sheet, durium sheet, dama. ingot
    for i = 3, #items[1][1] do
        items[1][1][i] = 0 - manager.CountItemId(checks1[i]);
        items[2][1][i] = 0 - manager.CountItemId(checks2[i]);
    end

    local checks3 = {0,9253,9245,9251,9257,9255,9249,9247};-- lv119+1 extra items in order of default array: blank,S.Faulpie Leather,Cypress Log,Khoma Thread,Azure Leaf,Cyan Coral,Ruthenium Ore,Niobium Ore,
    for i = 3, #items[3][1] do
        items[3][1][i] = 0 - manager.CountItemId(checks3[i]);
    end

    local checks4 = {9303,9305,9304,9307,9306,9253,9245,9246,9251,9252,9258,9256,9250,9248,9254};-- lv119+1 extra items in order of default array: kin,kei,gin,fu,kyou,S.Faulpie Leather,Cypress Log,cypress Lbr,Khoma Thread,khoma cloth,Azure Cermet,Cyan Orb,Ruthenium Ingot,Niobium Ingot,Faulpie Leather
    for i = 3, #items[4][1] do
        items[4][1][i] = 0 - manager.CountItemId(checks4[i]);
    end

    return items;
end

function manager.CountAFGear()
    local cards = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    interface.data.progress.gear.afneed = {
        {{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}}, 
    };
    interface.data.progress.gear.afneed = manager.CountAFGearInv(interface.data.progress.gear.afneed);

    for x = 1, #interface.data.progress.gear.af do
        for y = 1, #interface.data.progress.gear.af[x] do
            if interface.data.progress.gear.af[x][y][1] <= 2 then
                if interface.data.progress.gear.af[x][y][1] <= 1 then
                    interface.data.progress.gear.afneed[1][y][1] = interface.data.progress.gear.afneed[1][y][1] + 10;
                else
                    interface.data.progress.gear.afneed[1][y][1] = interface.data.progress.gear.afneed[1][y][1] + 5;
                end
                interface.data.progress.gear.afneed[1][y][2] = interface.data.progress.gear.afneed[1][y][2] + 1;
                if (x == 1) or (x == 9) then
                    interface.data.progress.gear.afneed[1][y][3] = interface.data.progress.gear.afneed[1][y][3] + 1;
                elseif (x == 2) or (x == 6) or (x == 19) then
                    interface.data.progress.gear.afneed[1][y][4] = interface.data.progress.gear.afneed[1][y][4] + 1;
                elseif (x == 3) or (x == 10) or (x == 16) then
                    interface.data.progress.gear.afneed[1][y][5] = interface.data.progress.gear.afneed[1][y][5] + 1;
                elseif (x == 4) or (x == 11) or (x == 17) or (x == 18) then
                    interface.data.progress.gear.afneed[1][y][6] = interface.data.progress.gear.afneed[1][y][6] + 1;
                elseif (x == 5) or (x == 15) or (x == 20) then
                    interface.data.progress.gear.afneed[1][y][7] = interface.data.progress.gear.afneed[1][y][7] + 1;
                elseif (x == 7) or (x == 14) then
                    interface.data.progress.gear.afneed[1][y][8] = interface.data.progress.gear.afneed[1][y][8] + 1;
                elseif (x == 8) then
                    interface.data.progress.gear.afneed[1][y][9] = interface.data.progress.gear.afneed[1][y][9] + 1;
                elseif (x == 12) or (x == 13) then
                    interface.data.progress.gear.afneed[1][y][10] = interface.data.progress.gear.afneed[1][y][10] + 1;
                end
            end
            if interface.data.progress.gear.af[x][y][1] <= 3 then
                interface.data.progress.gear.afneed[2][y][1] = interface.data.progress.gear.afneed[2][y][1] + 8;
                interface.data.progress.gear.afneed[2][y][2] = interface.data.progress.gear.afneed[2][y][2] + 1;
                if (x == 1) or (x == 9) then
                    interface.data.progress.gear.afneed[2][y][3] = interface.data.progress.gear.afneed[2][y][3] + 1;
                elseif (x == 2) or (x == 6) or (x == 19) then
                    interface.data.progress.gear.afneed[2][y][4] = interface.data.progress.gear.afneed[2][y][4] + 1;
                elseif (x == 3) or (x == 10) or (x == 16) or (x == 21) then
                    interface.data.progress.gear.afneed[2][y][5] = interface.data.progress.gear.afneed[2][y][5] + 1;
                elseif (x == 4) or (x == 11) or (x == 17) or (x == 18) then
                    interface.data.progress.gear.afneed[2][y][6] = interface.data.progress.gear.afneed[2][y][6] + 1;
                elseif (x == 5) or (x == 15) or (x == 20) then
                    interface.data.progress.gear.afneed[2][y][7] = interface.data.progress.gear.afneed[2][y][7] + 1;
                elseif (x == 7) or (x == 14) then
                    interface.data.progress.gear.afneed[2][y][8] = interface.data.progress.gear.afneed[2][y][8] + 1;
                elseif (x == 8) then
                    interface.data.progress.gear.afneed[2][y][9] = interface.data.progress.gear.afneed[2][y][9] + 1;
                elseif (x == 12) or (x == 13) or (x == 22) then
                    interface.data.progress.gear.afneed[2][y][10] = interface.data.progress.gear.afneed[2][y][10] + 1;
                end
            end
            if interface.data.progress.gear.af[x][y][1] <= 4 then
                interface.data.progress.gear.afneed[3][y][1] = interface.data.progress.gear.afneed[3][y][1] + 1;
                if (x == 1) or (x == 9) or (x == 11) then
                    interface.data.progress.gear.afneed[3][y][2] = interface.data.progress.gear.afneed[3][y][2] + 1;
                elseif (x == 2) or (x == 6) or (x == 19) then
                    interface.data.progress.gear.afneed[3][y][3] = interface.data.progress.gear.afneed[3][y][3] + 1;
                elseif (x == 3) or (x == 10) or (x == 16) or (x == 21) then
                    interface.data.progress.gear.afneed[3][y][4] = interface.data.progress.gear.afneed[3][y][4] + 1;
                elseif (x == 4) or (x == 17) or (x == 18) then
                    interface.data.progress.gear.afneed[3][y][5] = interface.data.progress.gear.afneed[3][y][5] + 1;
                elseif (x == 5) or (x == 15) or (x == 20) then
                    interface.data.progress.gear.afneed[3][y][6] = interface.data.progress.gear.afneed[3][y][6] + 1;
                elseif (x == 7) or (x == 14) then
                    interface.data.progress.gear.afneed[3][y][7] = interface.data.progress.gear.afneed[3][y][7] + 1;
                elseif (x == 8) or (x == 12) or (x == 13) or (x == 22) then
                    interface.data.progress.gear.afneed[3][y][8] = interface.data.progress.gear.afneed[3][y][8] + 1;
                end
                if (y == 1) then
                    cards[x] = cards[x] + 8;
                elseif (y == 2) then
                    cards[x] = cards[x] + 10;
                elseif (y == 3) then
                    cards[x] = cards[x] + 7;
                elseif (y == 4) then
                    cards[x] = cards[x] + 9;
                elseif (y == 5) then
                    cards[x] = cards[x] + 6;
                end
            end
            if interface.data.progress.gear.af[x][y][1] <= 5 then
                if (x == 1) or (x == 2) or (x == 7) or (x == 8) or (x == 12) then
                    interface.data.progress.gear.afneed[4][y][1] = interface.data.progress.gear.afneed[4][y][1] + 1;
                elseif (x == 2) or (x == 3) or (x == 4) or (x == 16) or (x == 20) then
                    interface.data.progress.gear.afneed[4][y][2] = interface.data.progress.gear.afneed[4][y][2] + 1;
                elseif (x == 6) or (x == 13) or (x == 19) or (x == 22) then
                    interface.data.progress.gear.afneed[4][y][3] = interface.data.progress.gear.afneed[4][y][3] + 1;
                elseif (x == 9) or (x == 14) or (x == 15) or (x == 18) then
                    interface.data.progress.gear.afneed[4][y][4] = interface.data.progress.gear.afneed[4][y][4] + 1;
                elseif (x == 10) or (x == 11) or (x == 17) or (x == 21) then
                    interface.data.progress.gear.afneed[4][y][5] = interface.data.progress.gear.afneed[4][y][5] + 1;
                end
                if (y == 1) then
                    interface.data.progress.gear.afneed[4][y][6] = interface.data.progress.gear.afneed[4][y][6] + 1;
                    interface.data.progress.gear.afneed[4][y][10] = interface.data.progress.gear.afneed[4][y][10] + 1;
                    interface.data.progress.gear.afneed[4][y][12] = interface.data.progress.gear.afneed[4][y][12] + 2;
                elseif (y == 2) then
                    interface.data.progress.gear.afneed[4][y][8] = interface.data.progress.gear.afneed[4][y][8] + 1;
                    interface.data.progress.gear.afneed[4][y][12] = interface.data.progress.gear.afneed[4][y][12] + 3;
                    interface.data.progress.gear.afneed[4][y][14] = interface.data.progress.gear.afneed[4][y][14] + 1;
                elseif (y == 3)  then
                    interface.data.progress.gear.afneed[4][y][15] = interface.data.progress.gear.afneed[4][y][15] + 3;
                    interface.data.progress.gear.afneed[4][y][7] = interface.data.progress.gear.afneed[4][y][7] + 1;
                    interface.data.progress.gear.afneed[4][y][12] = interface.data.progress.gear.afneed[4][y][12] + 1;
                elseif (y == 4) then
                    interface.data.progress.gear.afneed[4][y][8] = interface.data.progress.gear.afneed[4][y][8] + 1;
                    interface.data.progress.gear.afneed[4][y][12] = interface.data.progress.gear.afneed[4][y][12] + 2;
                    interface.data.progress.gear.afneed[4][y][13] = interface.data.progress.gear.afneed[4][y][13] + 1;
                elseif (y == 5) then
                    interface.data.progress.gear.afneed[4][y][9] = interface.data.progress.gear.afneed[4][y][9] + 1;
                    interface.data.progress.gear.afneed[4][y][11] = interface.data.progress.gear.afneed[4][y][11] + 3;
                    interface.data.progress.gear.afneed[4][y][12] = interface.data.progress.gear.afneed[4][y][12] + 1;
                end
                if (y == 1) then
                    cards[x] = cards[x] + 40;
                elseif (y == 2) then
                    cards[x] = cards[x] + 50;
                elseif (y == 3) then
                    cards[x] = cards[x] + 35;
                elseif (y == 4) then
                    cards[x] = cards[x] + 45;
                elseif (y == 5) then
                    cards[x] = cards[x] + 30;
                end
            end
        end
    end
    
    for l = 1, #interface.data.progress.gear.jobcards do
        interface.data.progress.gear.jobcards[l] = cards[l]
    end
end

function manager.DisplayAFGear()
    imgui.Spacing();imgui.Spacing();
    for a = 1, #interface.data.progress.gear.af do
        for b = 1, #interface.data.progress.gear.af[a] do
            imgui.TableNextColumn();
            local temp = {interface.data.progress.gear.af[a][b][1]};
            if (imgui.Combo(interface.data.progress.gear.af[a][b][2], temp, 'None\0NQ\0+1\0lv109\0lv119+1\0lv119+2\0lv119+3\0')) then
                interface.data.progress.gear.af[a][b][1] = temp[1];
            end
        end
    end
end

function manager.DisplayAFGearNeed()
    manager.guilditemsgil = 0;

    imgui.BeginTable('chapters', 11, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Chapters');imgui.TableNextColumn();
        for t = 1, 10 do
            imgui.TextColored(interface.colors.header,'Chap. ' .. t);imgui.TableNextColumn();
        end
        imgui.TableNextColumn();
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.afneed[1][i][1]));imgui.TableNextColumn();
        end
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.afneed[2][i][1]));
            if (i ~= 5) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Phx. Feather');imgui.TableNextColumn();
        imgui.Text('Mal. Fiber');imgui.TableNextColumn();
        imgui.Text('Btl. Blood');imgui.TableNextColumn();
        imgui.Text('Damas. Cloth');imgui.TableNextColumn();
        imgui.Text('Oxblood');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.afneed[1] do
            imgui.Text(tostring(interface.data.progress.gear.afneed[1][i][2]));
            if (i ~= #interface.data.progress.gear.afneed[1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109job', 9, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/BST');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK/THF/DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BRD/BLU');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLM/RNG/COR/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM/SMN/SCH');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'PLD/DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'DRK');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SAM/NIN');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('Tgr Leather');imgui.TableNextColumn();
        imgui.Text('Gld Thread');imgui.TableNextColumn();
        imgui.Text('Imp Slk Cloth');imgui.TableNextColumn();
        imgui.Text('Kara. Cloth');imgui.TableNextColumn();
        imgui.Text('Scarlet Linen');imgui.TableNextColumn();
        imgui.Text('Gld Sheet');imgui.TableNextColumn();
        imgui.Text('Drkstl Sheet');imgui.TableNextColumn();
        imgui.Text('Tama-Hagane');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 3, #interface.data.progress.gear.afneed[1][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[1] do
                count = count + interface.data.progress.gear.afneed[1][i][x];
            end
            imgui.Text(tostring(count));
            if (x ~= #interface.data.progress.gear.afneed[1][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1191slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+1');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Maliy. Orb');imgui.TableNextColumn();
        imgui.Text('Hepa. Ingot');imgui.TableNextColumn();
        imgui.Text('Bery. Ingot');imgui.TableNextColumn();
        imgui.Text('Exalt. Lbr.');imgui.TableNextColumn();
        imgui.Text('Sif\'s Macarame');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.afneed[2] do
            imgui.Text(tostring(interface.data.progress.gear.afneed[2][i][2]));
            if (i ~= #interface.data.progress.gear.afneed[2]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1191job', 9, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+1');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/BST');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK/THF/DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BRD/BLU/GEO');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLM/RNG/COR/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM/SMN/SCH');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'PLD/DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'DRK');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SAM/NIN/RUN');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('Behe Leather');imgui.TableNextColumn();
        imgui.Text('Plt Slk Thrd');imgui.TableNextColumn();
        imgui.Text('Raxa');imgui.TableNextColumn();
        imgui.Text('Twill Damask');imgui.TableNextColumn();
        imgui.Text('Siren\'s Hair');imgui.TableNextColumn();
        imgui.Text('Ori Sheet');imgui.TableNextColumn();
        imgui.Text('Durium Sheet');imgui.TableNextColumn();
        imgui.Text('Dama Ingot');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 3, #interface.data.progress.gear.afneed[2][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[2] do
                count = count + interface.data.progress.gear.afneed[2][i][x];
            end
            imgui.Text(tostring(count));
            if (x ~= #interface.data.progress.gear.afneed[2][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('cards', (#interface.defaults.jobsabrv +1), ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Cards');imgui.TableNextColumn();
        for j = 1, #interface.defaults.jobsabrv do
            imgui.TextColored(interface.colors.header, interface.defaults.jobsabrv[j]);imgui.TableNextColumn();
        end
        imgui.TableNextColumn();
        for c = 1, #interface.data.progress.gear.jobcards do
            imgui.Text(tostring(interface.data.progress.gear.jobcards[c]));
            if (c ~= #interface.data.progress.gear.jobcards) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1192slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+2');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head (8 cards)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body (10 cards)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands (7 cards)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs (9 cards)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet (6 cards)');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Emp Artho Shell');imgui.TableNextColumn();
        imgui.Text('Joyous Moss');imgui.TableNextColumn();
        imgui.Text('Imperator Wing');imgui.TableNextColumn();
        imgui.Text('Warblade Beak Hide');imgui.TableNextColumn();
        imgui.Text('Abyssdiver Feather');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.afneed[3] do
            imgui.Text(tostring(interface.data.progress.gear.afneed[3][i][1]));
            if (i ~= #interface.data.progress.gear.afneed[3]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1192job', 8, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+2');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/BST/RNG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK/THF/DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BRD/BLU/GEO');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLM/COR/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM/SMN/SCH');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'PLD/DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'DRK/SAM/NIN/RUN');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('S.Faulpie Lthr');imgui.TableNextColumn();
        imgui.Text('Cypress Log');imgui.TableNextColumn();
        imgui.Text('Khoma Thread');imgui.TableNextColumn();
        imgui.Text('Azure Leaf');imgui.TableNextColumn();
        imgui.Text('Cyan Coral');imgui.TableNextColumn();
        imgui.Text('Ruth. Ore');imgui.TableNextColumn();
        imgui.Text('Niob. Ore');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 2, #interface.data.progress.gear.afneed[3][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[3] do
                count = count + interface.data.progress.gear.afneed[3][i][x];
            end
            imgui.Text(tostring(count));
            manager.guilditemsgil = manager.guilditemsgil + (count * 1126125);
            if (x ~= #interface.data.progress.gear.afneed[3][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1193scales', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+3 Scales');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Kin');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Kei');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Gin');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Fu');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Kyou');imgui.TableNextColumn();imgui.TableNextColumn();
        for x = 1, 5 do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[4] do
                count = count + interface.data.progress.gear.afneed[4][i][x];
            end
            imgui.Text(tostring(count));
            if (x ~= 5) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1193items', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+3 Items');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Text('SYN. Faulpie Lthr');imgui.TableNextColumn();
        imgui.Text('Cypress Log');imgui.TableNextColumn();
        imgui.Text('Cypress Lbr');imgui.TableNextColumn();
        imgui.Text('Khoma Thread');imgui.TableNextColumn();
        imgui.Text('Khoma Cloth');imgui.TableNextColumn();
        for x = 6, 10 do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[4] do
                count = count + interface.data.progress.gear.afneed[4][i][x];
            end
            imgui.Text(tostring(count));imgui.TableNextColumn();
        end
        imgui.Text('Azure Cermet');imgui.TableNextColumn();
        imgui.Text('Cyan Orb');imgui.TableNextColumn();
        imgui.Text('Ruthenium Ingot');imgui.TableNextColumn();
        imgui.Text('Niobium Ingot');imgui.TableNextColumn();
        imgui.Text('Faulpie Leather');imgui.TableNextColumn();
        for x =11, #interface.data.progress.gear.afneed[4][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.afneed[4] do
                count = count + interface.data.progress.gear.afneed[4][i][x];
            end
            imgui.Text(tostring(count));
            --manager.guilditemsgil = manager.guilditemsgil + (count * 1126125);
            if x~= #interface.data.progress.gear.afneed[4][1] then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.Text('Est. Needed Gil for Guild Items:  ');imgui.SameLine();imgui.TextColored(interface.colors.header, manager.comma_value(manager.guilditemsgil));
end

function manager.UpdateRelicGear()
    local countgear = 0;
    local totalgear = #interface.defaults.gear.relic * #interface.defaults.gear.relic[1] * #interface.defaults.gear.relic[1][1];
    for a = 1, #interface.defaults.gear.relic do
        for b = 1, #interface.defaults.gear.relic[a] do
            local count = 1;
            if interface.data.progress.gear.relic[a][b][1] == #interface.defaults.gear.relic[a][b] then
                count = #interface.defaults.gear.relic[a][b] + 1;
            elseif interface.data.progress.gear.relic[a][b][1] == 0 then
            else count = interface.data.progress.gear.relic[a][b][1] end
            for c = 1, #interface.defaults.gear.relic[a][b] do
                if (modifind.search(interface.defaults.gear.relic[a][b][c])) then
                    interface.data.progress.gear.relic[a][b][1] = c;
                end
            end
            countgear = countgear + interface.data.progress.gear.relic[a][b][1];
        end
    end
    interface.data.progress.gear.relicProgress[1] = (totalgear-countgear)/totalgear;
    manager.CountRelicGear();
end

function manager.CountRelicGearInv(items)
    if items == nil then return end

    local forgottenIDs = {3493,3494,3495,3496,3497};
    for i = 1, #forgottenIDs do
        items[1][i] = items[1][i] - manager.CountItemId(forgottenIDs[i]);
    end

    local checks1 = {0,0,1469,1516,1470,1458,1466,1464};--{blank,blank,wootze ore,griffon hide,sparkling stone,mammoth tusk,relic iron,lancewood log,}
    for i = 3, #checks1 do
        items[2][1][i] = items[2][1][i] - manager.CountItemId(checks1[i]);
    end

    local checks2 = {0,0,3447,3492,3491,3490,3445,3449};--{blank,blank,voidwrought plate,kaggen's cuticle,akvan's pennon,pil's tuille,hahava's mail,celaeno's cloth'}
    for i = 3, #checks2 do
        items[3][1][i] = items[3][1][i] - manager.CountItemId(checks2[i]);
    end

    local checks3 = {0,9253,9245,9251,9257,9255,9249,9247};--{blank,S.Faulpie Leather,Cypress Log,Khoma Thread,Azure Leaf,Cyan Coral,Ruthenium Ore,Niobium Ore,}
    for i = 3, #checks3 do
        items[4][1][i] = items[4][1][i] - manager.CountItemId(checks3[i]);
    end

    for j = 1, #items[5] do
        for s = 1, #items[5][j] do
            items[5][j][s][1] = 0 - manager.CountItemId(interface.defaults.gear.relicshards[s][j]);
            items[5][j][s][2] = 0 - manager.CountItemId(interface.defaults.gear.relicvoids[s][j]);
        end
    end

    return items;
end

function manager.CountRelicGear()
    interface.data.progress.gear.relicneed = {
        {0,0,0,0,0},
        {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
        {   {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
            {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
        },
    };
    interface.data.progress.gear.relicneed = manager.CountRelicGearInv(interface.data.progress.gear.relicneed);

    for x = 1, #interface.data.progress.gear.relic do
        for y = 1, #interface.data.progress.gear.relic[x] do
            if interface.data.progress.gear.relic[x][y][1] <= 2 then
                if interface.data.progress.gear.relic[x][y][1] <= 1 then
                    interface.data.progress.gear.relicneed[1][y] = interface.data.progress.gear.relicneed[1][y] + 50;
                else
                    interface.data.progress.gear.relicneed[1][y] = interface.data.progress.gear.relicneed[1][y] + 30;
                end
            end
            if interface.data.progress.gear.relic[x][y][1] <= 3 then
                if interface.data.progress.gear.relic[x][y][1] <= 2 then
                    interface.data.progress.gear.relicneed[2][y][1] = interface.data.progress.gear.relicneed[2][y][1] + 10;
                else
                    interface.data.progress.gear.relicneed[2][y][1] = interface.data.progress.gear.relicneed[2][y][1] + 5;
                end
                interface.data.progress.gear.relicneed[2][y][2] = interface.data.progress.gear.relicneed[2][y][2] + 1;
                if (x == 1) or (x == 7) or (x == 8) then
                    interface.data.progress.gear.relicneed[2][y][3] = interface.data.progress.gear.relicneed[2][y][3] + 1;
                elseif (x == 2) or (x == 5) or (x == 6) or (x == 10) or (x == 11) or (x == 14) or (x == 16) then
                    interface.data.progress.gear.relicneed[2][y][4] = interface.data.progress.gear.relicneed[2][y][4] + 1;
                elseif (x == 3) or (x == 4) or (x == 17) then
                    interface.data.progress.gear.relicneed[2][y][5] = interface.data.progress.gear.relicneed[2][y][5] + 1;
                elseif (x == 9) or (x == 19) then
                    interface.data.progress.gear.relicneed[2][y][6] = interface.data.progress.gear.relicneed[2][y][6] + 1;
                elseif (x == 12) or (x == 13) then
                    interface.data.progress.gear.relicneed[2][y][7] = interface.data.progress.gear.relicneed[2][y][7] + 1;
                elseif (x == 15) or (x == 18) or (x == 20) then
                    interface.data.progress.gear.relicneed[2][y][8] = interface.data.progress.gear.relicneed[2][y][8] + 1;
                end
            end
            if interface.data.progress.gear.relic[x][y][1] <= 4 then
                interface.data.progress.gear.relicneed[3][y][1] = interface.data.progress.gear.relicneed[3][y][1] + 8;
                interface.data.progress.gear.relicneed[3][y][2] = interface.data.progress.gear.relicneed[3][y][2] + 1;
                if (x == 1) or (x == 13) or (x == 14) then
                    interface.data.progress.gear.relicneed[3][y][3] = interface.data.progress.gear.relicneed[3][y][3] + 1;
                elseif (x == 2) or (x == 6) or (x == 10) or (x == 17) then
                    interface.data.progress.gear.relicneed[3][y][4] = interface.data.progress.gear.relicneed[3][y][4] + 1;
                elseif (x == 3) or (x == 4) or (x == 20) or (x == 21) then
                    interface.data.progress.gear.relicneed[3][y][5] = interface.data.progress.gear.relicneed[3][y][5] + 1;
                elseif (x == 5) or (x == 7) or (x == 8) or (x == 12) or (x == 16) then
                    interface.data.progress.gear.relicneed[3][y][6] = interface.data.progress.gear.relicneed[3][y][6] + 1;
                elseif (x == 9) or (x == 15) or (x == 18) then
                    interface.data.progress.gear.relicneed[3][y][7] = interface.data.progress.gear.relicneed[3][y][7] + 1;
                elseif (x == 11) or (x == 19) or (x == 22) then
                    interface.data.progress.gear.relicneed[3][y][8] = interface.data.progress.gear.relicneed[3][y][8] + 1;
                end
            end
            if interface.data.progress.gear.relic[x][y][1] <= 5 then
                interface.data.progress.gear.relicneed[5][x][y][1] = interface.data.progress.gear.relicneed[5][x][y][1] + 2;
                interface.data.progress.gear.relicneed[4][y][1] = interface.data.progress.gear.relicneed[4][y][1] + 3;
                if (x == 1) or (x == 9) or (x == 11) then
                    interface.data.progress.gear.relicneed[4][y][2] = interface.data.progress.gear.relicneed[4][y][2] + 1;
                elseif (x == 2) or (x == 6) or (x == 19) then
                    interface.data.progress.gear.relicneed[4][y][3] = interface.data.progress.gear.relicneed[4][y][3] + 1;
                elseif (x == 3) or (x == 10) or (x == 16) or (x == 21) then
                    interface.data.progress.gear.relicneed[4][y][4] = interface.data.progress.gear.relicneed[4][y][4] + 1;
                elseif (x == 4) or (x == 17) or (x == 18) then
                    interface.data.progress.gear.relicneed[4][y][5] = interface.data.progress.gear.relicneed[4][y][5] + 1;
                elseif (x == 5) or (x == 15) or (x == 20) then
                    interface.data.progress.gear.relicneed[4][y][6] = interface.data.progress.gear.relicneed[4][y][6] + 1;
                elseif (x == 7) or (x == 14) then
                    interface.data.progress.gear.relicneed[4][y][7] = interface.data.progress.gear.relicneed[4][y][7] + 1;
                elseif (x == 8) or (x == 12) or (x == 13) or (x == 22) then
                    interface.data.progress.gear.relicneed[4][y][8] = interface.data.progress.gear.relicneed[4][y][8] + 1;
                end
            end
            if interface.data.progress.gear.relic[x][y][1] <= 6 then
                interface.data.progress.gear.relicneed[5][x][y][1] = interface.data.progress.gear.relicneed[5][x][y][1] + 3;
                interface.data.progress.gear.relicneed[5][x][y][2] = interface.data.progress.gear.relicneed[5][x][y][2] + 3;
                interface.data.progress.gear.relicneed[5][x][y][3] = interface.data.progress.gear.relicneed[5][x][y][3] + 3;
            end
        end
    end
end

function manager.DisplayRelicGear()
    imgui.BeginTable('relic gear has', 5, ImGuiTableFlags_Borders);
    for a = 1, #interface.data.progress.gear.relic do
        for b = 1, #interface.data.progress.gear.relic[a] do
            imgui.TableNextColumn();
            local temp = {interface.data.progress.gear.relic[a][b][1]};
            if (imgui.Combo(interface.data.progress.gear.relic[a][b][2], temp, 'None\0NQ\0+1\0+2\0lv109\0lv119+1\0lv119+2\0lv119+3\0')) then
                interface.data.progress.gear.relic[a][b][1] = temp[1];
            end
        end
    end
    imgui.EndTable();
    if (imgui.Button('Update Relic Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        manager.UpdateRelicGear();
    end
    imgui.SameLine();
    imgui.ProgressBar(interface.data.progress.gear.relicProgress[1]);
end

function manager.DisplayRelicGearNeed()
    manager.guilditemsgil = 0;
    manager.plasm = 0;

    imgui.BeginTable('Forgotten', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Forgotten');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Thought');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hope');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Touch');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Journey');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Step');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.relicneed[1] do
            imgui.Text(tostring(interface.data.progress.gear.relicneed[1][i]));
            if (i ~= #interface.data.progress.gear.relicneed[1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('chapters', 11, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Chapters');imgui.TableNextColumn();
        for t = 1, 10 do
            imgui.TextColored(interface.colors.header,'Chap. ' .. t);imgui.TableNextColumn();
        end
        imgui.TableNextColumn();
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.relicneed[2][i][1]));imgui.TableNextColumn();
        end
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.relicneed[3][i][1]));
            if (i ~= 5) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Phx. Feather');imgui.TableNextColumn();
        imgui.Text('Mal. Fiber');imgui.TableNextColumn();
        imgui.Text('Btl. Blood');imgui.TableNextColumn();
        imgui.Text('Damas. Cloth');imgui.TableNextColumn();
        imgui.Text('Oxblood');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.relicneed[2] do
            imgui.Text(tostring(interface.data.progress.gear.relicneed[2][i][2]));
            if (i ~= #interface.data.progress.gear.relicneed[2]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109job', 7, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/PLD/DRK');imgui.TableNextColumn();
        --imgui.TextColored(interface.colors.header, 'MNK/RDM/THF/BRD/RNG/DRG/BLU');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'ALL ELSE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BLM/COR');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BST/DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SAM/NIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SMN/PUP/SCH');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('Wootz Ore');imgui.TableNextColumn();
        imgui.Text('Griffon Hide');imgui.TableNextColumn();
        imgui.Text('Sparkling Stone');imgui.TableNextColumn();
        imgui.Text('Mammoth Tusk');imgui.TableNextColumn();
        imgui.Text('Relic Iron');imgui.TableNextColumn();
        imgui.Text('Lancewood Log');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 3, #interface.data.progress.gear.relicneed[2][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.relicneed[1] do
                count = count + interface.data.progress.gear.relicneed[2][i][x];
            end
            imgui.Text(tostring(count));
            if (x ~= #interface.data.progress.gear.relicneed[2][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1191slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+1');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Gabbrath Horn');imgui.TableNextColumn();
        imgui.Text('Yggdreant Bole');imgui.TableNextColumn();
        imgui.Text('Bztavian Stinger');imgui.TableNextColumn();
        imgui.Text('Waktza Rostrum');imgui.TableNextColumn();
        imgui.Text('Rockfin Tooth');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.relicneed[3] do
            local count = 0;
            count = count + interface.data.progress.gear.relicneed[3][i][2];
            imgui.Text(tostring(interface.data.progress.gear.relicneed[3][i][2]));
            manager.plasm = manager.plasm + (count * 300000);
            if (i ~= #interface.data.progress.gear.relicneed[3]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1191job', 7, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+1');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/NIN/DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK/THF/BRD/COR');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BLM/SCH/GEO');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM/PLD/DRK/SAM/BLU');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BST/SMN/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RNG/DNC/RUN');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('Voidwrought Plate');imgui.TableNextColumn();
        imgui.Text('Kaggen\'s Cuticle');imgui.TableNextColumn();
        imgui.Text('Akvan\'s Pennon');imgui.TableNextColumn();
        imgui.Text('Pil\'s Tuille');imgui.TableNextColumn();
        imgui.Text('Hahava\'s Mail');imgui.TableNextColumn();
        imgui.Text('Celaeno\'s Cloth');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 3, #interface.data.progress.gear.relicneed[3][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.relicneed[3] do
                count = count + interface.data.progress.gear.relicneed[3][i][x];
            end
            imgui.Text(tostring(count));
            if (x ~= #interface.data.progress.gear.relicneed[3][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1192slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+2');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet (3 ea.)');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Gabbrath Horn');imgui.TableNextColumn();
        imgui.Text('Yggdreant Bole');imgui.TableNextColumn();
        imgui.Text('Bztavian Stinger');imgui.TableNextColumn();
        imgui.Text('Waktza Rostrum');imgui.TableNextColumn();
        imgui.Text('Rockfin Tooth');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.relicneed[4] do
            local count = 0;
            count = count + interface.data.progress.gear.relicneed[4][i][1];
            imgui.Text(tostring(interface.data.progress.gear.relicneed[4][i][1]));
            manager.plasm = manager.plasm + (count * 300000);
            if (i ~= #interface.data.progress.gear.relicneed[4]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1192job', 8, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+2');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/BST/RNG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK/THF/DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM/BRD/BLU/GEO');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLM/COR/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM/SMN/SCH');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'PLD/DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'DRK/SAM/NIN/RUN');imgui.TableNextColumn();
        imgui.Text('Job Spec.');imgui.TableNextColumn();
        imgui.Text('S.Faulpie Lthr');imgui.TableNextColumn();
        imgui.Text('Cypress Log');imgui.TableNextColumn();
        imgui.Text('Khoma Thread');imgui.TableNextColumn();
        imgui.Text('Azure Leaf');imgui.TableNextColumn();
        imgui.Text('Cyan Coral');imgui.TableNextColumn();
        imgui.Text('Ruth. Ore');imgui.TableNextColumn();
        imgui.Text('Niob. Ore');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for x = 2, #interface.data.progress.gear.relicneed[4][1] do
            local count = 0;
            for i = 1, #interface.data.progress.gear.relicneed[4] do
                count = count + interface.data.progress.gear.relicneed[4][i][x];
            end
            imgui.Text(tostring(count));
            manager.guilditemsgil = manager.guilditemsgil + (count * 1126125);
            if (x ~= #interface.data.progress.gear.relicneed[4][1]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('1193slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119+3');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs (3 ea.)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet (3 ea.)');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Defiant Scarf');imgui.TableNextColumn();
        imgui.Text('Hades Claw');imgui.TableNextColumn();
        imgui.Text('Macuil Plating');imgui.TableNextColumn();
        imgui.Text('Tartarian Soul');imgui.TableNextColumn();
        imgui.Text('Plovid Flesh');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for h = 1, #interface.data.progress.gear.relicneed[5][1] do
            for i = 3, #interface.data.progress.gear.relicneed[5][1][h] do
                local count = 0;
                for j = 1, #interface.data.progress.gear.relicneed[5] do
                    count = count + interface.data.progress.gear.relicneed[5][j][h][i];
                end
                imgui.Text(tostring(count));
                if (h ~= #interface.data.progress.gear.relicneed[5][1]) then imgui.TableNextColumn() end
            end
        end
    imgui.EndTable();

    imgui.Spacing();
    imgui.Text('Est. Needed Gil for Guild Items:  ');imgui.SameLine();imgui.TextColored(interface.colors.header, manager.comma_value(manager.guilditemsgil));
    imgui.Text('Est. Needed Plasm:  ');imgui.SameLine();imgui.TextColored(interface.colors.header, manager.comma_value(manager.plasm));

    imgui.Spacing();
    if (imgui.Button('Update Relic Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        manager.UpdateRelicGear();
    end
    imgui.ShowHelp('119+2 and +3 items also need various shards and voids, see the next tab for display of those needs');
end

function manager.DisplayRelicShardsNeed()
    local bm = 0 - manager.CountItemId(9539);
    local km = 0 - manager.CountItemId(9541);

    imgui.BeginTable('Shards', 12, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SHARDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'VOIDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        for j = 1, #interface.defaults.jobsabrv do
            imgui.TextColored(interface.colors.header, interface.defaults.jobsabrv[j]);imgui.TableNextColumn();
            for s = 1, #interface.data.progress.gear.relicneed[5][j] do
                bm = bm + interface.data.progress.gear.relicneed[5][j][s][1];
                if (interface.data.progress.gear.relicneed[5][j][s][1] >= 5) then
                    imgui.TextColored(interface.colors.error, tostring(interface.data.progress.gear.relicneed[5][j][s][1]));imgui.TableNextColumn();
                elseif (interface.data.progress.gear.relicneed[5][j][s][1] <= 0) then
                    imgui.TextColored(interface.colors.text1, tostring(interface.data.progress.gear.relicneed[5][j][s][1]));imgui.TableNextColumn();
                else
                    imgui.TextColored(interface.colors.warning, tostring(interface.data.progress.gear.relicneed[5][j][s][1]));imgui.TableNextColumn();
                end
            end
            imgui.TextColored(interface.colors.header, interface.defaults.jobsabrv[j]);imgui.TableNextColumn();
            for v = 1, #interface.data.progress.gear.relicneed[5][j] do
                km = km + interface.data.progress.gear.relicneed[5][j][v][2];
                if (interface.data.progress.gear.relicneed[5][j][v][2] >= 3) then
                    imgui.TextColored(interface.colors.error, tostring(interface.data.progress.gear.relicneed[5][j][v][2]));
                elseif (interface.data.progress.gear.relicneed[5][j][v][2] <= 0) then
                    imgui.TextColored(interface.colors.text1, tostring(interface.data.progress.gear.relicneed[5][j][v][2]));
                else
                    imgui.TextColored(interface.colors.warning, tostring(interface.data.progress.gear.relicneed[5][j][v][2]));
                end
                if v == #interface.data.progress.gear.relicneed[5][j] and j == #interface.defaults.jobsabrv then 
                else
                    imgui.TableNextColumn();
                end
            end
        end
    imgui.EndTable();

    imgui.Separator();

    imgui.Text('Needed Beastmen\'s Medals:  ' .. bm);
    imgui.Text('Needed Kindred\'s Medals:  ' .. km);

    if (imgui.Button('Update Relic Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        manager.UpdateRelicGear();
    end
end

function manager.UpdateEmpyGear()
    local countgear = 0;
    local totalgear = #interface.defaults.gear.empyrean * #interface.defaults.gear.empyrean[1] * #interface.defaults.gear.empyrean[1][1];
    for a = 1, #interface.defaults.gear.empyrean do
        for b = 1, #interface.defaults.gear.empyrean[a] do
            local count = 1;
            if interface.data.progress.gear.empyrean[a][b][1] == #interface.defaults.gear.empyrean[a][b] then
                count = #interface.defaults.gear.empyrean[a][b] + 1;
            elseif interface.data.progress.gear.empyrean[a][b][1] == 0 then
            else count = interface.data.progress.gear.empyrean[a][b][1] end
            for c = count, #interface.defaults.gear.empyrean[a][b] do
                if (modifind.search(interface.defaults.gear.empyrean[a][b][c])) then
                    interface.data.progress.gear.empyrean[a][b][1] = c;
                end
            end
            countgear = countgear + interface.data.progress.gear.empyrean[a][b][1];
        end
    end
    interface.data.progress.gear.empyProgress[1] = (totalgear-countgear)/totalgear;
    interface.manager.CountEmpyGear();
end

function manager.CountEmpyGearInv(items)
    if items == nil then return end
    local slot1 = 0;local slot2 = 0;local slot3 = 0;local slot4 = 0;
    local dropids = {2929,2962,3287,2927,2965,3291,2932,2930,3288,2963,3289,2966,3292,3290,2964,2928,2967};-- {briareus,itzpapalotl,orthus,glavoid,lanterns,alfard,kukulkan,cara,dragua,ulhuadshi,apademak,bukhis,azdaja,isgebind,sobek,chloris,sedna}
    for y=1, #items[1] do
        if y == 1 then
            slot1 = 3210;
            slot2 = 3212;
            slot3 = 3211;
            slot4 = 3213;
        elseif y == 2 then
            slot1 = 3214;
            slot2 = 3216;
            slot3 = 3215;
            slot4 = 3217;
        elseif y == 3 then
            slot1 = 3218;
            slot2 = 3220;
            slot3 = 3219;
            slot4 = 3221;
        elseif y == 4 then
            slot1 = 3222;
            slot2 = 3224;
            slot3 = 3223;
            slot4 = 3225;
        elseif y == 5 then
            slot1 = 3226;
            slot2 = 3228;
            slot3 = 3227;
            slot4 = 3229;
        end
        items[1][y][1] = 0 - manager.CountItemId(slot1); --count stones
        items[1][y][2] = 0 - manager.CountItemId(slot2); --count jewels
        items[1][y][3] = 0 - manager.CountItemId(slot3); --count coins
        items[1][y][4] = 0 - manager.CountItemId(slot4); --count cards
    end

    --count NM items
    for i = 3, #items[2][1] do
        items[2][1][i] = items[2][1][i] - manager.CountItemId(dropids[i-2]);
    end

    return items;
end

function manager.CountEmpyBaseGear()
    for j = 1, #interface.data.progress.gear.empyrean do
        --head
        if (j == 1) or (j == 3) or (j == 6) or (j == 10) or (j == 11) then
            if (interface.data.progress.gear.empyrean[j][1][1] <= 2) then
                interface.data.progress.gear.empyneed[1][1][1] = interface.data.progress.gear.empyneed[1][1][1] + 6;
            end
        elseif (j == 2) or (j == 7) or (j == 12) or (j == 17) or (j == 18) then
            if (interface.data.progress.gear.empyrean[j][1][1] <= 2) then
                interface.data.progress.gear.empyneed[1][1][2] = interface.data.progress.gear.empyneed[1][1][2] + 6;
            end
        elseif (j == 4) or (j == 8) or (j == 9) or (j == 13) or (j == 15) then
            if (interface.data.progress.gear.empyrean[j][1][1] <= 2) then
                interface.data.progress.gear.empyneed[1][1][3] = interface.data.progress.gear.empyneed[1][1][3] + 6;
            end
        elseif (j == 7) or (j == 14) or (j == 16) or (j == 19) or (j == 20) then
            if (interface.data.progress.gear.empyrean[j][1][1] <= 2) then
                interface.data.progress.gear.empyneed[1][1][4] = interface.data.progress.gear.empyneed[1][1][4] + 6;
            end
        end
        --body
        if (j == 1) or (j == 7) or (j == 10) or (j == 13) or (j == 16) then
            if (interface.data.progress.gear.empyrean[j][2][1] <= 2) then
                interface.data.progress.gear.empyneed[1][2][1] = interface.data.progress.gear.empyneed[1][2][1] + 9;
            end
        elseif (j == 4) or (j == 5) or (j == 12) or (j == 18) or (j == 19) then
            if (interface.data.progress.gear.empyrean[j][2][1] <= 2) then
                interface.data.progress.gear.empyneed[1][2][2] = interface.data.progress.gear.empyneed[1][2][2] + 9;
            end
        elseif (j == 6) or (j == 8) or (j == 11) or (j == 15) or (j == 17) then
            if (interface.data.progress.gear.empyrean[j][2][1] <= 2) then
                interface.data.progress.gear.empyneed[1][2][3] = interface.data.progress.gear.empyneed[1][2][3] + 9;
            end
        elseif (j == 2) or (j == 3) or (j == 9) or (j == 14) or (j == 20) then
            if (interface.data.progress.gear.empyrean[j][2][1] <= 2) then
                interface.data.progress.gear.empyneed[1][2][4] = interface.data.progress.gear.empyneed[1][2][4] + 9;
            end
        end
        --hands
        if (j == 1) or (j == 5) or (j == 6) or (j == 9) or (j == 20) then
            if (interface.data.progress.gear.empyrean[j][3][1] <= 2) then
                interface.data.progress.gear.empyneed[1][3][1] = interface.data.progress.gear.empyneed[1][3][1] + 6;
            end
        elseif (j == 2) or (j == 4) or (j == 10) or (j == 12) or (j == 15) then
            if (interface.data.progress.gear.empyrean[j][3][1] <= 2) then
                interface.data.progress.gear.empyneed[1][3][2] = interface.data.progress.gear.empyneed[1][3][2] + 6;
            end
        elseif (j == 3) or (j == 8) or (j == 11) or (j == 16) or (j == 19) then
            if (interface.data.progress.gear.empyrean[j][3][1] <= 2) then
                interface.data.progress.gear.empyneed[1][3][3] = interface.data.progress.gear.empyneed[1][3][3] + 6;
            end
        elseif (j == 7) or (j == 13) or (j == 14) or (j == 17) or (j == 18) then
            if (interface.data.progress.gear.empyrean[j][3][1] <= 2) then
                interface.data.progress.gear.empyneed[1][3][4] = interface.data.progress.gear.empyneed[1][3][4] + 6;
            end
        end
        --legs
        if (j == 1) or (j == 4) or (j == 13) or (j == 16) or (j == 18) then
            if (interface.data.progress.gear.empyrean[j][4][1] <= 2) then
                interface.data.progress.gear.empyneed[1][4][1] = interface.data.progress.gear.empyneed[1][4][1] + 6;
            end
        elseif (j == 2) or (j == 9) or (j == 11) or (j == 12) or (j == 20) then
            if (interface.data.progress.gear.empyrean[j][4][1] <= 2) then
                interface.data.progress.gear.empyneed[1][4][2] = interface.data.progress.gear.empyneed[1][4][2] + 6;
            end
        elseif (j == 5) or (j == 6) or (j == 7) or (j == 8) or (j == 10) then
            if (interface.data.progress.gear.empyrean[j][4][1] <= 2) then
                interface.data.progress.gear.empyneed[1][4][3] = interface.data.progress.gear.empyneed[1][4][3] + 6;
            end
        elseif (j == 3) or (j == 14) or (j == 15) or (j == 17) or (j == 19) then
            if (interface.data.progress.gear.empyrean[j][4][1] <= 2) then
                interface.data.progress.gear.empyneed[1][4][4] = interface.data.progress.gear.empyneed[1][4][4] + 6;
            end
        end
        --feet
        if (j == 1) or (j == 5) or (j == 7) or (j == 15) or (j == 19) then
            if (interface.data.progress.gear.empyrean[j][5][1] <= 2) then
                interface.data.progress.gear.empyneed[1][5][1] = interface.data.progress.gear.empyneed[1][5][1] + 6;
            end
        elseif (j == 3) or (j == 6) or (j == 10) or (j == 12) or (j == 18) then
            if (interface.data.progress.gear.empyrean[j][5][1] <= 2) then
                interface.data.progress.gear.empyneed[1][5][2] = interface.data.progress.gear.empyneed[1][5][2] + 6;
            end
        elseif (j == 2) or (j == 8) or (j == 16) or (j == 17) or (j == 20) then
            if (interface.data.progress.gear.empyrean[j][5][1] <= 2) then
                interface.data.progress.gear.empyneed[1][5][3] = interface.data.progress.gear.empyneed[1][5][3] + 6;
            end
        elseif (j == 4) or (j == 9) or (j == 11) or (j == 13) or (j == 14) then
            if (interface.data.progress.gear.empyrean[j][5][1] <= 2) then
                interface.data.progress.gear.empyneed[1][5][4] = interface.data.progress.gear.empyneed[1][5][4] + 6;
            end
        end
    end
end

function manager.CountEmpyGear()
    interface.data.progress.gear.empyneed = {
        {{0,0,0,0,},{0,0,0,0,},{0,0,0,0,},{0,0,0,0,},{0,0,0,0,}},
        {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},
        {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},
        {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
    };
    interface.data.progress.gear.empyneed = manager.CountEmpyGearInv(interface.data.progress.gear.empyneed);
    manager.CountEmpyBaseGear();

    for x = 1, #interface.data.progress.gear.empyrean do
        for y = 1, #interface.data.progress.gear.empyrean[x] do
            if interface.data.progress.gear.empyrean[x][y][1] <= 3 then
                if interface.data.progress.gear.empyrean[x][y][1] <= 2 then
                    interface.data.progress.gear.empyneed[2][y][1] = interface.data.progress.gear.empyneed[2][y][1] + 10;
                else
                    interface.data.progress.gear.empyneed[2][y][1] = interface.data.progress.gear.empyneed[2][y][1] + 5;
                end
                interface.data.progress.gear.empyneed[2][y][2] = interface.data.progress.gear.empyneed[2][y][2] + 1;

                if (x == 1) or (x == 8) then
                    interface.data.progress.gear.empyneed[2][y][3] = interface.data.progress.gear.empyneed[2][y][3] + 1;
                elseif (x == 2) then
                    interface.data.progress.gear.empyneed[2][y][4] = interface.data.progress.gear.empyneed[2][y][4] + 1;
                elseif (x == 3) then
                    interface.data.progress.gear.empyneed[2][y][5] = interface.data.progress.gear.empyneed[2][y][5] + 1;
                elseif (x == 4) then
                    interface.data.progress.gear.empyneed[2][y][6] = interface.data.progress.gear.empyneed[2][y][6] + 1;
                elseif (x == 5) then
                    interface.data.progress.gear.empyneed[2][y][7] = interface.data.progress.gear.empyneed[2][y][7] + 1;
                elseif (x == 6) then
                    interface.data.progress.gear.empyneed[2][y][8] = interface.data.progress.gear.empyneed[2][y][8] + 1;
                elseif (x == 7) then
                    interface.data.progress.gear.empyneed[2][y][9] = interface.data.progress.gear.empyneed[2][y][9] + 1;
                elseif (x == 9) or (x == 15) or (x == 18) then
                    interface.data.progress.gear.empyneed[2][y][10] = interface.data.progress.gear.empyneed[2][y][10] + 1;
                elseif (x == 10) then
                    interface.data.progress.gear.empyneed[2][y][11] = interface.data.progress.gear.empyneed[2][y][11] + 1;
                elseif (x == 11) then
                    interface.data.progress.gear.empyneed[2][y][12] = interface.data.progress.gear.empyneed[2][y][12] + 1;
                elseif (x == 12) then
                    interface.data.progress.gear.empyneed[2][y][13] = interface.data.progress.gear.empyneed[2][y][13] + 1;
                elseif (x == 13) then
                    interface.data.progress.gear.empyneed[2][y][14] = interface.data.progress.gear.empyneed[2][y][14] + 1;
                elseif (x == 14) then
                    interface.data.progress.gear.empyneed[2][y][15] = interface.data.progress.gear.empyneed[2][y][15] + 1;
                elseif (x == 16) then
                    interface.data.progress.gear.empyneed[2][y][16] = interface.data.progress.gear.empyneed[2][y][16] + 1;
                elseif (x == 17) then
                    interface.data.progress.gear.empyneed[2][y][17] = interface.data.progress.gear.empyneed[2][y][17] + 1;
                elseif (x == 19) then
                    interface.data.progress.gear.empyneed[2][y][18] = interface.data.progress.gear.empyneed[2][y][18] + 1;
                elseif (x == 20) then
                    interface.data.progress.gear.empyneed[2][y][19] = interface.data.progress.gear.empyneed[2][y][19] + 1;
                end
            end
            if interface.data.progress.gear.empyrean[x][y][1] <= 4 then
                interface.data.progress.gear.empyneed[3][y][1] = interface.data.progress.gear.empyneed[3][y][1] + 8;
                interface.data.progress.gear.empyneed[3][y][2] = interface.data.progress.gear.empyneed[3][y][2] + 1;
                if (y == 1) then
                    interface.data.progress.gear.empyneed[3][y][3] = interface.data.progress.gear.empyneed[3][y][3] + 15;
                elseif (y == 2) then
                    interface.data.progress.gear.empyneed[3][y][3] = interface.data.progress.gear.empyneed[3][y][3] + 25;
                elseif (y == 3) then
                    interface.data.progress.gear.empyneed[3][y][3] = interface.data.progress.gear.empyneed[3][y][3] + 15;
                elseif (y == 4) then
                    interface.data.progress.gear.empyneed[3][y][3] = interface.data.progress.gear.empyneed[3][y][3] + 20;
                elseif (y == 5) then
                    interface.data.progress.gear.empyneed[3][y][3] = interface.data.progress.gear.empyneed[3][y][3] + 15;
                end
            end
        end
    end
end

function manager.DisplayEmpyGear()
    imgui.BeginTable('empy gear has', 5, ImGuiTableFlags_Borders);
    for a = 1, #interface.data.progress.gear.empyrean do
        for b = 1, #interface.data.progress.gear.empyrean[a] do
            imgui.TableNextColumn();
            local temp = {interface.data.progress.gear.empyrean[a][b][1]};
            if (imgui.Combo(interface.data.progress.gear.empyrean[a][b][2], temp, 'None\0NQ\0+1\0+2\0lv109\0lv119+1\0')) then
                interface.data.progress.gear.empyrean[a][b][1] = temp[1];
            end
        end
    end
    imgui.EndTable();
    if (imgui.Button('Update Empy Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        interface.manager.UpdateEmpyGear();
    end
    imgui.SameLine();
    imgui.ProgressBar(interface.data.progress.gear.empyProgress[1]);
end

function manager.DisplayEmpyBaseGearNeed()
    imgui.BeginTable('empy seals need', 12, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SEALS');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HEAD');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BODY');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HANDS');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'LEGS');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'FEET');imgui.TableNextColumn();
        imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HEAD');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BODY');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HANDS');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'LEGS');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'FEET');imgui.TableNextColumn();
        for j = 1, #interface.defaults.jobsabrv do
            imgui.Text(interface.defaults.jobsabrv[j]);imgui.TableNextColumn();
            for p = 1, #interface.data.progress.gear.empyrean[j] do
                if (interface.data.progress.gear.empyrean[j][p][1] <= 1) then
                    if (p == 2) then
                        imgui.Text('10');imgui.TableNextColumn();
                    else
                        imgui.Text('8');
                        if (j == #interface.defaults.jobsabrv) and (p == 5) then 
                        else imgui.TableNextColumn() end
                    end
                else
                    imgui.Text('0');
                    if (j == #interface.defaults.jobsabrv) and (p == 5) then 
                    else imgui.TableNextColumn() end
                end
            end
        end
    imgui.EndTable();

    imgui.BeginTable('empy head need', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HEAD NEEDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'STONE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'JEWEL');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'CARD');imgui.TableNextColumn();
        imgui.Text('Vision');imgui.TableNextColumn();
        imgui.Text('WAR/WHM/THF/BRD/RNG');imgui.TableNextColumn();
        imgui.Text('MNK/RDM/SAM/COR/PUP');imgui.TableNextColumn();
        imgui.Text('BLM/DRK/BST/NIN/SMN');imgui.TableNextColumn();
        imgui.Text('PLD/DRG/BLU/DNC/SCH');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[1][1] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[1][1][i]));
            if i ~= #interface.data.progress.gear.empyneed[1][1] then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('empy body need', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BODY NEEDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'STONE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'JEWEL');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'CARD');imgui.TableNextColumn();
        imgui.Text('Ardor');imgui.TableNextColumn();
        imgui.Text('WAR/PLD/BRD/NIN/BLU');imgui.TableNextColumn();
        imgui.Text('BLM/RDM/SAM/PUP/DNC');imgui.TableNextColumn();
        imgui.Text('THF/DRK/RNG/SMN/COR');imgui.TableNextColumn();
        imgui.Text('MNK/WHM/BST/DRG/SCH');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[1][2] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[1][2][i]));
            if i ~= #interface.data.progress.gear.empyneed[1][2] then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('empy hands need', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'HANDS NEEDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'STONE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'JEWEL');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'CARD');imgui.TableNextColumn();
        imgui.Text('Wieldance');imgui.TableNextColumn();
        imgui.Text('WAR/RDM/THF/BST/SCH');imgui.TableNextColumn();
        imgui.Text('MNK/BLM/BRD/SAM/SMN');imgui.TableNextColumn();
        imgui.Text('WHM/DRK/RNG/BLU/DNC');imgui.TableNextColumn();
        imgui.Text('PLD/NIN/DRG/COR/PUP');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[1][3] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[1][3][i]));
            if i ~= #interface.data.progress.gear.empyneed[1][3] then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('empy legs need', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'LEGS NEEDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'STONE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'JEWEL');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'CARD');imgui.TableNextColumn();
        imgui.Text('Balance');imgui.TableNextColumn();
        imgui.Text('WAR/BLM/NIN/BLU/PUP');imgui.TableNextColumn();
        imgui.Text('MNK/BST/RNG/SAM/SCH');imgui.TableNextColumn();
        imgui.Text('RDM/THF/PLD/DRK/BRD');imgui.TableNextColumn();
        imgui.Text('WHM/DRG/SMN/COR/DNC');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[1][4] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[1][4][i]));
            if i ~= #interface.data.progress.gear.empyneed[1][4] then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('empy feet need', 5, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'FEET NEEDS:');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'STONE');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'JEWEL');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COIN');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'CARD');imgui.TableNextColumn();
        imgui.Text('Voyage');imgui.TableNextColumn();
        imgui.Text('WAR/RDM/PLD/SMN/DNC');imgui.TableNextColumn();
        imgui.Text('WHM/THF/BRD/SAM/PUP');imgui.TableNextColumn();
        imgui.Text('MNK/DRK/BLU/COR/SCH');imgui.TableNextColumn();
        imgui.Text('BLM/BST/RNG/NIN/DRG');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[1][5] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[1][5][i]));
            if i ~= #interface.data.progress.gear.empyneed[1][5] then imgui.TableNextColumn() end
        end
    imgui.EndTable();
    if (imgui.Button('Update Empy Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        interface.manager.UpdateEmpyGear();
    end
end

function manager.DisplayEmpyReforgedGearNeed()
    imgui.BeginTable('chapters', 11, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Chapters');imgui.TableNextColumn();
        for t = 1, 10 do
            imgui.TextColored(interface.colors.header,'Chap. ' .. t);imgui.TableNextColumn();
        end
        imgui.TableNextColumn();
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[2][i][1]));imgui.TableNextColumn();
        end
        for i = 1, 5 do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[3][i][1]));
            if (i ~= 5) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Phx. Feather');imgui.TableNextColumn();
        imgui.Text('Mal. Fiber');imgui.TableNextColumn();
        imgui.Text('Btl. Blood');imgui.TableNextColumn();
        imgui.Text('Damas. Cloth');imgui.TableNextColumn();
        imgui.Text('Oxblood');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[2] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[2][i][2]));
            if (i ~= #interface.data.progress.gear.empyneed[2]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('109job', 6, ImGuiTableFlags_Borders);
        local names = {'Briareus','Itzpapalotl','Orthrus','Glavoid','Cirein-croin','Alfard','Kukulkan','Carabosse','Dragua','Ulhuadshi','Apademak','Bukhis','Azdaja','Isgebind','Sobek','Chloris','Sedna'};
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv109 Job Items');imgui.TableNextColumn();
        imgui.TableNextRow();imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WAR/DRK');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'MNK');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'WHM');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLM');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RDM');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'THF');imgui.TableNextColumn();
        for x = 3, 8 do
            local count = 0;
            for i = 1, #interface.data.progress.gear.empyneed[2] do
                count = count + interface.data.progress.gear.empyneed[2][i][x];
            end
            imgui.Text(tostring(count) .. '   ' .. names[x-2]);imgui.TableNextColumn();
        end
        imgui.TextColored(interface.colors.header, 'PLD');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BST/SMN/PUP');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BRD');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'RNG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SAM');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'NIN');imgui.TableNextColumn();
        for x = 9, 14 do
            local count = 0;
            for i = 1, #interface.data.progress.gear.empyneed[2] do
                count = count + interface.data.progress.gear.empyneed[2][i][x];
            end
            imgui.Text(tostring(count) .. '   ' .. names[x-2]);imgui.TableNextColumn();
        end
        imgui.TextColored(interface.colors.header, 'DRG');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'BLU');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'COR');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'DNC');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'SCH');imgui.TableNextColumn();
        imgui.TableNextColumn();
        for x = 15, 19 do
            local count = 0;
            for i = 1, #interface.data.progress.gear.empyneed[2] do
                count = count + interface.data.progress.gear.empyneed[2][i][x];
            end
            imgui.Text(tostring(count) .. '   ' .. names[x-2]);
            if x ~= 19 then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('119slot', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Lv119');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet');imgui.TableNextColumn();
        imgui.Text('Slot');imgui.TableNextColumn();
        imgui.Text('Defiant Sweat');imgui.TableNextColumn();
        imgui.Text('Dark Matter');imgui.TableNextColumn();
        imgui.Text('Macuil Horn');imgui.TableNextColumn();
        imgui.Text('Tartarian Chain');imgui.TableNextColumn();
        imgui.Text('Plovid Effluvium');imgui.TableNextColumn();
        imgui.Text('Items');imgui.TableNextColumn();
        for i = 1, #interface.data.progress.gear.empyneed[3] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[3][i][2]));
            if (i ~= #interface.data.progress.gear.empyneed[3]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();

    imgui.BeginTable('119memories', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Total Etched Mems');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Head (15/ea)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Body (25/ea)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Hands (15/ea)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Legs (20/ea)');imgui.TableNextColumn();
        imgui.TextColored(interface.colors.header, 'Feet (15/ea)');imgui.TableNextColumn();
        local count = 0;
        for i = 1, #interface.data.progress.gear.empyneed[3] do
            count = count + interface.data.progress.gear.empyneed[3][i][3];
            if (i == #interface.data.progress.gear.empyneed[3]) then
                imgui.Text(tostring(count));imgui.TableNextColumn();
            end
        end
        for i = 1, #interface.data.progress.gear.empyneed[3] do
            imgui.Text(tostring(interface.data.progress.gear.empyneed[3][i][3]));
            if (i ~= #interface.data.progress.gear.empyneed[3]) then imgui.TableNextColumn() end
        end
    imgui.EndTable();
    if (imgui.Button('Update Empy Gear')) then
        print(chat.header(addon.name) .. chat.message('Updating ... '));
        interface.manager.UpdateEmpyGear();
    end
end

function manager.UpdateAmbuGear()
    for a = 1, #interface.defaults.gear.ambu do
        for b = 1, #interface.defaults.gear.ambu[a] do
            local count = 1;
            if interface.data.progress.gear.ambu[a][b][1] == #interface.defaults.gear.ambu[a][b] then
                count = #interface.defaults.gear.ambu[a][b] + 1;
            elseif interface.data.progress.gear.ambu[a][b][1] == 0 then
            else count = interface.data.progress.gear.ambu[a][b][1] end
            for c = 1, #interface.defaults.gear.ambu[a][b] do
                if (modifind.search(interface.defaults.gear.ambu[a][b][c])) then
                    interface.data.progress.gear.ambu[a][b][1] = c;
                end
            end
        end
    end
end

function manager.DisplayAmbuGear()
    imgui.Spacing();imgui.Spacing();
    for a = 1, #interface.data.progress.gear.ambu do
        for b = 1, #interface.data.progress.gear.ambu[a] do
            imgui.TableNextColumn();
            local temp = {interface.data.progress.gear.ambu[a][b][1]};
            if (imgui.Combo(interface.data.progress.gear.ambu[a][b][2], temp, 'None\0NQ\0+1\0+2\0')) then
                interface.data.progress.gear.ambu[a][b][1] = temp[1];
            end
            if a == 5 then
                imgui.Spacing();imgui.Spacing();imgui.Separator();imgui.Spacing();imgui.Spacing();
            end
        end
    end
end

function manager.DisplayAmbuGearNeed()
    local headvouchers = 0;local bodyvouchers = 0;local handvouchers = 0;local legvouchers = 0;local feetvouchers = 0;local headtokens = 0;local bodytokens = 0;local handtokens = 0;local legtokens = 0;local feettokens = 0;
    local countmetals = manager.CountItemId(9270);
    local countfibers = manager.CountItemId(9271);
    interface.data.progress.gear.ambuProgress[1] = 0.0;
    local metals = 0;
    local fibers = 0;

    for s = 1, #interface.data.progress.gear.ambu do 
        for p = 1, #interface.data.progress.gear.ambu[s] do
            if (interface.data.progress.gear.ambu[s][p][1] == -1) or (interface.data.progress.gear.ambu[s][p][1] == 0) then
                if (s < 6) then
                    if (p == 1) then
                        headvouchers = headvouchers + 1;
                    elseif (p == 2) then
                        bodyvouchers = bodyvouchers + 1;
                    elseif (p == 3) then
                        handvouchers = handvouchers + 1;
                    elseif (p == 4) then
                        legvouchers = legvouchers + 1;
                    elseif (p == 5) then
                        feetvouchers = feetvouchers + 1;
                    end
                    metals = metals + 15;
                else
                    if (p == 1) then
                        headtokens = headtokens + 1;
                    elseif (p == 2) then
                        bodytokens = bodytokens + 1;
                    elseif (p == 3) then
                        handtokens = handtokens + 1;
                    elseif (p == 4) then
                        legtokens = legtokens + 1;
                    elseif (p == 5) then
                        feettokens = feettokens + 1;
                    end
                    fibers = fibers + 15;
                end
            elseif (interface.data.progress.gear.ambu[s][p][1] == 1) then
                if (s < 6) then
                    metals = metals + 15;
                else
                    fibers = fibers + 15;
                end
            elseif (interface.data.progress.gear.ambu[s][p][1] == 2) then
                if (s < 6) then
                    metals = metals + 10;
                else
                    fibers = fibers + 10;
                end
            end
        end
    end
    interface.data.progress.gear.ambuProgress[1] = (750-(fibers+metals))/750;
    if countmetals > metals then
        metals = 0;
    else
        metals = metals - countmetals;
    end
    if countfibers > fibers then
        fibers = 0;
    else
        fibers = fibers - countfibers;
    end

    

    imgui.TableNextRow(ImGuiTableRowFlags_Headers);
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Ambu Gear Slips Need:');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Head');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Body');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Hands');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Legs');
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Feet');
                        
    imgui.TableNextColumn();imgui.Text('A. Vouchers:');
    imgui.TableNextColumn();imgui.Text(tostring(headvouchers));
    imgui.TableNextColumn();imgui.Text(tostring(bodyvouchers));
    imgui.TableNextColumn();imgui.Text(tostring(handvouchers));
    imgui.TableNextColumn();imgui.Text(tostring(legvouchers));
    imgui.TableNextColumn();imgui.Text(tostring(feetvouchers));

    imgui.TableNextColumn();imgui.Text('A. Tokens:');
    imgui.TableNextColumn();imgui.Text(tostring(headtokens));
    imgui.TableNextColumn();imgui.Text(tostring(bodytokens));
    imgui.TableNextColumn();imgui.Text(tostring(handtokens));
    imgui.TableNextColumn();imgui.Text(tostring(legtokens));
    imgui.TableNextColumn();imgui.Text(tostring(feettokens));

    imgui.TableNextRow(ImGuiTableRowFlags_Headers);
    imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Upgrade Items Need:');
    imgui.TableNextColumn();
    imgui.TableNextColumn();
    imgui.TableNextColumn();
    imgui.TableNextColumn();
    imgui.TableNextColumn();

    imgui.TableNextColumn();imgui.Text('Abdhaljs Metals:');
    imgui.TableNextColumn();imgui.Text(tostring(metals));
    imgui.TableNextColumn();imgui.TableNextColumn();imgui.TableNextColumn();imgui.TableNextColumn();

    imgui.TableNextColumn();imgui.Text('Abdhaljs Fibers:');
    imgui.TableNextColumn();imgui.Text(tostring(fibers));
end

function manager.UpdateGear()
	manager.UpdateAmbuGear();
    manager.UpdateEmpyGear();
    manager.UpdateRelicGear();
    manager.UpdateAFGear();
end

function manager.DisplayHallmarks()
    local total = 0;
    for k,v in pairs(interface.data.points.hallmarks) do
        if (v[1] == false) then
            total = total + v[2];
        end
    end

    imgui.Spacing();
    imgui.TextColored(interface.colors.header, 'NEEDED HALLMARK POINTS:');imgui.SameLine();imgui.Text('    ' .. interface.manager.comma_value(total) .. '    ');
    imgui.Spacing();imgui.Separator();imgui.Spacing();

    imgui.BeginTable('Weps', 8, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Wep Items');imgui.TableNextRow();imgui.TableNextColumn(); 
        imgui.Checkbox('Nuggets', interface.data.points.hallmarks.nuggets);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[2] == 0) then interface.data.points.hallmarks.nuggets[1] = true end
            if (interface.data.points.hallmarks.nuggets[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.nuggets[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Gems', interface.data.points.hallmarks.gems);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[3] == 0) then interface.data.points.hallmarks.gems[1] = true end
            if (interface.data.points.hallmarks.gems[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.gems[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Animas', interface.data.points.hallmarks.animas);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[4] == 0) then interface.data.points.hallmarks.animas[1] = true end
            if (interface.data.points.hallmarks.animas[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.animas[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Matters', interface.data.points.hallmarks.matters);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[5] == 0) then interface.data.points.hallmarks.matters[1] = true end
            if (interface.data.points.hallmarks.matters[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.matters[2])));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    imgui.BeginTable('Capes', 10, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Cape Items');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('Threads(40)', interface.data.points.hallmarks.threads);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.threads[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.threads[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Dusts(40)', interface.data.points.hallmarks.dusts);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.dusts[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.dusts[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Saps(40)', interface.data.points.hallmarks.saps);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.saps[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.saps[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Dyes(15)', interface.data.points.hallmarks.dyes);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.dyes[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.dyes[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Resins(10)', interface.data.points.hallmarks.resins);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.resins[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.resins[2])));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    imgui.BeginTable('DynaCurrency', 6, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Dyna Currency');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('1 Byne(150)', interface.data.points.hallmarks.bynes1);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.bynes1[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.hallmarks.bynes1[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('O.Bronze(150)', interface.data.points.hallmarks.bronze1);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.bronze1[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.hallmarks.bronze1[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('T.Shells(150)', interface.data.points.hallmarks.shells1);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.shells1[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.hallmarks.shells1[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('100Byne(2)', interface.data.points.hallmarks.bynes2);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.bynes2[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.hallmarks.bynes2[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('M.Bronze(2)', interface.data.points.hallmarks.bronze2);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.bronze2[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.hallmarks.bronze2[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('L.Shells(2)', interface.data.points.hallmarks.shells2);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.shells2[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.data.points.hallmarks.shells2[2]));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    imgui.BeginTable('MISC', 8, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'MISC');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('Marrows(2)', interface.data.points.hallmarks.marrows);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.marrows[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.marrows[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Scorias(1)', interface.data.points.hallmarks.scorias);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.scorias[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.scorias[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('R.Dross(3)', interface.data.points.hallmarks.drosses);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.drosses[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.drosses[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('R.Cinders(3)', interface.data.points.hallmarks.cinders);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.cinders[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.cinders[2])));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    imgui.BeginTable('ROCKS', 6, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'ROCKS');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('Plutons(500)', interface.data.points.hallmarks.plutons);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.plutons[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.plutons[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Boulders(500)', interface.data.points.hallmarks.boulders);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.boulders[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.boulders[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Beitetsu(500)', interface.data.points.hallmarks.beitetsu);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.beitetsu[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.beitetsu[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('HPBayld(750)', interface.data.points.hallmarks.baylds);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.baylds[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.baylds[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('HMPs(100)', interface.data.points.hallmarks.hmp);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.hmp[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.hmp[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Alex(750)', interface.data.points.hallmarks.alex);imgui.TableNextColumn();
            if (interface.data.points.hallmarks.alex[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.hallmarks.alex[2])));
            end
    imgui.EndTable();
end

function manager.DisplayGallantry()
    local total = 0;
    for k,v in pairs(interface.data.points.gallantry) do
        if (v[1] == false) then
            total = total + v[2];
        end
    end

    imgui.Spacing();
    imgui.TextColored(interface.colors.header, 'NEEDED GALLANTRY POINTS:');imgui.SameLine();imgui.Text('    ' .. interface.manager.comma_value(total) .. '    ');
    imgui.Spacing();imgui.Separator();imgui.Spacing();

    imgui.BeginTable('Weps', 8, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Wep Items');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('Nuggets(5)', interface.data.points.gallantry.nuggets);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[2] == 0) then interface.data.points.gallantry.nuggets[1] = true end
            if (interface.data.points.gallantry.nuggets[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.nuggets[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Gems(5)', interface.data.points.gallantry.gems);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[3] == 0) then interface.data.points.gallantry.gems[1] = true end
            if (interface.data.points.gallantry.gems[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.gems[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Animas(5)', interface.data.points.gallantry.animas);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[4] == 0) then interface.data.points.gallantry.animas[1] = true end
            if (interface.data.points.gallantry.animas[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.animas[2])));imgui.TableNextColumn();
            end
        imgui.Checkbox('Matters(5)', interface.data.points.gallantry.matters);imgui.TableNextColumn();
            if (interface.data.progress.weapons.ambuWepItems[5] == 0) then interface.data.points.gallantry.matters[1] = true end
            if (interface.data.points.gallantry.matters[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.matters[2])));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    imgui.BeginTable('Capes', 12, ImGuiTableFlags_Borders);
    imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Cape Items');imgui.TableNextRow();imgui.TableNextColumn();
        imgui.Checkbox('Threads(20)', interface.data.points.gallantry.threads);imgui.TableNextColumn();
            if (interface.data.points.gallantry.threads[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.gallantry.threads[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('Dusts(20)', interface.data.points.gallantry.dusts);imgui.TableNextColumn();
            if (interface.data.points.gallantry.dusts[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.gallantry.dusts[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('Saps(10)', interface.data.points.gallantry.saps);imgui.TableNextColumn();
            if (interface.data.points.gallantry.saps[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.gallantry.saps[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('Dyes(5)', interface.data.points.gallantry.dyes);imgui.TableNextColumn();
            if (interface.data.points.gallantry.dyes[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.gallantry.dyes[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('Resins(5)', interface.data.points.gallantry.resins);imgui.TableNextColumn();
            if (interface.data.points.gallantry.resins[1]) then
                imgui.Text('    0');imgui.TableNextColumn();
            else
                imgui.Text(tostring(interface.data.points.gallantry.resins[2]));imgui.TableNextColumn();
            end
        imgui.Checkbox('Needles(2)', interface.data.points.gallantry.needles);imgui.TableNextColumn();
            if (interface.data.points.gallantry.needles[1]) then
                imgui.Text('    0');
            else
                imgui.Text(tostring(interface.data.points.gallantry.needles[2]));
            end
    imgui.EndTable();

    imgui.Spacing();imgui.Separator();imgui.Spacing();
    local month = {interface.data.points.gallantry.month[1],};
    if (imgui.Combo('Pick the current gallantry month', month, ' \0Relic\0Mythic\0Empyrean\0')) then
        if (month[1] == 0) then
            month[1] = interface.data.points.gallantry.month[1];
        else
            interface.data.points.gallantry.month[1] = month[1];
        end
        if (interface.data.points.gallantry.month[1] == 1) then
            interface.data.points.gallantry.alex[1] = true;interface.data.points.gallantry.baylds[1] = true;interface.data.points.gallantry.beitetsu[1] = true;interface.data.points.gallantry.scorias[1] = true;
            interface.data.points.gallantry.drosses[1] = true;interface.data.points.gallantry.cinders[1] = true;interface.data.points.gallantry.hmp[1] = true;interface.data.points.gallantry.boulders[1] = true;
            interface.data.points.gallantry.plutons[1] = false;interface.data.points.gallantry.marrows[1] = false;interface.data.points.gallantry.bynes1[1] = false;interface.data.points.gallantry.bynes2[1] = false;
            interface.data.points.gallantry.bronze1[1] = false;interface.data.points.gallantry.bronze2[1] = false;interface.data.points.gallantry.shells1[1] = false;interface.data.points.gallantry.shells2[1] = false;
        elseif (interface.data.points.gallantry.month[1] == 2) then
            interface.data.points.gallantry.plutons[1] = true;interface.data.points.gallantry.marrows[1] = true;interface.data.points.gallantry.bynes1[1] = true;interface.data.points.gallantry.bynes2[1] = true;
            interface.data.points.gallantry.bronze1[1] = true;interface.data.points.gallantry.bronze2[1] = true;interface.data.points.gallantry.shells1[1] = true;interface.data.points.gallantry.shells2[1] = true;
            interface.data.points.gallantry.drosses[1] = true;interface.data.points.gallantry.cinders[1] = true;interface.data.points.gallantry.hmp[1] = true;interface.data.points.gallantry.boulders[1] = true;
            interface.data.points.gallantry.alex[1] = false;interface.data.points.gallantry.baylds[1] = false;interface.data.points.gallantry.beitetsu[1] = false;interface.data.points.gallantry.scorias[1] = false;
        elseif (interface.data.points.gallantry.month[1] == 2) then
            interface.data.points.gallantry.plutons[1] = true;interface.data.points.gallantry.marrows[1] = true;interface.data.points.gallantry.bynes1[1] = true;interface.data.points.gallantry.bynes2[1] = true;
            interface.data.points.gallantry.bronze1[1] = true;interface.data.points.gallantry.bronze2[1] = true;interface.data.points.gallantry.shells1[1] = true;interface.data.points.gallantry.shells2[1] = true;
            interface.data.points.gallantry.alex[1] = true;interface.data.points.gallantry.baylds[1] = true;interface.data.points.gallantry.beitetsu[1] = true;interface.data.points.gallantry.scorias[1] = true;
            interface.data.points.gallantry.drosses[1] = false;interface.data.points.gallantry.cinders[1] = false;interface.data.points.gallantry.hmp[1] = false;interface.data.points.gallantry.boulders[1] = false;
        end
    end
    imgui.Spacing();imgui.Separator();imgui.Spacing();
    
    if (interface.data.points.gallantry.month[1] == 1) then
        imgui.BeginTable('Relics', 6, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Relics');imgui.TableNextRow();imgui.TableNextColumn();
            imgui.Checkbox('1 Byne', interface.data.points.gallantry.bynes1);imgui.TableNextColumn();
                if (interface.data.points.gallantry.bynes1[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.bynes1[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('O.Bronze', interface.data.points.gallantry.bronze1);imgui.TableNextColumn();
                if (interface.data.points.gallantry.bronze1[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.bronze1[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('T.Shells', interface.data.points.gallantry.shells1);imgui.TableNextColumn();
                if (interface.data.points.gallantry.shells1[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.shells1[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('100Byne', interface.data.points.gallantry.bynes2);imgui.TableNextColumn();
                if (interface.data.points.gallantry.bynes2[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.bynes2[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('M.Bronze', interface.data.points.gallantry.bronze2);imgui.TableNextColumn();
                if (interface.data.points.gallantry.bronze2[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.bronze2[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('L.Shells', interface.data.points.gallantry.shells2);imgui.TableNextColumn();
                if (interface.data.points.gallantry.shells2[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.shells2[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Plutons', interface.data.points.gallantry.plutons);imgui.TableNextColumn();
                if (interface.data.points.gallantry.plutons[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.plutons[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Marrows', interface.data.points.gallantry.marrows);imgui.TableNextColumn();
                if (interface.data.points.gallantry.marrows[1]) then
                    imgui.Text('    0');
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.marrows[2])));
                end
        imgui.EndTable();
    elseif (interface.data.points.gallantry.month[1] == 2) then
        imgui.BeginTable('Mythics', 8, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Mythics');imgui.TableNextRow();imgui.TableNextColumn();
            imgui.Checkbox('Alex()', interface.data.points.gallantry.alex);imgui.TableNextColumn();
                if (interface.data.points.gallantry.alex[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.alex[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('HP Bayld(375)', interface.data.points.gallantry.baylds);imgui.TableNextColumn();
                if (interface.data.points.gallantry.baylds[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.baylds[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Beitetsu(250)', interface.data.points.gallantry.beitetsu);imgui.TableNextColumn();
                if (interface.data.points.gallantry.beitetsu[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.beitetsu[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Scorias(1)', interface.data.points.gallantry.scorias);imgui.TableNextColumn();
                if (interface.data.points.gallantry.scorias[1]) then
                    imgui.Text('    0');
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.scorias[2])));
                end
        imgui.EndTable();
    elseif (interface.data.points.gallantry.month[1] == 3) then
        imgui.BeginTable('Empys', 8, ImGuiTableFlags_Borders);
        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Empyreans');imgui.TableNextRow();imgui.TableNextColumn();
            imgui.Checkbox('R.Dross', interface.data.points.gallantry.drosses);imgui.TableNextColumn();
                if (interface.data.points.gallantry.drosses[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.drosses[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Cinders', interface.data.points.gallantry.cinders);imgui.TableNextColumn();
                if (interface.data.points.gallantry.cinders[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.cinders[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('Boulders', interface.data.points.gallantry.boulders);imgui.TableNextColumn();
                if (interface.data.points.gallantry.boulders[1]) then
                    imgui.Text('    0');imgui.TableNextColumn();
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.boulders[2])));imgui.TableNextColumn();
                end
            imgui.Checkbox('HMP', interface.data.points.gallantry.hmp);imgui.TableNextColumn();
                if (interface.data.points.gallantry.hmp[1]) then
                    imgui.Text('    0');
                else
                    imgui.Text(tostring(interface.manager.comma_value(interface.data.points.gallantry.hmp[2])));
                end
        imgui.EndTable();
    end
    
end

function manager.ResetAMBU()
    interface.manager.UpdateAmbuWeps();
    interface.data.points = interface.data.points:merge(interface.defaults.points, true);
end

function manager.comma_value(n) --credit--http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

function manager.Test()
    --print(tostring(modifind.search(23468)));
    --interface.manager.CountEmpyGear();
    print(tostring(AshitaCore:GetMemoryManager():GetInventory():GetContainerUpdateFlags()));
end

return manager;