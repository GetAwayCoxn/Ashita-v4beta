interface = T{
    manager = require('manager'),
    settings = require('settings'),
    is_open = { false, },
    progress_defaults = require('progress_defaults'),
    defaults = require('defaults'),
    colors = {
        error = { 1.0, 0.4, 0.4, 1.0 },
        header = { 1.0, 0.65, 0.26, 1.0 },
        warning = { 0.9, 0.9, 0.0, 1.0 },
        text1 = { 0.2, 0.9, 0.0, 1.0 }, --bright green
        text2 = { 0.5, 0.9, 1.0, 1.0 }, --light blue
    },
};

function interface.Load()
    interface.data = interface.settings.load(interface.progress_defaults);

    interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.data = s;
        end
        interface.settings.save();
    end);
    --interface.manager.UpdateWeapons:once(5); --causing nil crash on load in modifind lua
end

function interface.Unload()
    interface.settings.save();
end

function interface.RenderJobPointsTab()
    imgui.BeginGroup();
        imgui.BeginChild('JPpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            interface.manager.DisplayJobs();
        imgui.EndChild();
    imgui.EndGroup();
end

function interface.RenderWeaponsTab()
    imgui.BeginGroup();
        imgui.BeginChild('WeaponsPane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            if (imgui.BeginTabBar('weapons_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                if (imgui.BeginTabItem('RELICS', nil)) then
                    imgui.BeginTable('relics table', #interface.defaults.weapons.relics, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Base Wep');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 2');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 3');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Stage 4');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 75');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Augmented');

                        interface.manager.DisplayRelics();
                    imgui.EndTable();
                    

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('relic needed table', 6, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Relic Need:');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Bynes');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Bronze');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Shells');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Marrows');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Plutons');
                        imgui.TableNextColumn();
                        for a = 1, 5 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.relics[a])));
                        end
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Est. Gils:');
                        for b = 1, 3 do
                            local total = (interface.data.progress.weapons.relics[b] * interface.data.prices.dyna1[b])
                            imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(total)));
                        end
                        for c = 1, 1 do
                            local total = (interface.data.progress.weapons.relics[c+3] * interface.data.prices.misc1[c])
                            imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(total)));
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
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'WEAPONS');
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 75');
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99');
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 I');
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 III');
                            imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Augmented');

                            interface.manager.DisplayMythics();
                        imgui.EndTable();

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('mythic needed table', 4, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Mythic Need:');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Alex');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Mulcibar\'s Scoria');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Beitetsu');
                        imgui.TableNextColumn();
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.mythics[1])));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.mythics[2])));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.mythics[3])));
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Est. Gils:');
                    imgui.EndTable();
                    if (imgui.Button('Update Mythics')) then
                        print(chat.header(addon.name) .. chat.message('Updated Mythics'));
                        interface.manager.UpdateMythics();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('ERGONS', nil)) then
                    imgui.Spacing();
                    
                    interface.manager.DisplayErgons();

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('ergon needed table', 5, ImGuiTableFlags_Borders);
                        interface.manager.DisplayErgonsNeed()
                    imgui.EndTable();

                    if (imgui.Button('Update Ergons')) then
                        print(chat.header(addon.name) .. chat.message('Updated Ergon Weapons'));
                        interface.manager.UpdateErgons();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('EMPYREANS', nil)) then
                    imgui.Spacing();
                    imgui.BeginTable('empyreans table', #interface.defaults.weapons.empyreans, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'WEAPONS');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 80');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 85');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 90');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 95');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv. 99');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 I');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lv.119 III');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Augmented');
                        

                        interface.manager.DisplayEmpyreans();
                    imgui.EndTable();

                    imgui.Spacing();imgui.Spacing();
                    imgui.BeginTable('aby1 needed table', 8, ImGuiTableFlags_Borders);
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Abyssea Need:');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Chloris');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Glavoid');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Briareus');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Cara');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Fistule');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Kukulkan');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Iron Plates');
                        imgui.TableNextColumn();
                        for a = 1, 7 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[a]));
                        end
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Ulhuadshi');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Itzpapalotl');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Sobek');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Lanterns');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Bukhis');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Sedna');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Souls');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'HMP');
                        for b = 8, 14 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[b]));
                        end
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.empyreans[21])));
                        imgui.TableNextRow(ImGuiTableRowFlags_Headers);
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Dragua');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Orthrus');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Apademak');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Isgebind');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Alfard');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Azdaja');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Riftdross');
                        imgui.TableNextColumn();imgui.TextColored(interface.colors.header, 'Riftcinder');
                        for c = 15, 20 do
                            imgui.TableNextColumn();imgui.Text(tostring(interface.data.progress.weapons.empyreans[c]));
                        end
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.empyreans[22])));
                        imgui.TableNextColumn();imgui.Text(tostring(interface.manager.comma_value(interface.data.progress.weapons.empyreans[23])));
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
                            interface.manager.DisplayAFGear();
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('AF NEED', nil)) then 
                            interface.manager.DisplayAFGearNeed();
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('RELIC', nil)) then
                    if (imgui.BeginTabBar('relic_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('RELIC HAVE', nil)) then
                            interface.manager.DisplayRelicGear();
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('RELIC NEED', nil)) then
                            interface.manager.DisplayRelicGearNeed();
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('SHARDS NEED', nil)) then
                            interface.manager.DisplayRelicShardsNeed();
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('EMPYREAN', nil)) then
                    if (imgui.BeginTabBar('empy_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('EMPYREAN HAVE', nil)) then
                            interface.manager.DisplayEmpyGear();
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('EMPYREAN BASE NEED', nil)) then
                            interface.manager.DisplayEmpyBaseGearNeed();
                        imgui.EndTabItem();
                        end
                        if (imgui.BeginTabItem('EMPYREAN REFORGED NEED', nil)) then
                            interface.manager.DisplayEmpyReforgedGearNeed()
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
                    
                    interface.manager.DisplayAmbuGearNeed();
                    
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('ODYSSEY', nil)) then
                imgui.BeginChild('OdyPane', { 0, 600, }, true);
                    if (imgui.BeginTabBar('gear_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('SCALE', nil)) then
                            imgui.BeginTable('scale gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayScaleGear();
                            imgui.EndTable();
                        imgui.EndTabItem();
                        end

                        if (imgui.BeginTabItem('HIDE', nil)) then
                            imgui.BeginTable('hide gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayHideGear();
                            imgui.EndTable();
                        imgui.EndTabItem();
                        end

                        if (imgui.BeginTabItem('WING', nil)) then
                            imgui.BeginTable('wing gear has', 5, ImGuiTableFlags_Borders);
                                interface.manager.DisplayWingGear();
                            imgui.EndTable();
                        imgui.EndTabItem();
                        end
                    imgui.EndTabBar();
                    end
                imgui.EndChild();
                imgui.EndTabItem();
                end
            
            imgui.EndTabBar();
            end
        imgui.EndChild();

        if (imgui.Button('Test')) then
            interface.manager.Test();
        end
    imgui.EndGroup();
end

function interface.RenderAMBUPointsTab()
    imgui.BeginGroup();
        imgui.BeginChild('AMBUPointsPane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
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
        if (imgui.Button('Reset Monthly AMBU')) then
            interface.manager.ResetAMBU();
        end
        imgui.SameLine();imgui.ShowHelp('Click to reset to default, cannot undo this action, this will also update the AMBU weapons section');
    imgui.EndGroup();
end

function interface.RenderPricesTab()
    --[[imgui.TextColored(interface.colors.header,'Bynes                           Bronze                         Shells');
    imgui.InputInt3('dyna1', interface.data.prices.dyna1);
    imgui.TextColored(interface.colors.header,'Plutons                         Boulders                       Beitetsu');
    imgui.InputInt3(' ', interface.data.prices.rocks);
    imgui.TextColored(interface.colors.header,'Marrows                         Scorias                        HMP');
    imgui.InputInt3('  ', interface.data.prices.misc1);
    imgui.TextColored(interface.colors.header,'Rift Cinders                                    Rift Dross');
    imgui.InputInt2('    ', interface.data.prices.rifts);
    imgui.TextColored(interface.colors.header,'H-P Bayld                                       Sad Crystals');
    imgui.InputInt2('     ', interface.data.prices.misc2);]]
    -- Left Side (Many whelps, handle it!!)
    imgui.BeginGroup();
        imgui.BeginChild('leftpane', { 230, -imgui.GetFrameHeightWithSpacing(), }, true);
        imgui.EndChild();
    imgui.EndGroup();
    imgui.SameLine();

    imgui.BeginGroup();
        imgui.BeginChild('rightpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.BeginChild('rightpane_items', {0,150}, true);
            imgui.EndChild();
        imgui.EndChild();
    imgui.EndGroup();
end


function interface.Render()
    if (not interface.is_open[1]) or (AshitaCore:GetMemoryManager():GetPlayer():GetIsZoning() ~= 0) then
        return;
    end

    imgui.SetNextWindowSize({ 1000, 730, });
    imgui.SetNextWindowSizeConstraints({ 1000, 720, }, { FLT_MAX, FLT_MAX, });
    if (imgui.Begin('Database', interface.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.BeginTabBar('##database_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            if (imgui.BeginTabItem('JOBS', nil)) then
                interface.RenderJobPointsTab();
                interface.manager.UpdateJobs();
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
            if (imgui.BeginTabItem('AMBU POINTS', nil)) then
                interface.RenderAMBUPointsTab();
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