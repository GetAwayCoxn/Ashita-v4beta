interface = {
    manager = require('manager'),
    --settings = require('settings'),
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

        acquired = T{
            gear = T{},
            weapons = T{
                relics = T{
                    ['Spharai'] = {false,false,false,false,false,false,false,false,false,false},
                },
            },
        },

        weapons = T{
            --[[relics = T{
                {'Spharai',18260,18261,18262,18263,18651,18665,19746,20480,20509,0},
                {'Mandau',18266,18267,18268,18269,18652,18666,19747,20555,20583,0},
                {'Excalibur',18272,18273,18274,18275,18653,18667,19748,20645,20685,0},
                {'Ragnarok',18278,18279,18280,18281,18654,18668,19749,20745,21683,0},
                {'Guttler',18284,18285,18286,18287,18655,18669,19750,20790,21750,0},
                {'Bravura',18290,18291,18292,18293,18656,18670,19751,20835,21756,0},
                {'Apocalypse',18302,18303,18304,18305,18658,18672,19753,20880,21808,0},
                {'Gungnir',18296,18297,18298,18299,18657,18671,19752,20925,21857,0},
                {'Kikoku',18308,18309,18310,18311,18659,18673,19754,20970,21906,0},
                {'Amanomurakumo',18314,18315,18316,18317,18660,18674,19755,21015,21954,0},
                {'Mjollnir',18320,18321,18322,18323,18661,18675,19756,21060,21077,0},
                {'Claustrum',18326,18327,18328,18329,18662,18676,19757,21135,22060,0},
                {'Yoichinoyumi',18344,18345,18346,18347,18664,18678,19759,21210,22115,0},
                {'Annihilator',18332,18333,18334,18335,18663,18677,19758,21260,21267,0},
                {'Gjallarhorn',18338,18339,18340,18341,18342,18577,18578,18579,18580,18840},
                {'Aegis',15066,15067,15068,15069,15070,16195,16196,16197,16198,16200},
            },]]
            relics = T{ --{name, has, bynes, bronze, shells} (first key should all be names and 0's)
                {{'Spharai',0,0,0,0},{'Mandau',0,0,0,0},{'Excalibur',0,0,0,0},{'Ragnarok',0,0,0,0},{'Guttler',0,0,0,0},{'Bravura',0,0,0,0},{'Apocalypse',0,0,0,0},{'Gungnir',0,0,0,0},{'Kikoku',0,0,0,0},{'Amanomurakumo',0,0,0,0},{'Mjollnir',0,0,0,0},{'Claustrum',0,0,0,0},{'Yoichinoyumi',0,0,0,0,},{'Annihilator',0,0,0,0},{'Gjallarhorn',0,0,0,0},{'Aegis',0,0,0,0},},
                {{18260,false,0,0,0},{18266,false,0,0,0},{18272,false,0,0,0},{18278,false,0,0,0},{18284,false,0,0,0},{18290,false,0,0,0},{18302,false,0,0,0},{18296,false,0,0,0},{18308,false,0,0,0},{18314,false,0,0,0},{18320,false,0,0,0},{18326,false,0,0,0},{18344,false,0,0,0},{18332,false,0,0,0},{18338,false,0,0,0},{15066,false,0,0,0},},
                {{18261,false,0,0,0},{18267,false,0,0,0},{18273,false,0,0,0},{18279,false,0,0,0},{18285,false,0,0,0},{18291,false,0,0,0},{18303,false,0,0,0},{18297,false,0,0,0},{18309,false,0,0,0},{18315,false,0,0,0},{18321,false,0,0,0},{18327,false,0,0,0},{18345,false,0,0,0},{18333,false,0,0,0},{18339,false,0,0,0},{15067,false,0,0,0},},
                {{18262,false,0,0,0},{18268,false,0,0,0},{18274,false,0,0,0},{18280,false,0,0,0},{18286,false,0,0,0},{18292,false,0,0,0},{18304,false,0,0,0},{18298,false,0,0,0},{18310,false,0,0,0},{18316,false,0,0,0},{18322,false,0,0,0},{18328,false,0,0,0},{18346,false,0,0,0},{18334,false,0,0,0},{18340,false,0,0,0},{15068,false,0,0,0},},
                {{18263,false,0,0,0},{18269,false,0,0,0},{18275,false,0,0,0},{18281,false,0,0,0},{18287,false,0,0,0},{18293,false,0,0,0},{18305,false,0,0,0},{18299,false,0,0,0},{18311,false,0,0,0},{18317,false,0,0,0},{18323,false,0,0,0},{18329,false,0,0,0},{18347,false,0,0,0},{18335,false,0,0,0},{18341,false,0,0,0},{15069,false,0,0,0},},
                {{18651,false,0,0,0},{18652,false,0,0,0},{18653,false,0,0,0},{18654,false,0,0,0},{18655,false,0,0,0},{18656,false,0,0,0},{18658,false,0,0,0},{18657,false,0,0,0},{18659,false,0,0,0},{18660,false,0,0,0},{18661,false,0,0,0},{18662,false,0,0,0},{18664,false,0,0,0},{18663,false,0,0,0},{18342,false,0,0,0},{15070,false,0,0,0},},
                {{18665,false,0,0,0},{18666,false,0,0,0},{18667,false,0,0,0},{18668,false,0,0,0},{18669,false,0,0,0},{18670,false,0,0,0},{18672,false,0,0,0},{18671,false,0,0,0},{18673,false,0,0,0},{18674,false,0,0,0},{18675,false,0,0,0},{18676,false,0,0,0},{18678,false,0,0,0},{18677,false,0,0,0},{18577,false,0,0,0},{16195,false,0,0,0},},
                {{19746,false,0,0,0},{19747,false,0,0,0},{19748,false,0,0,0},{19749,false,0,0,0},{19750,false,0,0,0},{19751,false,0,0,0},{19753,false,0,0,0},{19752,false,0,0,0},{19754,false,0,0,0},{19755,false,0,0,0},{19756,false,0,0,0},{19757,false,0,0,0},{19759,false,0,0,0},{19758,false,0,0,0},{18578,false,0,0,0},{16196,false,0,0,0},},
                {{20480,false,0,0,0},{20555,false,0,0,0},{20645,false,0,0,0},{20745,false,0,0,0},{20790,false,0,0,0},{20835,false,0,0,0},{20880,false,0,0,0},{20925,false,0,0,0},{20970,false,0,0,0},{21015,false,0,0,0},{21060,false,0,0,0},{21135,false,0,0,0},{21210,false,0,0,0},{21260,false,0,0,0},{18579,false,0,0,0},{16197,false,0,0,0},},
                {{20509,false,0,0,0},{20583,false,0,0,0},{20685,false,0,0,0},{21683,false,0,0,0},{21750,false,0,0,0},{21756,false,0,0,0},{21808,false,0,0,0},{21857,false,0,0,0},{21906,false,0,0,0},{21954,false,0,0,0},{21077,false,0,0,0},{22060,false,0,0,0},{22115,false,0,0,0},{21267,false,0,0,0},{18580,false,0,0,0},{16198,false,0,0,0},},
                {{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{18840,false,0,0,0},{16200,false,0,0,0},}
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
    interface.data = interface.defaults;--interface.settings.load(interface.defaults);

    --[[interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.data = s;
        end
        interface.settings.save();
    end);]]

    interface.manager.UpdateJobs();
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
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 75');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(colors.header, 'Augmented');

                        interface.manager.DisplayRelics();
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