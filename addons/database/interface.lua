interface = {
    manager = require('manager'),
    settings = require('settings'),
    is_open = { true, },

    defaults = T{
        jobs = T{
        },

        progress = T{
            jobs = {0.0,0.0,0.0,0.0},
        },

        ids = T{
            weapons = {
                relic = {},
                empyrean = {},
                mythic = {},
                aeonic = {},
                dynastage2 = {},
                dynastage3 = {},
                dynastage4 = {},
            },
        },

        gear = T{
            relic = {},
            empyrean = {},
            af = {},
        },

        weapons = T{
            relic = {},
            empyrean = {},
            mythic = {},
            aeonic = {},
        },
    },
};

colors = {
    error = { 1.0, 0.4, 0.4, 1.0 },
    header = { 1.0, 0.65, 0.26, 1.0 },
    warning = { 0.9, 0.9, 0.0, 1.0 },
    text1 = { 0.2, 0.9, 0.0, 1.0 }, --bright green
    text2 = { 0.5, 0.9, 1.0, 1.0 }, --light blue
};

function interface.load()
    interface.data = interface.settings.load(interface.defaults);

    interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.data = s;
        end
        interface.settings.save();
    end);

    interface.manager.UpdateDynaWeapons();
    interface.manager.UpdateRelicWeapons();
    interface.manager.UpdateEmpyreanWeapons();
    interface.manager.UpdateJobs();
end

function interface.unload()
    interface.settings.save();
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
        imgui.BeginChild('weapons_tab', { 0, 400 }, true);
            if (imgui.BeginTabBar('weapons_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('RELICS', nil)) then
                        imgui.BeginTable('relics table', 10, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 2');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 3');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 4');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 5');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Complete');


                        interface.manager.DisplayRelics();
                    imgui.EndTable();

                    if (imgui.Button('Update Relic Weapons')) then
                        interface.manager.UpdateRelicWeapons();
                    end
                    imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('MYTHICS', nil)) then
                    imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('EMPYREANS', nil)) then
                    imgui.BeginTable('empys table', 9, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Abyssea 1');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Abyssea 2');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Abyssea 3');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'HMP');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, '60 Rifts');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, '300 Rocks');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, '10K Rocks');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Complete');

                        interface.manager.DisplayEmpyreans();
                    imgui.EndTable();

                    if (imgui.Button('Update Empyrean Weapons')) then
                        interface.manager.UpdateEmpyreanWeapons();
                    end
                imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('AEONICS', nil)) then
                    imgui.EndTabItem();
                end
            imgui.EndTabBar();
            end
        imgui.EndChild();

        
    imgui.EndGroup();

    imgui.BeginGroup();
        imgui.BeginChild('Weapon Totals', { 0, -5 }, true);
            imgui.BeginTable('totals table', 1);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);imgui.TableNextColumn();
                        imgui.TextColored(colors.header, 'TOTALS');imgui.TableNextColumn();
                    imgui.EndTable();
                    imgui.EndTabItem();
        imgui.EndChild();
    imgui.EndGroup();
end


function interface.render()
    if (not interface.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize({ 900, 700, });
    imgui.SetNextWindowSizeConstraints({ 900, 700, }, { FLT_MAX, FLT_MAX, });
    if (imgui.Begin('Database', interface.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.BeginTabBar('database_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            if (imgui.BeginTabItem('JOBS', nil)) then
                interface.renderJobPointsTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('WEAPONS', nil)) then
                interface.renderWeaponsTab();
                imgui.EndTabItem();
            end
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

return interface;