interface = T{
    manager = require('manager'),
    settings = require('settings'),
    is_open = { true, },
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

                    interface.manager.DisplayRelics();

                    if (imgui.Button('Update Relics')) then
                        print(chat.header(addon.name) .. chat.message('Updating Relics'));
                        interface.manager.UpdateRelics();
                    end
                imgui.EndTabItem();
                end

                if (imgui.BeginTabItem('MYTHICS', nil)) then

                    interface.manager.DisplayMythics();

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
                    imgui.Spacing();imgui.Spacing();

                    interface.manager.DisplayEmpyreans();
                    
                    imgui.Spacing();imgui.Spacing();
                    
                    interface.manager.DisplayEmpyreanNeeds();

                    if (imgui.Button('Update Empyreans')) then
                        print(chat.header(addon.name) .. chat.message('Updated Empyreans'));
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
                        print(chat.header(addon.name) .. chat.message('Updated Ambu Weapons'));
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

                if (imgui.BeginTabItem('UNITY', nil)) then
                imgui.BeginChild('UnityPane', { 0, 600, }, true);
                    if (imgui.BeginTabBar('gear_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
                        if (imgui.BeginTabItem('SCALE', nil)) then
                            interface.manager.DisplayScaleGear();
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