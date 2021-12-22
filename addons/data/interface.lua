interface = {
    manager = require('manager'),
    settings = require('settings'),
    --defaults = require('defaults'),
    is_open = { true, },

    defaults = T{
        jobs = T{
        },
        progress = T{
            jobs = {0.0,0.0,0.0,0.0},
        },
        gear = T{
            relic = {},
            empyrean = {},
            af = {},
        },

        weapons = T{
            relics = T{
                ['Spharai'] = {18260,18261,18262,18263,18651,18665,19746,20480,20509},
                ['Mandau'] = {18266,18267,18268,18269,18652,18666,19747,20555,20583},
                ['Excalibur'] = {18272,18273,18274,18275,18653,18667,19748,20645,20685},
                ['Ragnarok'] = {18278,18279,18280,18281,18654,18668,19749,20745,21683},
                ['Guttler'] = {18284,18285,18286,18287,18655,18669,19750,20790,21750},
                ['Bravura'] = {18290,18291,18292,18293,18656,18670,19751,20835,21756},
                ['Apocalypse'] = {18302,18303,18304,18305,18658,18672,19753,20880,21808},
                ['Gungnir'] = {18296,18297,18298,18299,18657,18671,19752,20925,21857},
                ['Kikoku'] = {18308,18309,18310,18311,18659,18673,19754,20970,21906},
                ['Amanomurakumo'] = {18314,18315,18316,18317,18660,18674,19755,21015,21954},
                ['Mjollnir'] = {18320,18321,18322,18323,18661,18675,19756,21060,21077},
                ['Claustrum'] = {18326,18327,18328,18329,18662,18676,19757,21135,22060},
                ['Yoichinoyumi'] = {18344,18345,18346,18347,18664,18678,19759,21210,22115},
                ['Annihilator'] = {18332,18333,18334,18335,18663,18677,19758,21260,21267},
                ['Gjallarhorn'] = {18338,18339,18340,18341,18342,18577,18578,18579,18580,18840},
                ['Aegis'] = {15066,15067,15068,15069,15070,16195,16196,16197,16198,16200},
            },
            empyreans = T{
                ['Verethragna'] = {19397,19459,19534,19632,19805,20486,20487,20512},
                ['Twashtar'] = {19398,19457,19535,19633,19806,20563,20564,20587},
                ['Almace'] = {19399,19458,19536,19634,19807,20653,20654,20689},
                ['Caladbolg'] = {19400,19459,19537,19635,19808,20747,20748,21684},
                ['Farsha'] = {19401,19460,19538,19636,19809,20794,20795,21752},
                ['Ukonvasara'] = {19402,19461,19539,19637,19810,20839,20840,21758},
                ['Redemption'] = {19403,19462,19540,19638,19811,20884,20885,21810},
                ['Rhongomiant'] = {19404,19463,19541,19639,19812,20929,20930,21859},
                ['Kannagi'] = {19405,19464,19542,19640,19813,20974,20975,21908},
                ['Masamune'] = {19406,19465,19543,19641,19814,21019,21020,21956},
                ['Gambanteinn'] = {19407,19466,19544,19642,19815,21064,21065,21079},
                ['Hvergelmir'] = {19408,19467,19545,19643,19816,21143,21144,22064},
                ['Gandiva'] = {19409,19468,19546,19644,19817,21212,21213,22116},
                ['Armageddon'] = {19410,19469,19547,19645,19818,21264,21265,21269},
                ['Daurdabla'] = {18573,18574,18575,18576,18571,18839}, -- last stage 3000 cinders for no reason
                ['Ochain'] = {16191,16192,16193,16194,11926,16199}, -- last stage 3000 dross for no reason
            },
            mythics = T{},
            aeonics = T{},
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
                        imgui.BeginTable('relics table', 11, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Base Wep');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 2');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 3');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 4');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Stage 5');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Augmented');

                        --interface.manager.DisplayRelics();
                    imgui.EndTable();
                    
                    imgui.EndTabItem();
                    if (imgui.Button('Update Relic Weapons')) then
                        interface.manager.UpdateRelics();
                    end
                end


                if (imgui.BeginTabItem('MYTHICS', nil)) then
                    imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('EMPYREANS', nil)) then
                imgui.EndTabItem();
                end


                if (imgui.BeginTabItem('AEONICS', nil)) then
                    imgui.EndTabItem();
                end
            imgui.EndTabBar();
            end
        imgui.EndChild();

        
    imgui.EndGroup();
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
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

return interface;