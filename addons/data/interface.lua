interface = {
    manager = require('manager'),
    settings = require('settings'),
    is_open = { true, },
    progress_defaults = require('progress_defaults'),
    defaults = require('defaults'),
};

colors = {
    error = { 1.0, 0.4, 0.4, 1.0 },
    header = { 1.0, 0.65, 0.26, 1.0 },
    warning = { 0.9, 0.9, 0.0, 1.0 },
    text1 = { 0.2, 0.9, 0.0, 1.0 }, --bright green
    text2 = { 0.5, 0.9, 1.0, 1.0 }, --light blue
};

function interface.Load()
    interface.data = interface.settings.load(interface.progress_defaults);

    interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.data = s;
        end
        interface.settings.save();
    end);
    interface.manager.UpdateJobs:once(1);
end

function interface.Unload()
    interface.settings.save();
end

function interface.RenderJobPointsTab()
    imgui.BeginGroup();
        imgui.BeginChild('JPpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.BeginTable('jobs table', 5, ImGuiTableFlags_Borders);
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'JOB');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Job Level');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Job Points Spent');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Master Level');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Job Points Current');

                interface.manager.DisplayJobs();
            imgui.EndTable();

            imgui.Separator();imgui.Spacing();
            imgui.BeginTable('totals table', 1);
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
                imgui.TextColored(colors.header, 'TOTALS');imgui.TableNextColumn();
                imgui.TextColored(colors.text1, 'Total JOB Level Completion:');imgui.TableNextColumn();
                imgui.ProgressBar(interface.data.progress.jobs[1], 10);imgui.TableNextColumn();
                imgui.TextColored(colors.text1, 'Total JOB Points Completion:');imgui.TableNextColumn();
                imgui.ProgressBar(interface.data.progress.jobs[2], 10);imgui.TableNextColumn();
                imgui.TextColored(colors.text1, 'Total JOB Master Level Completion:');imgui.TableNextColumn();
                imgui.ProgressBar(interface.data.progress.jobs[3], 10);imgui.TableNextColumn(); 
            imgui.EndTable();

            imgui.Separator();imgui.Spacing();
            imgui.TextColored(colors.text1, 'JOB Points available to spend at Oboro: ');imgui.SameLine();imgui.Text(tostring(interface.data.progress.jobs[4]));
        imgui.EndChild();

        if (imgui.Button('Update Jobs')) then
            print(chat.header(addon.name) .. chat.message('Updating ... '));
            interface.manager.UpdateJobs();
        end
    imgui.EndGroup();
end

function interface.RenderWeaponsTab()
    imgui.BeginGroup();
        imgui.BeginChild('WeaponsPane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            if (imgui.BeginTabBar('weapons_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('RELICS', nil)) then
                    --imgui.Spacing();
                    imgui.BeginTable('relics table', #interface.defaults.weapons.relics, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base Wep');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 2');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 3');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 4');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 75');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Augmented');

                        interface.manager.DisplayRelics();
                    imgui.EndTable();
                    

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('relic needed table', 6, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Relic Need:');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bynes');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bronze');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Shells');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Marrows');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Plutons');
                        imgui.TableNextColumn();
                        for a = 1, 5 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.relics[a]));
                        end
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Est. Gils:');
                        for b = 1, 5 do
                            local total = (interface.data.progress.weapons.relics[b] * interface.data.prices.dyna[b])
                            imgui.TableNextColumn();imgui.Text(tostring(total));
                        end
                    imgui.EndTable();
                    if (imgui.Button('Update Relics')) then
                        print(chat.header(addon.name) .. chat.message('Updating ... '));
                        interface.manager.UpdateRelics();
                    end
                imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('MYTHICS', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('mythics table', #interface.defaults.weapons.mythics, ImGuiTableFlags_Borders);
                            imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 75');
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                            imgui.TableNextColumn();imgui.TextColored(colors.header, 'Augmented');

                            interface.manager.DisplayMythics();
                        imgui.EndTable();

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('mythic needed table', 5, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Mythic Need:');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Alex');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Mulcibar\'s Scoria');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Beitetsu');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'HP Bayld');
                        imgui.TableNextColumn();
                        imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.mythics[1]));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.mythics[2]));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.mythics[3]));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.mythics[4]));
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Est. Gils:');
                    imgui.EndTable();
                    if (imgui.Button('Update Mythics')) then
                        print(chat.header(addon.name) .. chat.message('Updating ... '));
                        interface.manager.UpdateMythics();
                    end
                imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('EMPYREANS', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('empyreans table', #interface.defaults.weapons.empyreans, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 80');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 85');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 90');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Augmented');
                        

                        interface.manager.DisplayEmpyreans();
                    imgui.EndTable();

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('aby1 needed table', 8, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Abyssea Need:');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Chloris');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Glavoid');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Briareus');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Cara');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Fistule');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Kukulkan');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'IronPlates');
                        imgui.TableNextColumn();
                        for a = 1, 7 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[a]));
                        end
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Ulhuadshi');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Itzpapalotl');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Sobek');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lanterns');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bukhis');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Sedna');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Souls');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'HMP');
                        for b = 1, 7 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[b]));
                        end
                        imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[21]));
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Dragua');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Orthrus');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Apademak');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Isgebind');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Alfard');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Azdaja');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Riftdross');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Riftcinder');
                        for c = 1, 8 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[c]));
                        end
                    imgui.EndTable();
                    if (imgui.Button('Update Empyreans')) then
                        print(chat.header(addon.name) .. chat.message('Updating ... '));
                        interface.manager.UpdateEmpyreans();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('AMBUSCADE', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('ambu weps table', 1, ImGuiTableFlags_Borders);
                        interface.manager.DisplayAmbuWeps();
                    imgui.EndTable();
                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('ambu weps need', 6, ImGuiTableFlags_Borders);
                        interface.manager.DisplayAmbuWepsNeed();
                    imgui.EndTable();
                    if (imgui.Button('Update Ambu Weps')) then
                        print(chat.header(addon.name) .. chat.message('Updating ... '));
                        interface.manager.UpdateAmbuWeps();
                    end
                imgui.EndTabItem();
                end

            imgui.EndTabBar();
            end
        imgui.EndChild();

        --[[if (imgui.Button('Update All Weapons')) then
            print(chat.header(addon.name) .. chat.message('Updating ... '));
            interface.manager.UpdateWeapons();
        end
        imgui.SameLine();imgui.ShowHelp('WARNING: This can cause major lag/crash sometimes');]]
        if (imgui.Button('Test')) then
            interface.manager.Test();
        end
    imgui.EndGroup();
end

function interface.RenderGearTab()
    imgui.BeginGroup();
        imgui.BeginChild('GearPane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            if (imgui.BeginTabBar('gear_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('AF', nil)) then
                    if (imgui.BeginTabBar('af_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('AF HAVE', nil)) then
                            imgui.BeginTable('af gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayAFGear();
                            imgui.EndTable();
                            if (imgui.Button('Update AF Gear')) then
                                print(chat.header(addon.name) .. chat.message('Updating ... '));
                                interface.manager.UpdateAFGear();
                            end
                            imgui.SameLine();
                            imgui.ProgressBar(interface.data.progress.gear.afProgress[1],10);
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('AF NEED', nil)) then 
                            if (imgui.BeginTabBar('afneed_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                                if (imgui.BeginTabItem('AFlv109', nil)) then
                                    interface.manager.DisplayAFGearNeed109();
                                imgui.EndTabItem();
                                end
                            imgui.EndTabBar();
                            end
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('RELIC', nil)) then
                    if (imgui.BeginTabBar('relic_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('RELIC HAVE', nil)) then
                            imgui.BeginTable('relic gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayRelicGear();
                            imgui.EndTable();
                            if (imgui.Button('Update Relic Gear')) then
                                print(chat.header(addon.name) .. chat.message('Updating ... '));
                                interface.manager.UpdateRelicGear();
                            end
                            imgui.SameLine();
                            imgui.ProgressBar(interface.data.progress.gear.relicProgress[1],10);
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('RELIC NEED', nil)) then
                            imgui.BeginTable('relic gear need', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayRelicGearNeed();
                            imgui.EndTable();
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('EMPYREAN', nil)) then
                    if (imgui.BeginTabBar('empy_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('EMPYREAN HAVE', nil)) then
                            imgui.BeginTable('empy gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayEmpyGear();
                            imgui.EndTable();
                            if (imgui.Button('Update Empy Gear')) then
                                print(chat.header(addon.name) .. chat.message('Updating ... '));
                                interface.manager.UpdateEmpyGear();
                            end
                            imgui.SameLine();
                            imgui.ProgressBar(interface.data.progress.gear.empyProgress[1],10);
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('EMPYREAN NEED', nil)) then
                            imgui.BeginTable('empy gear need', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayEmpyGearNeed();
                            imgui.EndTable();
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('AMBUSCADE', nil)) then
                    imgui.BeginTable('ambu gear has', 5, ImGuiTableFlags_Borders);
                        interface.manager.DisplayAmbuGear();
                    imgui.EndTable();
                    
                    imgui.Spacing();imgui.Spacing();imgui.Separator();imgui.Spacing();imgui.Spacing();

                    imgui.BeginTable('ambu gear summary table', 1);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
                        imgui.TextColored(colors.header, 'SUMMARY');imgui.TableNextColumn();
                        imgui.TextColored(colors.text1, 'Total AMBU Gear Completion:');imgui.ShowHelp('Inaccurate but close, quick progress calc based on remaining metals/fibers needed');imgui.TableNextColumn();
                        imgui.ProgressBar(interface.data.progress.gear.ambuProgress[1],10);imgui.TableNextColumn();
                    imgui.EndTable();
                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('ambu gear need', 6, ImGuiTableFlags_Borders);
                        interface.manager.DisplayAmbuGearNeed();
                    imgui.EndTable();

                    if (imgui.Button('Update Ambu Gear')) then
                        print(chat.header(addon.name) .. chat.message('Updating ... '));
                        interface.manager.UpdateAmbuGear();
                    end
                imgui.EndTabItem();
                end
            
            imgui.EndTabBar();
            end
        imgui.EndChild();

        --[[if (imgui.Button('Update All Gear')) then
            print(chat.header(addon.name) .. chat.message('Updating ... '));
            interface.manager.UpdateGear();
        end
        imgui.SameLine();imgui.ShowHelp('WARNING: This can cause major lag/crash sometimes');]]
        if (imgui.Button('Test')) then
            interface.manager.Test();
        end
    imgui.EndGroup();
end

function interface.RenderPointsTab()
    imgui.BeginGroup();
        imgui.BeginChild('PointsPane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            if (imgui.BeginTabBar('points_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('HALLMARKS', nil)) then
                    interface.manager.DisplayHallmarks();
                imgui.EndTabItem();
                end
                if (imgui.BeginTabItem('GALLANTRY', nil)) then
                    interface.manager.DisplayGallantry();
                imgui.EndTabItem();
                end
            imgui.EndTabBar();
            end
        imgui.EndChild();
    imgui.EndGroup();
end

function interface.RenderPricesTab()
    imgui.TextColored(colors.header,'Bynes                       Bronze                      Shells');
    imgui.InputInt3('Dyna Currency', interface.data.prices.dyna);
    --imgui.InputText('Test', );
end


function interface.Render()
    if (not interface.is_open[1]) then
        return;
    end

    if (AshitaCore:GetMemoryManager():GetPlayer():GetIsZoning() ~= 0) then
        return;
    end

    imgui.SetNextWindowSize({ 900, 700, });
    imgui.SetNextWindowSizeConstraints({ 900, 700, }, { FLT_MAX, FLT_MAX, });
    if (imgui.Begin('Data', interface.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.BeginTabBar('##database_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            if (imgui.BeginTabItem('JOBS', nil)) then
                interface.RenderJobPointsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('WEAPONS', nil)) then
                interface.RenderWeaponsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('GEAR', nil)) then
                interface.RenderGearTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('POINTS', nil)) then
                interface.RenderPointsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('PRICES', nil)) then
                interface.RenderPricesTab();
                imgui.EndTabItem();
            end
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

return interface;