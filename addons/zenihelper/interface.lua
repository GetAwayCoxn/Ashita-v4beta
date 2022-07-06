interface = T{
    is_open = {true,},
    colors = {
        title = { 0.0, 1.0, 1.0, 1.0 },{ 1.0, 1.0, 1.0, 1.0 },
        subtitle = {0.5, 0.5, 0.5, 1.0 },
        name = { 1.0, 1.0, 1.0, 1.0 },
        namerec = { 0.8, 0.95, 0.05, 1.0 },
        has = { 0.2, 0.9, 0.0, 1.0 },
        donthas = { 0.85, 0.0, 0.0, 1.0 },
    },
};
function interface.render()
    if (not interface.is_open[1]) or (AshitaCore:GetMemoryManager():GetPlayer():GetIsZoning() ~= 0) or (AshitaCore:GetMemoryManager():GetPlayer() == nil) then
        return;
    end

    imgui.SetNextWindowSizeConstraints({ 1000, 770, }, { FLT_MAX, FLT_MAX, });
    if imgui.IsWindowHovered(ImGuiHoveredFlags_AnyWindow) then
        if imgui.IsMouseDoubleClicked(ImGuiMouseButton_Left) then
            interface.is_open[1] = not interface.is_open[1];
        end
    end
    if (imgui.Begin('zenihelper', interface.is_open, ImGuiWindowFlags_NoDecoration)) then
        imgui.BeginChild('NmPane', { 0, 710 }, true);
            imgui.BeginChild('TinninPane', { 315, 690}, true);
                imgui.Indent(100.0);
                imgui.TextColored(interface.colors.title, 'TINNIN PATH');
                imgui.Separator();
                interface.kiprint('Maroon Seal');
                imgui.Indent(-100.0);
                imgui.TextColored(interface.colors.name, 'Vulpangue');
                interface.itemprint(data.popitems.tinnin.t1['Vulpangue']);
                interface.itemprint(data.trophies.tinnin.t1['Vulpangue']);
                imgui.TextColored(interface.colors.name, 'Chamrosh');
                interface.itemprint(data.popitems.tinnin.t1['Chamrosh']);
                interface.itemprint(data.trophies.tinnin.t1['Chamrosh']);
                imgui.TextColored(interface.colors.namerec, 'Cheese Hoarder Gigiroon');
                interface.itemprint(data.popitems.tinnin.t1['Cheese Hoarder Gigiroon']);
                interface.itemprint(data.trophies.tinnin.t1['Cheese Hoarder Gigiroon']);
                imgui.Indent(80.0);
                interface.kiprint('Apple Green Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.namerec, 'Iriz Ima');
                interface.itemprint(data.popitems.tinnin.t2['Iriz Ima']);
                interface.itemprint(data.trophies.tinnin.t2['Iriz Ima']);
                imgui.TextColored(interface.colors.name, 'Lividroot Amooshah');
                interface.itemprint(data.popitems.tinnin.t2['Lividroot Amooshah']);
                interface.itemprint(data.trophies.tinnin.t2['Lividroot Amooshah']);
                imgui.TextColored(interface.colors.name, 'Iriri Samariri');
                interface.itemprint(data.popitems.tinnin.t2['Iriri Samariri']);
                interface.itemprint(data.trophies.tinnin.t2['Iriri Samariri']);
                imgui.Indent(80.0);
                interface.kiprint('Charcoal Grey Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Armed Gears');
                interface.itemprint(data.popitems.tinnin.t3['Armed Gears']);
                interface.itemprint(data.trophies.tinnin.t3['Armed Gears']);
                imgui.Indent(80.0);
                interface.kiprint('Deep Purple Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Gotoh Zha the Redolent');
                interface.itemprint(data.popitems.tinnin.t3['Gotoh Zha the Redolent']);
                interface.itemprint(data.trophies.tinnin.t3['Gotoh Zha the Redolent']);
                imgui.Indent(70.0);
                interface.kiprint('Chestnut-colored Seal');
                imgui.Indent(-70.0);
                imgui.TextColored(interface.colors.name, 'Dea');
                interface.itemprint(data.popitems.tinnin.t3['Dea']);
                interface.itemprint(data.trophies.tinnin.t3['Dea']);
                imgui.Indent(80.0);
                interface.kiprint('Lilac-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Tinnin');
                interface.itemprint(data.popitems.tinnin.t4['Tinnin']);
                interface.itemprint(data.trophies.tinnin.t4['Tinnin']);
            imgui.EndChild();
            imgui.SameLine();
            imgui.BeginChild('SarameyaPane', { 315, 690}, true);
                imgui.Indent(95.0);
                imgui.TextColored(interface.colors.title, 'SARAMEYA PATH');
                imgui.Indent(-95.0);
                imgui.Separator();
                imgui.Indent(100.0);
                interface.kiprint('Cerise Seal');
                imgui.Indent(-100.0);
                imgui.TextColored(interface.colors.name, 'Brass Borer');
                interface.itemprint(data.popitems.sarameya.t1['Brass Borer']);
                interface.itemprint(data.trophies.sarameya.t1['Brass Borer']);
                imgui.TextColored(interface.colors.name, 'Claret');
                interface.itemprint(data.popitems.sarameya.t1['Claret']);
                interface.itemprint(data.trophies.sarameya.t1['Claret']);
                imgui.TextColored(interface.colors.namerec, 'Ob');
                interface.itemprint(data.popitems.sarameya.t1['Ob']);
                interface.itemprint(data.trophies.sarameya.t1['Ob']);
                imgui.Indent(80.0);
                interface.kiprint('Salmon-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.namerec, 'Anantaboga');
                interface.itemprint(data.popitems.sarameya.t2['Anantaboga']);
                interface.itemprint(data.trophies.sarameya.t2['Anantaboga']);
                imgui.TextColored(interface.colors.name, 'Dextrose');
                interface.itemprint(data.popitems.sarameya.t2['Dextrose']);
                interface.itemprint(data.trophies.sarameya.t2['Dextrose']);
                imgui.TextColored(interface.colors.name, 'Reacton');
                interface.itemprint(data.popitems.sarameya.t2['Reacton']);
                interface.itemprint(data.trophies.sarameya.t2['Reacton']);
                imgui.Indent(80.0);
                interface.kiprint('Copper-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Achamoth');
                interface.itemprint(data.popitems.sarameya.t3['Achamoth']);
                interface.itemprint(data.trophies.sarameya.t3['Achamoth']);
                imgui.Indent(85.0);
                interface.kiprint('Gold-colored Seal');
                imgui.Indent(-85.0);
                imgui.TextColored(interface.colors.name, 'Khromasoul Bhurborlor');
                interface.itemprint(data.popitems.sarameya.t3['Khromasoul Bhurborlor']);
                interface.itemprint(data.trophies.sarameya.t3['Khromasoul Bhurborlor']);
                imgui.Indent(80.0);
                interface.kiprint('Purplish Grey Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Nosferatu');
                interface.itemprint(data.popitems.sarameya.t3['Nosferatu']);
                interface.itemprint(data.trophies.sarameya.t3['Nosferatu']);
                imgui.Indent(85.0);
                interface.kiprint('Bright Blue Seal');
                imgui.Indent(-85.0);
                imgui.TextColored(interface.colors.name, 'Sarameya');
                interface.itemprint(data.popitems.sarameya.t4['Sarameya']);
                interface.itemprint(data.trophies.sarameya.t4['Sarameya']);
            imgui.EndChild();
            imgui.SameLine();
            imgui.BeginChild('TygerPane', { 315, 690}, true);
                imgui.Indent(110.0);
                imgui.TextColored(interface.colors.title, 'TYGER PATH');
                imgui.Indent(-110.0);
                imgui.Separator();
                imgui.Indent(90.0);
                interface.kiprint('Pine Green Seal');
                imgui.Indent(-90.0);
                imgui.TextColored(interface.colors.name, 'Velionis');
                interface.itemprint(data.popitems.tyger.t1['Velionis']);
                interface.itemprint(data.trophies.tyger.t1['Velionis']);
                imgui.TextColored(interface.colors.name, 'Lil\' Apkallu');
                interface.itemprint(data.popitems.tyger.t1['Lil\' Apkallu']);
                interface.itemprint(data.trophies.tyger.t1['Lil\' Apkallu']);
                imgui.TextColored(interface.colors.namerec, 'Chigre');
                interface.itemprint(data.popitems.tyger.t1['Chigre']);
                interface.itemprint(data.trophies.tyger.t1['Chigre']);
                imgui.Indent(80.0);
                interface.kiprint('Amber-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Verdelet');
                interface.itemprint(data.popitems.tyger.t2['Verdelet']);
                interface.itemprint(data.trophies.tyger.t2['Verdelet']);
                imgui.TextColored(interface.colors.namerec, 'Wulgaru');
                interface.itemprint(data.popitems.tyger.t2['Wulgaru']);
                interface.itemprint(data.trophies.tyger.t2['Wulgaru']);
                imgui.TextColored(interface.colors.name, 'Zareehkl the Jubilant');
                interface.itemprint(data.popitems.tyger.t2['Zareehkl the Jubilant']);
                interface.itemprint(data.trophies.tyger.t2['Zareehkl the Jubilant']);
                imgui.Indent(85.0);
                interface.kiprint('Taupe-colored Seal');
                imgui.Indent(-85.0);
                imgui.TextColored(interface.colors.name, 'Experimental Lamia');
                interface.itemprint(data.popitems.tyger.t3['Experimental Lamia']);
                interface.itemprint(data.trophies.tyger.t3['Experimental Lamia']);
                imgui.Indent(80.0);
                interface.kiprint('Fallow-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Mahjlaef the Paintorn');
                interface.itemprint(data.popitems.tyger.t3['Mahjlaef the Paintorn']);
                interface.itemprint(data.trophies.tyger.t3['Mahjlaef the Paintorn']);
                imgui.Indent(80.0);
                interface.kiprint('Sienna-colored Seal');
                imgui.Indent(-80.0);
                imgui.TextColored(interface.colors.name, 'Nuhn');
                interface.itemprint(data.popitems.tyger.t3['Nuhn']);
                interface.itemprint(data.trophies.tyger.t3['Nuhn']);
                imgui.Indent(70.0);
                interface.kiprint('Lavender-colored Seal');
                imgui.Indent(-70.0);
                imgui.TextColored(interface.colors.name, 'Tyger');
                interface.itemprint(data.popitems.tyger.t4['Tyger']);
                interface.itemprint(data.trophies.tyger.t4['Tyger']);
            imgui.EndChild();
        imgui.EndChild();

        imgui.BeginChild('PwPane', { 0, 35}, true);
            
        imgui.EndChild();
    end
    imgui.End();
end

function interface.kiprint(str)
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if player:HasKeyItem(data.keyitems[str]) then
        imgui.TextColored(interface.colors.has, str);
    else
        imgui.TextColored(interface.colors.subtitle, str);
    end
end

function interface.itemprint(str)
    local item = AshitaCore:GetResourceManager():GetItemByName(str, 0);
    for x = 0, 1 do --checking main inv only 
        for y = 0, AshitaCore:GetMemoryManager():GetInventory():GetContainerCountMax(x) do
            local tempitem = AshitaCore:GetMemoryManager():GetInventory():GetContainerItem(x, y);
            if (item ~= nil and tempitem ~= nil and item.Id == tempitem.Id) then
                imgui.TextColored(interface.colors.has, str);
                return;
            end
        end
    end
    
    imgui.TextColored(interface.colors.donthas, str);
end

function interface.dotrade()
    
end

return interface;