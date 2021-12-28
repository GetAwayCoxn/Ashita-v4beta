local imgui = require('imgui');

display = {
    is_open = {true,},
    size = {400,200},
    enabled = 'Disabled',
    labels = {'Rune1', 'Rune2', 'Rune3'},
    menu_items = {'Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Lux','Tenebrae'},
    pulseHP = {50,},
};

function display.Load()
end

function display.Unload()
end

function display.Render()
    if (not display.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize(display.size);
    if (imgui.Begin('RuneHelper', display.is_open, ImGuiWindowFlags_NoResize)) then
        if (imgui.Button(display.enabled)) then
            if (display.enabled == 'Disabled') then
                display.enabled = 'Enabled';
            else
                display.enabled = 'Disabled';
            end
        end

        for m = 1, #display.labels do
            imgui.Spacing();imgui.Spacing();
            --[[if (imgui.BeginMenu(display.labels[m], true)) then
                for i = 1, #display.menu_items do
                    imgui.MenuItem(display.menu_items[i]);
                end
            imgui.EndMenu();]]
            if (imgui.BeginPopupContextWindow()) then
            --if (imgui.MenuItem('Unlocked', nil, editor.overlay.docking[1] == -1)) then editor.overlay.docking[1] = -1; end
                for i = 1, #display.menu_items do
                    if (imgui.MenuItem(display.menu_items[i])) then

                    end
                end
            imgui.EndPopup();
            end
        end

        imgui.Spacing();imgui.Spacing();
        if (imgui.InputInt('Auto Pulse HP%',display.pulseHP)) then
            if (display.pulseHP[1] > 100) then display.pulseHP[1] = 100;
            elseif (display.pulseHP[1] < 0) then display.pulseHP[1] = 0 end
        end

    end
    imgui.End();
end

return display;