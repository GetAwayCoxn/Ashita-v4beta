local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Sulevia\'s Mask +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Creed Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Sulev. Gauntlets +1',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = 'Weard Mantle',
        Waist = 'Nierenschutz',
        Legs = 'Flamma Dirs +1',
        Feet = 'Sulev. Leggings +1',
    },
    Resting = {},
    Idle_Regen = {
        Head = 'Baghere Salade',
        Neck = 'Wiglen Gorget',
        Ring2 = 'Chirich Ring +1',
    },
    Idle_Refresh = {
        Neck = 'Creed Collar',
        Body = 'Jumalik Mail',
    },
    Town = {
        Main = 'Tanmogayi',
        Sub = 'Ochain',
        Ammo = 'Crepuscular Pebble',
        Head = 'Rev. Coronet +1',
        Body = 'Rev. Surcoat +1',
        Hands = 'Sulev. Gauntlets +1',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Creed Baudrier',
        Legs = 'Carmine Cuisses',
        Feet = 'Rev. Leggings',
    },

    Dt = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Sulevia\'s Mask +1',
        Neck ='Loricate Torque +1',
        Ear1 = 'Creed Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Rev. Gauntlets +1',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = 'Weard Mantle',
        Waist = 'Nierenschutz',
        Legs = 'Rev. Breeches',
        Feet = 'Sulev. Leggings +1',
    },

    Tp_Default = {
        Ammo = 'Ginsen',
        Head = 'Flam. Zucchetto +2',
        Neck ='Agitator\'s Collar',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Found. Breastplate',
        Hands = 'Sulev. Gauntlets +1',
        Ring1 = 'Sulevia\'s Ring',
        Ring2 = 'Flamma Ring',
        Back = 'Weard Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Flamma Dirs +1',
        Feet = 'Flam. Gambieras +1',
    },
    Tp_Hybrid = {
        Ammo = 'Coiste Bodhar',
        Head = 'Flam. Zucchetto +2',
        Neck ='Agitator\'s Collar',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Found. Breastplate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Sulevia\'s Ring',
        Ring2 = 'Flamma Ring',
        Back = 'Bleating Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Flamma Dirs +1',
        Feet = 'Flam. Gambieras +1',
    },
    Tp_Acc = {
        Ring1 = 'Cacoethic Ring +1',
        Ring2 = 'Chirich Ring +1',
    },

    --These will overwrite any above TP sets if /tankset is used
    Tank_Main = {--Default Tanking,  dt 
        Ammo = 'Crepuscular Pebble',
        Head = 'Sulevia\'s Mask +1',
        Neck = 'Loricate Torque',
        Ear1 = 'Creed Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Sulev. Gauntlets +1',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        --Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Back = 'Weard Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Flamma Dirs +1',
        Feet = 'Sulev. Leggings +1',
        },
    Tank_MEVA = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Sulevia\'s Mask +1',
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Vengeful Ring',
        Ring2 = 'Purity Ring',
        Back = 'Weard Mantle',
        Waist = 'Asklepian Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Sulev. Leggings +1',
    },

    Precast = {
        Ammo = 'Sapience Orb',--2
        --Head = 'Chev. Armet +1',--7
        Neck = 'Voltsurge Torque',
        Ear1 = 'Creed Earring',
        Ear2 = 'Loquac. Earring',--1
        Body = 'Rev. Surcoat +1',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',--4
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Creed Baudrier',
        Legs = 'Enif Cosciales',--8
        Feet = 'Carmine Greaves +1',--7
    },
    Cure_Precast = {
        --Ear1 = 'Mendi. Earring',
        Ear2 = 'Nourish. Earring +1',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    SIR = {--10 merits,25 gear
        Ammo = 'Crepuscular Pebble',
        Neck = 'Moonbeam Necklace', -- 10
        Waist = 'Creed Baudrier',
        Legs = 'Carmine Cuisses',--15
    },
    Enmity = {
        Ammo = 'Sapience Orb',--2
        Head = 'Souv. Schaller +1',--9
        Neck = 'Moonbeam Necklace',--10
        Body = 'Cab. Surcoat +3',--10
        Ring1 = 'Eihwaz Ring',--5
        Ring2 = 'Supershear Ring',--5
        Ear1 = 'Friomisi Earring',--2
        Ear2 = 'Cryptic Earring',--4
        Back = 'Rudianos\'s Mantle',--10
        Waist = 'Creed Baudrier',--5
        Feet = 'Eschite Greaves',--15
    },

    Cure = {
        Head = 'Souv. Schaller +1', --15
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Nourish. Earring +1', -- 6
        Body = 'Jumalik Mail',
        Hands = 'Buremte Gloves',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = 'Solemnity Cape', -- 7
        Legs = 'Flamma Dirs +1',
        Feet = 'Odyssean Greaves', -- 7
    },
    Phalanx = {
        Body = 'Yorium Cuirass', -- 3
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Creed Earring',
        Ear2 = 'Ethereal Earring',
        Hands = 'Odyssean Gauntlets', --3
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Audumbla Sash',
        Legs = 'Flamma Dirs +1', -- 5
        Feet = 'Odyssean Greaves',
    },
    Reprisal = {
        Ammo = 'Sapience Orb',
        Head = 'Souv. Schaller +1',
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Creed Earring',
        Ear2 = 'Cryptic Earring',
        Body = 'Shabti Cuirass',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Audumbla Sash',
        Legs = 'Founder\'s Hose',
        Feet = 'Eschite Greaves',
    },
    Flash = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Souv. Schaller +1',
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Creed Earring',
        Ear2 = 'Cryptic Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Rev. Gauntlets +1',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Audumbla Sash',
        Legs = 'Founder\'s Hose',
        Feet = 'Odyssean Greaves',
    },

    Preshot = {},
    Midshot = {},

    Ws_Default = {
        Ammo = 'Ginsen',
        Head = 'Sulevia\'s Mask +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Waist = 'Fotia Belt',
        Legs = 'Flamma Dirs +1',
        Feet = 'Flam. Gambieras +1',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Chant_Default = {
        Head = 'Blistering Sallet +1',
        Ear2 = 'Moonshade Earring',
        Hands = 'Flam. Manopolas +1',
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
    },
    Chant_Acc = {
    },
    Savage_Default = {
        Head = 'Sulevia\'s Mask +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Waist = 'Sailfi Belt +1',
        Legs = 'Flamma Dirs +1',
        Feet = 'Sulev. Leggings +1',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },
    Atone_Default = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Souv. Schaller +1',
        Neck = 'Moonbeam Necklace',
        Ear1 = 'Creed Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = 'Weard Mantle',
        Waist = 'Fotia Belt',
        Legs = 'Flamma Dirs +1',
        Feet = 'Sulev. Leggings +1',
    },
    Atone_Hybrid = {
    },
    Atone_Acc = {
    },
    Aedge_Default = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Eddy Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Hecate\'s Earring',
        Body = 'Found. Breastplate',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Karieyh Ring +1',
        Waist = 'Fotia Belt',
        Legs = 'Augury Cuisses +1',
        Feet = 'Nyame Sollerets',
    },
    Aedge_Hybrid = {},
    Aedge_Acc = {},

    Fealty = {
        Body = 'Cab. Surcoat',
    },
    Sentinel = {
        Feet = 'Cab. Leggings',
    },
    Bash = {
        Hands = 'Cab. Gauntlets',
    },
    Invincible = {
        Legs = 'Cab. Breeches',
    },
    Cover = {
        Body = 'Cab. Surcoat',
        Head = 'Rev. Coronet +1',
    },
    Rampart = {
        Head = 'Cab. Coronet',
    },

    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
    Movement = {
        Legs = 'Carmine Cuisses',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
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
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
        if (gcdisplay.GetCycle('TankSet') ~= 'None') then
        gFunc.EquipSet('Tank_' .. gcdisplay.GetCycle('TankSet')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    local cover = gData.GetBuffCount('Cover');
	if (cover >= 1) then
		gFunc.EquipSet(sets.Fealty); -- same set as fealty
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
    gFunc.EquipSet(sets.Enmity)
	if string.match(ability.Name, 'Fealty') then
		gFunc.EquipSet(sets.Fealty);
    elseif string.match(ability.Name, 'Sentinel') then
		gFunc.EquipSet(sets.Sentinel);
    elseif string.match(ability.Name, 'Sheild Bash') or string.match(ability.Name, 'Chivalry') then
		gFunc.EquipSet(sets.Bash);
    elseif string.match(ability.Name, 'Invincible') then
		gFunc.EquipSet(sets.Invincible);
    elseif string.match(ability.Name, 'Cover') then
		gFunc.EquipSet(sets.Cover);
    elseif string.match(ability.Name, 'Rampart') then
		gFunc.EquipSet(sets.Rampart);
	end

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
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.SIR);

    if string.contains(spell.Name, 'Cur') then
        gFunc.EquipSet(sets.Cure);
    elseif string.match(spell.Name, 'Phalanx') then
        gFunc.EquipSet(sets.Phalanx);
    elseif string.match(spell.Name, 'Reprisal') then
        gFunc.EquipSet(sets.Reprisal);
    elseif string.match(spell.Name, 'Flash') then
        gFunc.EquipSet(sets.Flash);
    else
        gFunc.EquipSet(sets.Enmity);
    end

    if (gcdisplay.GetToggle('SIR') == true) then
        gFunc.EquipSet(sets.SIR);
    end
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
            gFunc.EquipSet('Chant_' .. gcdisplay.GetCycle('MeleeSet')); end
	    elseif string.match(ws.Name, 'Savage Blade') or string.match(ws.Name, 'Knights of Round') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Atonement') then
            gFunc.EquipSet(sets.Atone_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Atone_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
