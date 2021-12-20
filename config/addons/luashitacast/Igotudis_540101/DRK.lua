local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

sets = {
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Volte Gaiters',
    },
    Resting = {},
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {
        Ammo = 'Staunch Tathlum',
        Head = { Name = 'Viti. Chapeau +1', AugTrial=5250 },
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Volte Gaiters',
    },

    Dt = {
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Gende. Bliaut +1', Augment = { [1] = 'Magic dmg. taken -3%', [2] = 'Phys. dmg. taken -3%', [3] = '"Cure" potency +5%' } },
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Flume Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },

    Tp_Default = {
        Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
        Head = 'Flam. Zucchetto +2',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Mache Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = 'Petrov Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+20', [3] = 'DEX+20' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Nyame Sollerets',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },


    Precast = {
        Ammo = 'Staunch Tathlum',
        Head = { Name = 'Merlinic Hood', Augment = { [1] = 'Mag. Acc.+7', [2] = 'CHR+5', [3] = 'Magic burst dmg.+6%', [4] = '"Mag. Atk. Bns."+25' } },
        Neck = 'Baetyl Pendant',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Jhakri Robe +2',
        Hands = { Name = 'Gende. Gages +1', Augment = { [1] = 'Phys. dmg. taken -4%', [2] = 'Song spellcasting time -5%' } },
        Ring1 = 'Kishar Ring',
        Ring2 = 'Prolix Ring',
        Back = 'Swith Cape +1',
        Waist = 'Embla Sash',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Volte Gaiters',
    },
    Cure_Precast = {
        Feet = 'Vanya Clogs',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    Stoneskin_Precast = {
        Head = 'Umuthi Hat',
        Waist = 'Siegel Sash',
    },


    Cure = {
        Ammo = 'Pemphredo Tathlum',
        Head = { Name = 'Vanya Hood', AugPath='C' },
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Regal Earring',
        Body = { Name = 'Gende. Bliaut +1', Augment = { [1] = 'Magic dmg. taken -3%', [2] = 'Phys. dmg. taken -3%', [3] = '"Cure" potency +5%' } },
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Rufescent Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Rumination Sash',
        Legs = 'Atrophy Tights',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },
    Self_Cure = {
        Waist = 'Gishdubar Sash',
    },

    Enhancing = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Gifted Earring',
        Ear2 = 'Andoaa Earring',
        Body = 'Lethargy Sayon +1',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+20', [3] = 'DEX+20' } },
        Waist = 'Embla Sash',
        Legs = { Name = 'Telchine Braconi', Augment = { [1] = 'Enh. Mag. eff. dur. +8', [2] = '"Conserve MP"+4' } },
        Feet = 'Leth. Houseaux +1',
    },
    Self_Enhancing = {},
    Skill_Enhancing = {},
    Stoneskin = {
        Neck = 'Nodens Gorget',
        Waist = 'Siegel Sash',
    },
    Phalanx = {},
    Refresh = {
		Waist = 'Gishdubar Sash',
    },
    Self_Refresh = {},

    Enfeebling = {
        Ammo = 'Pemphredo Tathlum',
        Head = { Name = 'Viti. Chapeau +1', AugTrial=5250 },
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Snotra Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Kishar Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Aurist\'s Cape +1', AugPath='A' },
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },
    EnfeeblingACC = {},

    Drain = {
        Ammo = 'Pemphredo Tathlum',
        Head = { Name = 'Viti. Chapeau +1', AugTrial=5250 },
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Snotra Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Kishar Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Aurist\'s Cape +1', AugPath='A' },
        Waist = 'Fucho-no-Obi',
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Merlinic Crackows', Augment = { [1] = 'CHR+10', [2] = 'Mag. Acc.+2', [3] = '"Mag. Atk. Bns."+30' } },
    },

    Nuke = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Shiva Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Aurist\'s Cape +1',
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Merlinic Crackows', Augment = { [1] = 'CHR+10', [2] = 'Mag. Acc.+2', [3] = '"Mag. Atk. Bns."+30' } },
    },
    NukeACC = {};

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = { Name = 'Blistering Sallet +1', AugPath='A' },
        Neck = 'Fotia Gorget',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Back = 'Solemnity Cape',
        Waist = 'Fotia Belt',
        Legs = 'Jhakri Slops +2',
        Feet = 'Thereoid Greaves',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Savage_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Fotia Gorget',
        Ear1 = { Name = 'Moonshade Earring', Augment = { [1] = 'Accuracy+4', [2] = 'TP Bonus +250' } },
        Ear2 = 'Brutal Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Back = 'Solemnity Cape',
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = 'Thereoid Greaves',
    },
    Savage_Hybrid = {},
    Savage_Acc = {},

    Chant_Default = {
        Ammo = 'Yetshila',
        Head = { Name = 'Blistering Sallet +1', AugPath='A' },
        Neck = 'Fotia Gorget',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Begrudging Ring',
        Back = 'Solemnity Cape',
        Waist = 'Fotia Belt',
        Legs = 'Jhakri Slops +2',
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {},
    Chant_Acc = {},

    Movement = {
        Legs = 'Carmine Cuisses +1',
	},
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end

        if (gcdisplay.GetToggle('Fight') == false) then
            AshitaCore:GetChatManager():QueueCommand(1, '/fight');
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
		gFunc.EquipSet(gcinclude.sets.Dt);
		gFunc.EquipSet(sets.Dt);
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast)

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    if string.contains(spell.Name, 'Utsusemi') then
        gFunc.EquipSet(gcinclude.sets.Utsu_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Enhancing);
        end

        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Refresh);
            end
        elseif (target.Name == me) and string.contains(spell.Name, 'En') then
            gFunc.EquipSet(sets.Skill_Enhancing);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);

        if (gcdisplay.GetToggle('NukeSet') == 'Macc') then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
        if (gcdisplay.GetToggle('NukeSet') == 'Macc') then
            gFunc.EquipSet(sets.EnfeeblingACC);
        end
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.EnfeeblingACC); -- mostly MACC anyways
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
   
        if string.match(ws.Name, 'Chant du Cygne') then
            gFunc.EquipSet(sets.Chant_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Chant_' .. gcdisplay.GetCycle('MeleeSet')); end
	    elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;