local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Aya. Zucchetto +2',
        Neck = 'Loricate Torque',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Ayanmo Corazza +2',
        Hands = 'Aya. Manopolas +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Ayanmo Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+30', [5] = 'Magic Damage +20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Aya. Cosciales +2',
        Feet = 'Aya. Gambieras +2',
    },
	Resting = {
        Body = 'Luhlaza Jubbah +3',
        Waist = 'Fucho-no-Obi',
    },
    Idle_Regen = {
        Neck = 'Wiglen Gorget';
    },
    Idle_Refresh = {
        Head = 'Rawhide Mask',
        Body = 'Jhakri Robe +2',
        Ring2 = 'Stikini Ring +1',
        Waist = 'Fucho-no-Obi',
    },
	Town = {
        Main = 'Tanmogayi +1',
        Sub = 'Zantetsuken',
        Ammo = 'Crepuscular Pebble',
        Head = 'Psycloth Tiara',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Carpenter\'s Smock',
        Hands = 'Carpenter\'s Gloves',
        Ring1 = 'Orvail Ring',
        Ring2 = 'Craftmaster\'s Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+30', [5] = 'Magic Damage +20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Carmine Cuisses',
        Feet = 'Aya. Gambieras +2',
    },

    Evasion = {--this set will be my idle set when in /cj mode for evasion pulling
        Main = 'Shikargar',
        Sub = 'Shikargar',
        Ammo = 'Staunch Tathlum',
        --Ammo = 'Amar Cluster',--this is on wig atm
        Head = 'Malignance Chapeau',
        Neck = 'Bathy Choker +1';
        Ear1 = 'Eabani Earring',
        Ear2 = 'Infused Earring',
        Body = 'Nyame Mail',
        Hands = 'Malignance Gloves',
        Ring1 = 'Vengeful Ring',
        Ring2 = 'Ilabrat Ring',--revisit this
		Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = '"Fast Cast"+10', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'AGI+20', [5] = 'Evasion+25' } },
        Waist = 'Svelt. Gouriz +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
	
	Dt = {
		Ammo = 'Crepuscular Pebble',
        Head = 'Aya. Zucchetto +2',
        Neck = 'Wiglen Gorget',
		Body = 'Ayanmo Corazza +2',
		Hands = 'Umuthi Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Dark Ring', Augment = { [1] = 'Magic dmg. taken -4%', [2] = 'Breath dmg. taken -5%', [3] = 'Phys. dmg. taken -4%' } },
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+30', [5] = 'Magic Damage +20' } },
		Waist = 'Flume Belt +1',
        Legs = 'Aya. Cosciales +2',
        Feet = 'Aya. Gambieras +2',
	},
	
	Tp_Default = {
        Ammo = 'Ginsen',
        Head = 'Adhemar Bonnet',
        Neck = 'Clotharius Torque',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Ayanmo Corazza +2',
        Hands = 'Aya. Manopolas +2',
        Ring2 = 'Ayanmo Ring',
        Ring1 = 'Epona\'s Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Carmine Cuisses',
        Feet = 'Herculean Boots',
    },
	Tp_Hybrid = {
        Head = 'Malignance Chapeau',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Malignance Gloves',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots'
    },
	Tp_Acc = {
        Ammo = 'Ginsen',
        Head = 'Blistering Sallet +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Mache Earring',
        Body = 'Luhlaza Jubbah +3',
        Hands = 'Malignance Gloves',
        Ring1 = 'Cacoethic Ring'
    },
	
	Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Vrikodara Jupon',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Back = 'Swith Cape',
        Legs = 'Enif Cosciales',
        Feet = 'Chelona Boots',
    },
    Stoneskin_Precast = {
        Waist = 'Siegel Sash'   
    },

    Cure = {
        Head = 'Ipoca Beret',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Body = 'Vrikodara Jupon',
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Solemnity Cape',
        Feet = 'Medium\'s Sabots',
    },
    WhiteWind = {
        Head = 'Nyame Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Odnowa Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Vengeful Ring',
        Back = 'Solemnity Cape',
        Legs = 'Nyame Flanchard',
        Feet = 'Medium\'s Sabots',
    },
    BluSkill = {
        Body = 'Assim. Jubbah +2',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+30', [5] = 'Magic Damage +20' } },
    },
    BluMagical = {
        Ammo = 'Sturm\'s Report',
        Head = 'Jhakri Coronal +2',
        Neck = 'Eddy Necklace',
        Ear1 = 'Hecate\'s Earring',
        Ear2 = 'Psystorm Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Merlinic Dastanas',
        Ring1 = 'Jhakri Ring',
        Ring2 = 'Ayanmo Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+30', [5] = 'Magic Damage +20' } },
        Waist = 'Sacro Cord',
        Legs = 'Jhakri Slops +2',
        Feet = 'Merlinic Crackows',
    },
    BluDark = {
        Ring2 = 'Archon Ring',
    },
    BluMagicAccuracy = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Eddy Necklace',
        Ear1 = 'Lifestorm Earring',
        Ear2 = 'Psystorm Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Sangoma Ring',
        Ring2 = 'Ayanmo Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Sacro Cord',
        Legs = 'Jhakri Slops +2',
        Feet = 'Jhakri Pigaches +2',
    },
    CJmid = {--same as macc set but with weapons since in CJmode we idle in eva swords
        Main = 'Sakpata\'s Sword',
        Sub = 'Bunzi\'s Rod',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Eddy Necklace',
        Ear1 = 'Lifestorm Earring',
        Ear2 = 'Psystorm Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Sangoma Ring',
        Ring2 = 'Ayanmo Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Sacro Cord',
        Legs = 'Jhakri Slops +2',
        Feet = 'Jhakri Pigaches +2',
    },
    BluStun = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Crep. Earring',
        Ear2 = 'Regal Earring',
        Body = 'Luhlaza Jubbah +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Crepuscular Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Acuity Belt +1',
        Legs = 'Jhakri Slops +2',
        Feet = 'Gleti\'s Boots',
    },
    BluPhysical = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Adhemar Bonnet +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Mache Earring',
        Ear2 = 'Odr Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Petrov Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    CMP = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Ipoca Beret',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Kishar Ring',
        Back = 'Solemnity Cape',
        Waist = 'Hachirin-no-Obi',
        Legs = 'Augury Cuisses +1',
        Feet = 'Amalric Nails +1',
    },

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = 'Ginsen',
        Head = 'Jhakri Coronal +2',
        Neck = 'Shadow Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Karieyh Ring',
        Ring2 = 'Rufescent Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Jhakri Slops +2',
        Feet = 'Jhakri Pigaches +2',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Chant_Default = {
        Ammo = 'Falcon Eye',
        Neck = 'Light Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Abnoba Kaftan',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Legs = 'Aya. Cosciales +2',
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
    },
    Chant_Acc = {
    },
    Savage_Default = {
        Ammo = 'Crepuscular Pebble',
        Neck = 'Light Gorget',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },
	
    Diffusion = {
        Feet = 'Luhlaza Charuqs +1'
    },
    Enmity = {
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Cryptic Earring',
    },

    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
    Salvage = {
		Main = 'Naegling',
        Sub = 'Bunzi\'s Rod',
	},
	Movement = {
		Legs = 'Carmine Cuisses',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
	gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle);
	
    local zone = gData.GetEnvironment();
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('CJmode') ~= true) then
        gcinclude.CheckDefault ();
    end
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
    --lazy equip weapons for salvage runs
    if (zone.Area:contains('Remnants')) then
        gFunc.EquipSet(sets.Salvage);
    end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then gFunc.EquipSet(sets.Enmity) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    if string.contains(spell.Name, 'Stoneskin') then
        gFunc.EquipSet(sets.Stoneskin_Precast);
    end 

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local diff = gData.GetBuffCount('Diffusion');
    local ca = gData.GetBuffCount('Chain Affinity');
    local ba = gData.GetBuffCount('Burst Affinity');
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.BluMagical);
    if (gcinclude.BluMagDebuff:contains(spell.Name)) then gFunc.EquipSet(sets.BluMagicAccuracy)
    elseif (gcinclude.BluMagStun:contains(spell.Name)) then gFunc.EquipSet(sets.BluStun);
    elseif (gcinclude.BluMagBuff:contains(spell.Name)) then gFunc.EquipSet(sets.CMP);
    elseif (gcinclude.BluMagSkill:contains(spell.Name)) then gFunc.EquipSet(sets.BluSkill);
    elseif (gcinclude.BluMagCure:contains(spell.Name)) then gFunc.EquipSet(sets.Cure);
    elseif (gcinclude.BluMagEnmity:contains(spell.Name)) then gFunc.EquipSet(sets.Enmity);
    elseif string.match(spell.Name, 'White Wind') then gFunc.EquipSet(sets.WhiteWind);
    elseif string.match(spell.Name, 'Evryone. Grudge') or string.match(spell.Name, 'Tenebral Crush') then gFunc.EquipSet(sets.BluDark);
    end

    if (ca>=1) then gFunc.Equip('Feet','Assim. Charuqs +1') end
    if (ba>=1) then gFunc.Equip('Feet','Hashi. Basmak +1') end
    if (diff>=1) then gFunc.EquipSet(sets.Diffusion) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
   
        if string.match(ws.Name, 'Chant du Cygne') then
            gFunc.EquipSet(sets.Chant_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Chant_' .. gcdisplay.GetCycle('MeleeSet')) end
	    elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')) end
        end
    end
end

return profile;