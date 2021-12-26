interface = {
    manager = require('manager'),
    --settings = require('settings'),
    is_open = { true, },

    defaults = require('defaults'),
};

colors = {
    error = { 1.0, 0.4, 0.4, 1.0 },
    header = { 1.0, 0.65, 0.26, 1.0 },
    warning = { 0.9, 0.9, 0.0, 1.0 },
    text1 = { 0.2, 0.9, 0.0, 1.0 }, --bright green
    text2 = { 0.5, 0.9, 1.0, 1.0 }, --light blue
};

function interface.load()
    interface.data = interface.defaults;--interface.settings.load(interface.defaults);

    --[[interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.data = s;
        end
        interface.settings.save();
    end);]]

    interface.manager.UpdateJobs();
    --interface.manager.UpdateWeapons();
end

function interface.unload()
    --interface.settings.save();
end

function interface.renderJobPointsTab()
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
            interface.manager.UpdateJobs();
        end
    imgui.EndGroup();
end

function interface.renderWeaponsTab()
    imgui.BeginGroup();
        imgui.BeginChild('weapons_top', { 0, 400 }, true);
            if (imgui.BeginTabBar('weapons_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('RELICS', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('relics table', #interface.data.weapons.relics, ImGuiTableFlags_Borders);
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
                    imgui.EndTabItem();

                    imgui.Spacing();imgui.Spacing();
                    if (imgui.Button('Update Weapons')) then
                        interface.manager.UpdateWeapons();
                    end
                end


                if (imgui.BeginTabItem('MYTHICS', nil)) then
                    imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('EMPYREANS', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('relics table', #interface.data.weapons.empyreans, ImGuiTableFlags_Borders);
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
                    imgui.EndTabItem();

                    imgui.Spacing();
                    if (imgui.Button('Update Weapons')) then
                        interface.manager.UpdateWeapons();
                    end
                imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('AEONICS', nil)) then
                    imgui.EndTabItem();
                end
            imgui.EndTabBar();
            end
        imgui.EndChild();

        imgui.BeginChild('weapons _bottom', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.BeginTable('relic needed table', 6, ImGuiTableFlags_Borders);
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Relic Need:');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bynes');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bronze');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Shells');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Marrows');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Plutons');
                imgui.TableNextColumn();
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.relics[1]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.relics[2]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.relics[3]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.relics[4]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.relics[5]));
                --imgui.TableNextColumn();imgui.TextColored(colors.header, 'Est. Gils:');
            imgui.EndTable();
            imgui.Spacing();
            imgui.BeginTable('mythic needed table', 5, ImGuiTableFlags_Borders);
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Mythic Need:');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Alex');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Mulcibar\'s Scoria');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Beitetsu');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'HMP');
            imgui.EndTable();
            imgui.Spacing();
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
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[1]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[2]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[3]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[4]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[5]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[6]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[7]));
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Ulhuadshi');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Itzpapalotl');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Sobek');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lanterns');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Bukhis');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Sedna');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Souls');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'HMP');
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[8]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[9]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[10]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[11]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[12]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[13]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[14]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[21]));
                imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Dragua');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Orthrus');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Apademak');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Isgebind');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Alfard');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Azdaja');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Riftdross');
                imgui.TableNextColumn();imgui.TextColored(colors.header, 'Riftcinder');
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[15]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[16]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[17]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[18]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[19]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[20]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[22]));
                imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.empyreans[23]));
            imgui.EndTable();
        imgui.EndChild();
    imgui.EndGroup();
end

function interface.renderPricesTab()
    imgui.InputInt3('Dyna Currency', interface.data.prices.dyna);
end


function interface.render()
    if (not interface.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize({ 900, 700, });
    imgui.SetNextWindowSizeConstraints({ 900, 700, }, { FLT_MAX, FLT_MAX, });
    if (imgui.Begin('Data', interface.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.BeginTabBar('##database_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            if (imgui.BeginTabItem('JOBS', nil)) then
                interface.renderJobPointsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('WEAPONS', nil)) then
                interface.renderWeaponsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('PRICES', nil)) then
                interface.renderPricesTab();
                imgui.EndTabItem();
            end
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

return interface;