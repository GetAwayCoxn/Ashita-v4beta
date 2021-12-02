require('common');
local chat = require('chat');
local imgui = require('imgui');
local manager = require('manager');
dtables = require('dtables');

interface = {
    settings = require('settings'),

    is_open = { true, },

    jobs = T{[1] ='WAR',[2] ='MNK',[3] ='WHM',[4] ='BLM',[5] ='RDM',[6] ='THF',[7] ='PLD',[8] ='DRK',[9] ='BST',[10] ='BRD',[11] ='RNG',[12] ='SAM',[13] ='NIN',[14] ='DRG',[15] ='SMN',[16] ='BLU',[17] ='COR',[18] ='PUP',[19] ='DNC',[20] ='SCH',[21] ='GEO',[22] ='RUN'},
    
    -- Overlay (Defaults)
    overlay_defaults = T{
        is_open = { true, },
        docking = { 0, },
        padding = { 130.0, 152.0, },
        opacity = { 0.6, },
        show_border = { true, },
        override_background_color = { false, },
        color_background = { 0.0, 0.0, 0.0, 0.0, },
        color_keyitem_missing = { 1.0, 0.3, 0.3, 1.0, },
        color_keyitem_have = { 0.0, 1.0, 0.10, 1.0, },
    },
};

-- Color Variables
local colors = {
    error = { 1.0, 0.4, 0.4, 1.0 },
    header = { 1.0, 0.65, 0.26, 1.0 },
    warn = { 0.9, 0.9, 0.0, 1.0 },
};

--[[
* Loads the interface, preparing it for usage.
--]]
function interface.load()
    -- Load the overlay settings..
    interface.overlay = interface.settings.load(interface.overlay_defaults);

    manager.UpdateJobs();

    -- Register to the settings update event..
    interface.settings.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            interface.overlay = s;
        end
        interface.settings.save();
    end);
end

--[[
* Unloads the interface, cleaning up any of its resources.
--]]
function interface.unload()
    -- Save the current settings..
    interface.settings.save();
end

function interface.renderJobTab()
    imgui.BeginGroup();
        imgui.TextColored(colors.header, 'JOBS');
        imgui.BeginChild('jobpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.TextColored(colors.header, 'Job Level               ');imgui.SameLine();
            imgui.TextColored(colors.header, 'Job Points Spent          ');imgui.SameLine();
            imgui.TextColored(colors.header, 'Mastery Level');imgui.ShowHelp('Only accurate for your current job for now.');
            imgui.InputInt3(interface.jobs[1], dtables.jobs.WAR,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[2], dtables.jobs.MNK,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[3], dtables.jobs.WHM,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[4], dtables.jobs.BLM,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[5], dtables.jobs.RDM,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[6], dtables.jobs.THF,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[7], dtables.jobs.PLD,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[8], dtables.jobs.DRK,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[9], dtables.jobs.BST,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[10], dtables.jobs.BRD,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[11], dtables.jobs.RNG,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[12], dtables.jobs.SAM,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[13], dtables.jobs.NIN,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[14], dtables.jobs.DRG,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[15], dtables.jobs.SMN,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[16], dtables.jobs.BLU,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[17], dtables.jobs.COR,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[18], dtables.jobs.PUP,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[19], dtables.jobs.DNC,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[20], dtables.jobs.SCH,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[21], dtables.jobs.GEO,ImGuiInputTextFlags_ReadOnly);
            imgui.InputInt3(interface.jobs[22], dtables.jobs.RUN,ImGuiInputTextFlags_ReadOnly);
        imgui.EndChild();

        if (imgui.Button('Update Jobs')) then
            manager.UpdateJobs();
        end
    imgui.EndGroup();
end

function interface.renderRelicTab()
    imgui.BeginGroup();
        imgui.TextColored(colors.header, 'Relic Gear');
        imgui.BeginChild('jobpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.BeginMenuBar();
            imgui.BeginMenu('test', true);
            imgui.EndMenu();
            imgui.EndMenuBar();
        imgui.EndChild();

        --Buttons
        if (imgui.Button('Update Relic Gear')) then
            --manager.UpdateJobs();
        end
    imgui.EndGroup();
end

--[[
* Renders the settings tab elements.
--]]
function interface.render_tab_settings()
    -- Left Side (Many whelps, handle it!!)
    imgui.BeginGroup();
        imgui.TextColored(colors.header, 'Overlay Settings');
        imgui.BeginChild('leftpane', { 0, -imgui.GetFrameHeightWithSpacing(), }, true);
            imgui.Checkbox('Show Overlay', interface.overlay.is_open);
            imgui.ShowHelp('Toggles if the overlay is visible or not.');
            imgui.Checkbox('Show Border', interface.overlay.show_border);
            imgui.ShowHelp('Toggles if the overlay border is visible or not.');

            local overlay_pos = { interface.overlay.docking[1] + 1 };
            if (imgui.Combo('Overlay Position', overlay_pos, 'Unlocked\0Top-Left\0Top-Right\0Bottom-Left\0Bottom-Right\0\0')) then
                interface.overlay.docking[1] = overlay_pos[1] - 1;
            end
            imgui.ShowHelp([[The location where the overlay should be displayed.

Unlocked - The position is not fixed and the overlay can be dragged around with the mouse.

Top-Left - The overlay is locked to the top-left of the screen.

Top-Right - The overlay is locked to the top-right of the screen.

Bottom-Left - The overlay is locked to the bottom-left of the screen.

Bottom-Right - The overlay is locked to the bottom-right of the screen.]]);

            imgui.InputInt2('Padding', interface.overlay.padding);
            imgui.ShowHelp('The padding to apply to the overlay when it\'s docked.\n(Not used when overlay position is set to \'Unlocked\')');
            imgui.SliderFloat('Opacity', interface.overlay.opacity, 0.0, 1.0, '%.2f');
            imgui.ShowHelp('The opacity of the overlay background.');

            imgui.Separator();
            imgui.Checkbox('Override Background Color?', interface.overlay.override_background_color);
            imgui.ShowHelp('Allows overriding the background color of the overlay.');
            imgui.ColorEdit4('Background Color', interface.overlay.color_background);
            imgui.ShowHelp('The color to use for the overlay background.');

            imgui.Separator();
            imgui.ColorEdit4('Key Item Color (Missing)', interface.overlay.color_keyitem_missing);
            imgui.ColorEdit4('Key Item Color (Have)', interface.overlay.color_keyitem_have);
            imgui.ShowHelp('The colors used when displaying the status of a key item.', false);
        imgui.EndChild();

        -- Settings Buttons..
        if (imgui.Button('Save Settings')) then
            interface.settings.save();
            print(chat.header(addon.name):append(chat.message('Settings saved.')));
        end
        imgui.SameLine();
        if (imgui.Button('Reload Settings')) then
            interface.settings.reload();
            print(chat.header(addon.name):append(chat.message('Settings reloaded.')));
        end
        imgui.SameLine();
        if (imgui.Button('Reset To Defaults')) then
            interface.settings.reset();
            print(chat.header(addon.name):append(chat.message('Settings reset to defaults.')));
        end
    imgui.EndGroup();
end

--[[
* Renders the ItemWatch overlay.
--]]
function interface.render_watchlist_overlay()
    if (not interface.overlay.is_open[1]) then
        return;
    end

    -- Prepare the default window flags..
    local flags = bit.bor(ImGuiWindowFlags_NoDecoration, ImGuiWindowFlags_AlwaysAutoResize, ImGuiWindowFlags_NoSavedSettings, ImGuiWindowFlags_NoFocusOnAppearing, ImGuiWindowFlags_NoNav);

    -- Adjust the layout specific to a docking location..
    if (interface.overlay.docking[1] ~= -1) then
        local work_size = imgui.GetIO().DisplaySize;
        local pos = { 0, 0, };
        local pivot = { 0, 0, };

        pos[1] = bit.band(interface.overlay.docking[1], 1) == 1 and work_size.x - interface.overlay.padding[1] or interface.overlay.padding[1];
        pos[2] = bit.band(interface.overlay.docking[1], 2) == 2 and work_size.y - interface.overlay.padding[2] or interface.overlay.padding[2];
        pivot[1] = bit.band(interface.overlay.docking[1], 1) == 1 and 1.0 or 0.0;
        pivot[2] = bit.band(interface.overlay.docking[1], 2) == 2 and 1.0 or 0.0;

        -- Update the window flags to not allow movement of the overlay..
        flags = bit.bor(flags, ImGuiWindowFlags_NoMove);

        -- Set the overlay windows position..
        imgui.SetNextWindowPos(pos, ImGuiCond_Always, pivot);
    end

    -- Alter the background color..
    if (interface.overlay.override_background_color[1] == true) then
        imgui.PushStyleColor(ImGuiCol_WindowBg, interface.overlay.color_background);
    end

    -- Adjust the border size..
    local border_size = imgui.GetStyle().WindowBorderSize;
    imgui.GetStyle().WindowBorderSize = interface.overlay.show_border[1] == true and 1.0 or 0.0;

    -- Display the overlay window..
    imgui.SetNextWindowBgAlpha(interface.overlay.opacity[1]);
    if (imgui.Begin('itemwatch_overlay', interface.overlay.is_open, flags)) then

        local inv = AshitaCore:GetMemoryManager():GetInventory();
        local ply = AshitaCore:GetMemoryManager():GetPlayer();

        -- Display the watched items..
        if (interface.manager.watched_items_count() > 0) then
            interface.manager.watched_items:each(function (v)
                local total = 0;
                for x = 0, 12 do
                    for y = 0, 80 do
                        local item = inv:GetContainerItem(x, y);
                        if (item ~= nil and item.Id == v[1]) then
                            total = total + item.Count;
                        end
                    end
                end
                imgui.Text(('%4d %s'):fmt(total, v[2]));
            end);
        end

        -- Display the watched items..
        if (interface.manager.watched_keyitems_count() > 0) then
            interface.manager.watched_keyitems:each(function (v)
                local has = ply:HasKeyItem(v[1]);
                imgui.TextColored(has and interface.overlay.color_keyitem_have or interface.overlay.color_keyitem_missing, v[2]);
            end);
        end

        if (imgui.BeginPopupContextWindow()) then
            if (imgui.MenuItem('Unlocked', nil, interface.overlay.docking[1] == -1)) then interface.overlay.docking[1] = -1; end
            if (imgui.MenuItem('Top-Left', nil, interface.overlay.docking[1] == 0)) then interface.overlay.docking[1] = 0; end
            if (imgui.MenuItem('Top-Right', nil, interface.overlay.docking[1] == 1)) then interface.overlay.docking[1] = 1; end
            if (imgui.MenuItem('Bottom-Left', nil, interface.overlay.docking[1] == 2)) then interface.overlay.docking[1] = 2; end
            if (imgui.MenuItem('Bottom-Right', nil, interface.overlay.docking[1] == 3)) then interface.overlay.docking[1] = 3; end
            if (interface.overlay.is_open[1] and imgui.MenuItem('Close')) then
                interface.overlay.is_open[1] = false;
            end
            imgui.EndPopup();
        end

        imgui.End();
    end

    -- Restore the border size..
    imgui.GetStyle().WindowBorderSize = border_size;

    -- Restore the background color..
    if (interface.overlay.override_background_color[1] == true) then
        imgui.PopStyleColor();
    end
end

--[[
* Renders ItemWatches various elements.
--]]
function interface.render()
    -- Render the watch lists..
    if (manager.watched_count() > 0) then
        interface.render_watchlist_overlay();
    end

    -- Skip rendering the interface if it's not open..
    if (not interface.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize({ 800, 700, });
    imgui.SetNextWindowSizeConstraints({ 800, 700, }, { FLT_MAX, FLT_MAX, });
    if (imgui.Begin('Database', interface.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.BeginTabBar('##database_tabbar', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            if (imgui.BeginTabItem('JOBS', nil)) then
                interface.renderJobTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('Relic Gear', nil)) then
                interface.renderRelicTab();
                imgui.EndTabItem();
            end
            if (imgui.BeginTabItem('Settings', nil)) then
                interface.render_tab_settings();
                imgui.EndTabItem();
            end
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

return interface;