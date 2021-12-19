local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

sets = {
    Idle = {
        Main = 'Bolelabunga',
        Sub = 'Genmei Shield',
        Ammo = 'Staunch Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Ea Cuffs',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Gishdubar Sash',
        Legs = 'Agwu\'s Slops',
        Feet = 'Volte Gaiters',
    },
    Idle_Staff = {
        Main = 'Marin Staff +1',
        Sub = 'Enki Strap',
    },
    Resting = {},
    Idle_Regen = {
        Neck = 'Bathy Choker +1',
    },
    Idle_Refresh = {
        Waist = 'Fucho-no-Obi',
    },
    Town = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Culminus',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Bathy Choker +1',
        Body = 'Agwu\'s Robe',
        Hands = 'Ea Cuffs',
        Back = 'Solemnity Cape',
        Legs = 'Agwu\'s Slops',
        Feet = 'Volte Gaiters',
    },

    Dt = {
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Etiolation Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Gishdubar Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },

    Tp_Default = {
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
        Body = 'Agwu\'s Robe',
        Hands = 'Mallquis Cuffs +2',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Prolix Ring',
        Back = 'Swith Cape +1',
        Waist = 'Embla Sash',
        Legs = 'Agwu\'s Slops',
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
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = { Name = 'Vanya Hood', AugPath='C' },
        Neck = 'Nodens Gorget',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Regal Earring',
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Rufescent Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Rumination Sash',
        Legs = 'Vanya Slops',
        Feet = 'Vanya Clogs',
    },
    Self_Cure = {
        Waist = 'Gishdubar Sash',
    },
    Regen = {
        Main = 'Bolelabunga',
        Sub = 'Ammurapi Shield',
        Body = 'Telchine Chas.',
    },
    Cursna = {
        Ring1 = 'Purity Ring',
		Waist = 'Gishdubar Sash',
    },

    Enhancing = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Gifted Earring',
        Ear2 = 'Andoaa Earring',
        Body = 'Telchine Chas.',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Embla Sash',
        Legs = { Name = 'Telchine Braconi', Augment = { [1] = 'Enh. Mag. eff. dur. +8', [2] = '"Conserve MP"+4' } },
        Feet = 'Telchine Pigaches',
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
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Staunch Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Kishar Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Aurist\'s Cape +1', AugPath='A' },
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },
    EnfeeblingACC = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Spaekona\'s Coat +2',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Kishar Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Aurist\'s Cape +1', AugPath='A' },
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },
    Mind_Enfeebling = {},
    Int_Enfeebling = {},
    Potency_Enfeebling = {},

    Drain = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Spaekona\'s Coat +2',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Fucho-no-Obi',
        Legs = 'Jhakri Slops +2',
        Feet = 'Agwu\'s Pigaches',
    },

    Nuke = {
        Main = 'Marin Staff +1',
        Sub = 'Enki Strap',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Shiva Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Taranus\'s Cape',
        Waist = 'Sacro Cord',
        Legs = 'Jhakri Slops +2',
        Feet = { Name = 'Merlinic Crackows', Augment = { [1] = 'CHR+10', [2] = 'Mag. Acc.+2', [3] = '"Mag. Atk. Bns."+30' } },
    },
    NukeACC = {
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
    },
    Burst = {
        Main = 'Bunzi\'s Rod', -- 10 and 0
        Sub = 'Ammurapi Shield',
        Head = 'Merlinic Hood', -- 6 and 0
        Neck = 'Src. Stole +1', -- 7 and 0 for now
        Body = 'Agwu\'s Robe', -- 10 and 0
        Hands = 'Ea Cuffs', --5 and 5
        Ring1 = 'Mujin Band', -- 0 and 5
        Back = 'Taranus\'s Cape', -- 5 and 0
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Agwu\'s Slops', -- 9 and 0
        Feet = 'Ea Pigaches', -- 4 and 4
    },
    Helix = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Head = 'Mall. Chapeau +2',
        Body = 'Agwu\'s Robe',
        Hands = 'Mallquis Cuffs +2',
        Back = 'Taranus\'s Cape',
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Agwu\'s Slops',
        Feet = 'Agwu\'s Pigaches',
    },
    Death = {
        Main = 'Marin Staff +1',
        Sub = 'Enki Strap',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Gifted Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Archon Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Aurist\'s Cape +1',
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
        Legs = 'Agwu\'s Slops',
        Feet = 'Agwu\'s Pigaches',
    },
    Af_Body = {Body = 'Spaekona\'s Coat +2'},

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Back = 'Solemnity Cape',
        Waist = 'Fotia Belt',
        Legs = 'Jhakri Slops +2',
        Feet = 'Nyame Sollerets',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Movement = {
        Feet = 'Herald\'s Gaiters',
	},
};

profile.Sets = sets;
local player = gData.GetPlayer();

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 5');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    if (gcdisplay.GetToggle('Death') == true) and (player.MPP > 50) then
        gFunc.EquipSet(sets.Death);
    else
        gFunc.EquipSet(sets.Idle);

        if (player.Status == 'Engaged') then
            gFunc.EquipSet(sets.Tp_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
                gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet'));
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
        if (gcdisplay.GetCycle('Weapon') == 'Staff') then
            gFunc.EquipSet(sets.Idle_Staff);
        end
    end
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

    if (gcdisplay.GetToggle('Death') == true) then
        gFunc.EquipSet(sets.Death);
    else
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
        if (gcdisplay.GetCycle('Weapon') == 'Staff') then
            gFunc.EquipSet(sets.Idle_Staff);
        end
    end
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (gcdisplay.GetToggle('Death') == true) then
        gFunc.EquipSet(sets.Death);
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
    else
        if (spell.Skill == 'Enhancing Magic') then
            gFunc.EquipSet(sets.Enhancing);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Enhancing);
            end

            if string.match(spell.Name, 'Phalanx') then
                gFunc.EquipSet(sets.Phalanx);
            elseif string.match(spell.Name, 'Stoneskin') then
                gFunc.EquipSet(sets.Stoneskin);
            elseif string.contains(spell.Name, 'Temper') then
                gFunc.EquipSet(sets.Skill_Enhancing);
            elseif string.contains(spell.Name, 'Refresh') then
                gFunc.EquipSet(sets.Refresh);
                if (target.Name == me) then
                    gFunc.EquipSet(sets.Self_Refresh);
                end
            end
        elseif (spell.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Cure);
            end
            if string.contains(spell.Name, 'Regen') then
                gFunc.EquipSet(sets.Regen);
            end
            if string.match(spell.Name, 'Cursna') then
                gFunc.EquipSet(sets.Cursna);
            end
        elseif (spell.Skill == 'Elemental Magic') then
            gFunc.EquipSet(sets.Nuke);

            if (gcdisplay.GetToggle('NukeSet') == 'Macc') then
                gFunc.EquipSet(sets.NukeACC);
            end
            if (gcdisplay.GetToggle('Burst') == true) then
                gFunc.EquipSet(sets.Burst);
            end
            if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
                gFunc.Equip('Waist', 'Hachirin-no-Obi');
            end
            if string.match(spell.Name, 'helix') then
                gFunc.EquipSet(sets.Helix);
            end
            if (player.MPP < 65) then
                gFunc.EquipSet(sets.Af_Body);
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

        if (gcdisplay.GetCycle('Weapon') == 'Staff') then
            gFunc.EquipSet(sets.Idle_Staff);
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
