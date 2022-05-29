local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

sets = T{
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Wakido Kabuto +2',
        Neck = 'Loricate Torque +1',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Eabani Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Macabre Gaunt. +1',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Flam. Gambieras +2',
    },
    Resting = {},
    Idle_Regen = {
        Head = 'Crepuscular Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Infused Earring',
        Body = 'Hiza. Haramaki +2',
        Hands = 'Rao Kote',
        Ring2 = 'Chirich Ring +1',
    },
    Idle_Refresh = {},
    Town = {
        Main = 'Masamune',
        Sub = 'Utu Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Wakido Kabuto +2',
        Neck = 'Bathy Choker +1',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Eabani Earring',
        Body = { Name = 'Sakonji Domaru +3', AugTrial=5483 },
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Danzo Sune-Ate',
    },

    Dt = {
        Ammo = 'Staunch Tathlum',--3
        Head = 'Nyame Helm',--7
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },--6
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },--1
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Nyame Gauntlets',--7
        Ring1 = 'Defending Ring',--10
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },--7
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = 'Nyame Flanchard',--8
        Feet = 'Nyame Sollerets',--7
    },

    Tp_Default = {
        Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
        Head = 'Flam. Zucchetto +2',
        Neck = { Name = 'Sam. Nodowa +1', AugPath='A' },
        Ear1 = 'Telos Earring',
        Ear2 = 'Schere Earring',
        Body = 'Kasuga Domaru +1',
        Hands = 'Flam. Manopolas +2',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = { Name = 'Tatena. Haidate +1', AugPath='A' },
        Feet = { Name = 'Tatena. Sune. +1', AugPath='A' },
    },
    Tp_Hybrid = {
        Head = 'Mpaca\'s Cap',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Mpaca\'s Gloves',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
    },
    Tp_Acc = {
        Ear1 = 'Mache Earring +1',
        Hands = 'Tatena. Gote +1',
        Ring1 = 'Cacoethic Ring +1',
        Ring2 = 'Chirich Ring +1',
        Waist = 'Ioskeha Belt +1',
        Feet = 'Tatena. Sune. +1',
    },
    Tp_Proc = { -- a set to force low dmg for things like Vagary
        Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
        Head = 'Flam. Zucchetto +2',
        Neck = { Name = 'Sam. Nodowa +1', AugPath='A' },
        Ear1 = 'Telos Earring',
        Ear2 = 'Schere Earring',
        Body = 'Kasuga Domaru +1',
        Hands = 'Flam. Manopolas +2',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = { Name = 'Tatena. Haidate +1', AugPath='A' },
        Feet = 'Flam. Gambieras +2',
    },


    Precast = {
        Ammo = 'Staunch Tathlum',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Malignance Earring',
        Hands = 'Leyline Gloves',
        Ring2 = 'Prolix Ring',
    },


    Cure = {
        Ammo = 'Pemphredo Tathlum',
        Head = { Name = 'Vanya Hood', AugPath='C' },
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Regal Earring',
        Body = { Name = 'Gende. Bliaut +1', Augment = { [1] = 'Magic dmg. taken -3%', [2] = 'Phys. dmg. taken -3%', [3] = '"Cure" potency +5%' } },
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Gishdubar Sash',
        Legs = 'Atrophy Tights',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },

    Enhancing = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Andoaa Earring',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+20', [3] = 'DEX+20' } },
        Waist = 'Embla Sash',
        Legs = { Name = 'Telchine Braconi', Augment = { [1] = 'Enh. Mag. eff. dur. +8', [2] = '"Conserve MP"+4' } },
    },

    Preshot = {
    },
    Midshot = {
        Ear1 = 'Telos Earring',
        Ear2 = 'Enervating Earring',
    },

    Ws_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = { Name = 'Sam. Nodowa +1', AugPath='A' },
        Ear1 = 'Thrud Earring',
        Ear2 = 'Moonshade Earring',
        Body = { Name = 'Sakonji Domaru +3', AugTrial=5483 },
        Hands = { Name = 'Valorous Mitts', Augment = { [1] = '"Mag. Atk. Bns."+1', [2] = 'Attack+9', [3] = 'Mag. Acc.+1', [4] = 'STR+5', [5] = 'Weapon skill damage +5%', [6] = 'AGI+2', [7] = 'Accuracy+9' } },
        Ring1 = 'Karieyh Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Hiza. Hizayoroi +2',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Weapon skill damage +5%', [2] = 'Accuracy+8' } },
    },
    Ws_Hybrid = {
        Body = 'Nyame Mail',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ws_Acc = {
    },
    Ws_Proc = { -- a set to force low dmg for things like Vagary
        Ammo = 'Staunch Tathlum',
        Head = 'Flam. Zucchetto +2',
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = 'Telos Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Kasuga Domaru +1',
        Hands = 'Wakido Kote +3',
        Ring1 = 'Defending Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Flume Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Flam. Gambieras +2',
    },

    Savage_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Telos Earring',
        Body = { Name = 'Sakonji Domaru +3', AugTrial=5483 },
        Hands = { Name = 'Valorous Mitts', Augment = { [1] = '"Mag. Atk. Bns."+1', [2] = 'Attack+9', [3] = 'Mag. Acc.+1', [4] = 'STR+5', [5] = 'Weapon skill damage +5%', [6] = 'AGI+2', [7] = 'Accuracy+9' } },
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = 'Solemnity Cape',
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Mpaca\'s Hose',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Weapon skill damage +5%', [2] = 'Accuracy+8' } },
    },
    Savage_Hybrid = {
        Body = 'Nyame Mail',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Savage_Acc = {},

    Jinpu_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = { Name = 'Sam. Nodowa +1', AugPath='A' },
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Moonshade Earring',
        Body = { Name = 'Sakonji Domaru +3', AugTrial=5483 },
        Hands = { Name = 'Valorous Mitts', Augment = { [1] = '"Mag. Atk. Bns."+1', [2] = 'Attack+9', [3] = 'Mag. Acc.+1', [4] = 'STR+5', [5] = 'Weapon skill damage +5%', [6] = 'AGI+2', [7] = 'Accuracy+9' } },
        Ring2 = 'Karieyh Ring +1',
        Ring1 = 'Metamor. Ring +1',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Eschan Stone',
        Legs = 'Hiza. Hizayoroi +2',
        Feet = 'Nyame Sollerets',
    },
    Jinpu_Hybrid = {
        Body = 'Nyame Mail',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Jinpu_Acc = {},

    Ageha_Default = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Crep. Earring',
        Ear2 = 'Lugra Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Eschan Stone',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Nyame Sollerets',
    },
    Ageha_Hybrid = {
        Body = 'Nyame Mail',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ageha_Acc = {},

    Stardiver_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = { Name = 'Sam. Nodowa +1', AugPath='A' },
        Ear1 = 'Thrud Earring',
        Ear2 = 'Moonshade Earring',
        Body = { Name = 'Sakonji Domaru +3', AugTrial=5483 },
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Weapon skill damage +5%', [2] = 'Accuracy+8' } },
    },
    Stardiver_Hybrid = {
        Body = 'Nyame Mail',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Stardiver_Acc = {},

    Hasso = {
        Hands = 'Wakido Kote +3',
    },
    ThirdEye = {
        Legs = 'Sakonji Haidate +1',
    },
    Meditate = {
        Head = 'Wakido Kabuto +2',
        Hands = 'Sakonji Kote +1',
    },
    Meikyo = {
        Feet = 'Sakonji Sune-Ate',
    },
    Enmity = {
        Neck = { Name = 'Unmoving Collar +1', AugPath='A' },
        Ear1 = 'Cryptic Earring',
        Ring1 = 'Petrov Ring',
    },

    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
    Movement = {
        Feet = 'Danzo Sune-Ate',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 8');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
    local hasso = gData.GetBuffCount('Hasso');
    local thirdeye = gData.GetBuffCount('Third Eye');
	local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
        if (hasso >= 1) then gFunc.EquipSet(sets.Hasso) end
        if (thirdeye >= 1) then gFunc.EquipSet(sets.ThirdEye) end
        if (gcdisplay.GetToggle('PROC') == true) then
            gFunc.EquipSet(sets.Tp_Proc); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
		 
		gFunc.EquipSet(sets.Dt);
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
     
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then gFunc.EquipSet(sets.Enmity);
    elseif string.match(ability.Name, 'Meditate') then gFunc.EquipSet(sets.Meditate);
    elseif string.contains(ability.Name, 'Meikyo') then gFunc.EquipSet(sets.Meikyo) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
    local meikyo = gData.GetBuffCount('Meikyo Shisui');
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    elseif (gcdisplay.GetToggle('PROC') == true) then
        gFunc.EquipSet(sets.Ws_Proc);
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

	    if string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Tachi: Jinpu') then
            gFunc.EquipSet(sets.Jinpu_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Jinpu_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Tachi: Ageha') then
            gFunc.EquipSet(sets.Ageha_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Ageha_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Stardiver') then
            gFunc.EquipSet(sets.Stardiver_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Stardiver_' .. gcdisplay.GetCycle('MeleeSet')); end
        end

        if (meikyo >= 1) then gFunc.EquipSet(sets.Meikyo) end
    end
end

return profile;
