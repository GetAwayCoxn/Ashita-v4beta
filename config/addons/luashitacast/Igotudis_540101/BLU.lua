local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');


sets = {
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Rawhide Mask',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
		Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
	Resting = {
        Body = 'Jhakri Robe +2',
        Waist = 'Fucho-no-Obi',
    },
    Regen = {
        Neck = 'Bathy Choker +1';
    },
    Refresh = {
        Body = 'Jhakri Robe +2',
        Waist = 'Fucho-no-Obi',
    },
	Town = {
        Head = 'Cumulus Masque',
    },
	
	Dt = {
		Ammo = 'Staunch Tathlum',
		Neck = 'Bathy Choker +1',
		Ear1 = 'Eabani Earring',
        Head = 'Nyame Helm',
		Body = 'Gleti\'s Cuirass',
		Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = 'Solemnity Cape',
		Waist = 'Flume Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Nyame Sollerets',
	},
	
	Tp_Default = {
        Ammo = 'Coiste Bodhar',
        Head = 'Adhemar Bonnet +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Herculean Vest',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Samnuha Tights',
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
        Ammo = 'Staunch Tathlum',
        Head = 'Haruspex Hat',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Luhlaza Jubbah +3',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Back = 'Swith Cape +1',
        Legs = 'Enif Cosciales',
    },
    Precast_Stoneskin = {
        Waist = 'Siegel Sash'   
    },

    Cure = {
        Head = 'Ipoca Beret',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Body = 'Ayanmo Corazza +2',
        Hands = 'Weath. Cuffs +1',
        Ring1 = 'Defending Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Solemnity Cape',
    },
    WhiteWind = {
        Head = 'Pinga Crown',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Odnowa Earring +1',
        Body = 'Despair Mail',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Meridian Ring',
        Back = 'Moonbeam Cape',
        Legs = 'Pinga Pants +1',
        Feet = 'Medium\'s Sabots',
    },
    BluSkill = {
        Body = 'Assim. Jubbah +2',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
    },
    BluMagical = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Jhakri Coronal +2',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Hecate\'s Earring',
        Ear2 = 'Regal Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Shiva Ring +1',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Acuity Belt +1',
        Legs = 'Jhakri Slops +2',
        Feet = 'Hashi. Basmak +1',
    },
    BluDark = {
        Ring2 = 'Archon Ring',
    },
    BluMagicAccuracy = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Erra Pendant',
        Ear1 = 'Gwati Earring',
        Ear2 = 'Regal Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Crepuscular Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Acuity Belt +1',
        Legs = 'Jhakri Slops +2',
        Feet = 'Gleti\'s Boots',
    },
    BluStun = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Jhakri Coronal +2',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Gwati Earring',
        Ear2 = 'Regal Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Jhakri Cuffs +2',
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
        Hands = 'Jhakri Cuffs +2',
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
        Ear2 = 'Gifted Earring',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Kishar Ring',
        Back = 'Solemnity Cape',
        Waist = 'Hachirin-no-Obi',
        Legs = 'Augury Cuisses +1',
    },

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = 'Ginsen',
        Head = 'Adhemar Bonnet +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Assim. Jubbah +2',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Ws_Hybrid = {
        Head = 'Nyame Helm',
        Body = 'Gleti\'s Cuirass',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    Ws_Acc = {
    },
    Chant_Default = {
        Ammo = 'Jukukik Feather',
        Head = 'Adhemar Bonnet +1',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Legs = 'Gleti\'s Breeches',
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
        Head = 'Nyame Helm',
        Feet = 'Nyame Sollerets',
    },
    Chant_Acc = {
    },
    Savage = {
        Ammo = 'Ginsen',
        Head = 'Adhemar Bonnet +1',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Assim. Jubbah +2',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Legs = 'Gleti\'s Breeches',
        Feet = 'Herculean Boots',
    },
    Savage_Hybrid = {
        Ammo = 'Crepuscular Pebble',
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
	Movement = {
		Legs = 'Carmine Cuisses +1',
	},
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
	gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
	varhelper.Destroy();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (varhelper.GetCycle('Set') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. varhelper.GetCycle('Set')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (varhelper.GetToggle('DTset') == true) then
		gFunc.EquipSet(gcinclude.sets.Dt);
		gFunc.EquipSet(sets.Dt);
	end
	if (varhelper.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
end

profile.HandleAbility = function()
	local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then gFunc.EquipSet(sets.Enmity) end
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast)
    if string.match(spell.Name, 'Stoneskin') then gFunc.EquipSet(sets.Precast_Stoneskin) end

    gcinclude.CheckPrecast ();
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

    gcinclude.CheckMidcast ();
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);

    gcinclude.CheckPreshot();
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);

    gcinclude.CheckMidshot();
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (varhelper.GetCycle('Set') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. varhelper.GetCycle('Set')) end
   
        if string.match(ws.Name, 'Chant du Cygne') then
            gFunc.EquipSet(sets.Chant_Default)
            if (varhelper.GetCycle('Set') ~= 'Default') then
            gFunc.EquipSet('Chant_' .. varhelper.GetCycle('Set')) end
	    elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (varhelper.GetCycle('Set') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. varhelper.GetCycle('Set')) end
        end
    end
end

return profile;