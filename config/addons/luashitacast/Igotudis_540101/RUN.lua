local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Main = 'Epeolatry',
        Sub = 'Utu Grip',
        Ammo = 'Staunch Tathlum',--2
        Head = 'Nyame Helm',--7
        Neck ='Futhark Torque +1',--2 currently
        Ear1 = 'Odnowa Earring +1',--3
        Ear2 = 'Eabani Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',--7
        Ring1 = 'Moonbeam Ring',--4
        Ring2 = 'Defending Ring',--10
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',----8
        Feet = 'Nyame Sollerets',--7
    },
    Resting = {},
    Idle_Regen = {
        Neck = 'Bathy Choker +1',
        Ear1 = 'Infused Earring',
        Body = 'Futhark Coat +3',
        Hands = 'Turms Mittens',
        Ring2 = 'Chirich Ring +1',
        Feet = 'Turms Leggings',
    },
    Idle_Refresh = {
        Ammo = 'Homiliary',
        Head = 'Rawhide Mask',
        Body = 'Agwu\'s Robe',
        Ring1 = 'Stikini Ring +1',
        Waist = 'Fucho-no-Obi',
    },
    Town = {
        Main = 'Epeolatry',
        Sub = 'Utu Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Erilaz Galea +1',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',
        Legs = 'Carmine Cuisses +1',
        Feet = 'Nyame Sollerets',
    },

    Dt = {
        Ammo = 'Staunch Tathlum',--2
        Head = 'Nyame Helm',--7
        Neck ='Futhark Torque +1',--4 currently
        Ear1 = 'Odnowa Earring +1',--3
        Ear2 = 'Eabani Earring',
        --Body = 'Nyame Mail',--9
        Body = 'Agwu\'s Robe',--replace with Runeist coat +3
        Hands = 'Nyame Gauntlets',--7
        Ring1 = 'Moonbeam Ring',--4
        Ring2 = 'Defending Ring',--10
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',----8
        Feet = 'Nyame Sollerets',--7
    },

    Tp_Default = {
        Main = 'Epeolatry',
        Sub = 'Utu Grip',
        Ammo = 'Yamarang',
        Head = 'Adhemar Bonnet +1',
        Neck ='Anu Torque',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Futhark Coat +3',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = 'Meg. Chausses +2',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
    },
    Tp_Hybrid = {
        Main = 'Epeolatry',
        Sub = 'Utu Grip',
        Ammo = 'Yamarang',
        Head = 'Nyame Helm',
        Neck ='Anu Torque',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Futhark Coat +3',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = 'Meg. Chausses +2',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
    },
    Tp_Acc = {
        Ring1 = 'Cacoethic Ring +1',
        Ring2 = 'Chirich Ring +1',
        Waist = 'Ioskeha Belt +1',
    },

    --These will overwrite any above TP sets if /tankset is used
    Tank_Main = {--Default Tanking,  dt 
        Main = 'Epeolatry',
        --Sub = 'Refined Grip +1',--3
        Ammo = 'Staunch Tathlum',--2
        Head ='Nyame Helm',--7
        Neck = 'Futhark Torque +1',
        Ear1 = 'Odnowa Earring +1',--2
        Ear2 = 'Ethereal Earring',--3kinda
        --Ear2 = 'Hermodr Earring',--dragon points, 10 parry skill
        Body = 'Futhark Coat +3',--9
        Hands = 'Turms Mittens',
        Ring1 = 'Moonbeam Ring',--4
        Ring2 = 'Defending Ring',--7
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Waist = 'Flume Belt +1',
        Legs = 'Eri. Leg Guards +1',-- PDT 7
        Feet = 'Turms Leggings',--7
        },
    Tank_MEVA = {
        Main = 'Epeolatry',--Aettir technically better here
        --Sub = 'Refined Grip +1',
        Ammo = 'Staunch Tathlum',
        Head ='Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Eabani Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = 'Purity Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },--want diff cape here
        Waist = 'Carrier\'s Sash',
        Legs = 'Agwu\'s Slops',
        Feet = 'Nyame Sollerets',
    },


    Precast = {
        Ammo = 'Sapience Orb', -- 2
        Head = 'Haruspex Hat', -- 8
        Neck = 'Baetyl Pendant', -- 4
        Ear1 = 'Loquac. Earring', -- 2
        Ear2 = 'Etiolation Earring', -- 1
        Body = 'Agwu\'s Robe', -- 8
        Hands = 'Leyline Gloves', -- 6
        Ring1 = 'Prolix Ring', -- 2
        Ring2 = 'Kishar Ring', -- 4
        Waist = 'Audumbla Sash',
        Legs = 'Aya. Cosciales +2', -- 6
        Feet = 'Carmine Greaves +1',--7
    },
    Precast_Inspiration = {--this set I use for when my 5/5 inspire merits kicking in with val/vall up
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Etiolation Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Gelatinous Ring +1',
        Waist = 'Audumbla Sash',
        Legs = 'Futhark Trousers +2',
        Feet = 'Agwu\'s Pigaches',
    },
    Cure_Precast = {
        Ear1 = 'Mendi. Earring', -- 5
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash', -- 8
        Legs = 'Futhark Trousers +2', -- 13
    },
    SIR = {--10 merits + 90
        Ammo = 'Staunch Tathlum', -- 10
        Head = 'Agwu\'s Cap', -- 10
        Neck = 'Moonlight Necklace', -- 15
        Hands = 'Rawhide Gloves', -- 15
        Waist = 'Audumbla Sash', -- 10
        Legs = 'Carmine Cuisses +1', -- 20
        Feet = 'Taeon Boots', -- 10
    },
    Enmity = {
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Cryptic Earring',
        Body = 'Emet Harness +1',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Legs = 'Eri. Leg Guards +1',
        Feet = 'Erilaz Greaves +1',
    },
    SIRenmity = { -- Foil and blue spells mostly
        Ammo = 'Staunch Tathlum', -- 10
        Head = 'Agwu\'s Cap', -- 10
        Neck = 'Moonlight Necklace', -- 15
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Cryptic Earring',
        Body = 'Emet Harness +1',
        Hands = 'Rawhide Gloves', -- 15
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Waist = 'Audumbla Sash', -- 10
        Legs = 'Carmine Cuisses +1', -- 20
        Feet = 'Taeon Boots', -- 8
    },

    Cure = {
        Neck = 'Sacro Gorget', -- 10
        Ear1 = 'Mendi. Earring', -- 5
        Back = 'Solemnity Cape', -- 7
        Waist = 'Gishdubar Sash', --10rec
    },
    Regen = {
        Neck = 'Sacro Gorget',
        Legs = 'Futhark Trousers +2',
    },
    Enhancing = {
        Head = 'Erilaz Galea +1',
        Neck = 'Incanter\'s Torque',
        Legs = 'Futhark Trousers +2',
    },
    Phalanx = {
        Head = 'Fu. Bandeau +1', -- 5
        Neck = 'Incanter\'s Torque',
    },
    Stoneskin = {
        Waist = 'Siegel Sash',
    },
    Temper = {
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Andoaa Earring',
        Ring1 = 'Stikini Ring +1',
        --Back = 'Merciful Cape',
        Legs = 'Carmine Cuisses +1',
    },

    Preshot = {},
    Midshot = {
        Ear1 = 'Telos Earring',
        Ear2 = 'Crep. Earring',
    },

    Ws_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Dimi_Default = {
        Ammo = 'Knobkierrie',
        Head = 'Blistering Sallet +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Nyame Mail',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Ilabrat Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Lustratio Subligar',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Dimi_Hybrid = {
    },
    Dimi_Acc = {
    },
    Reso_Default = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Lustratio Cap',
        Neck = 'Fotia Gorget',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Nyame Mail',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },--str better
        Waist = 'Fotia Belt',
        Legs = 'Meg. Chausses +2',
        Feet = 'Lustratio Leggings',
    },
    Reso_Hybrid = {
    },
    Reso_Acc = {
    },
    Shockwave_Default = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Nyame Helm',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Crematio Earring',
        Body = 'Nyame Mail',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+20' } },--str better
        Waist = 'Acuity Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Shockwave_Hybrid = {
    },
    Shockwave_Acc = {
    },

    Sforzo = {
        Body = 'Futhark Coat +3',
    },
    Swipe = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Agwu\'s Cap',
        Neck = 'Baetyl Pendant',
        Ear2 = 'Crematio Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Waist = 'Eschan Stone',
        Legs = 'Agwu\'s Slops',
        Feet = 'Agwu\'s Pigaches',
    },
    Pulse = {
        Head = 'Erilaz Galea +1',
    },
    Vallation = {
        Body = 'Runeist Coat +1',
    },
    Battuta = {
        Head = 'Fu. Bandeau +1',
    },

    TH = {--/th will force this set to equip for 10 seconds
        Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Potency of "Cure" effect received+5%', [2] = 'Mag. Acc.+19', [3] = 'Accuracy+21', [4] = '"Mag. Atk. Bns."+19', [5] = '"Treasure Hunter"+2' } },
	},
    Movement = {
        Legs = 'Carmine Cuisses +1',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.Packer = {
    {Name = 'Om. Sandwich', Quantity = 'all'},
    {Name = 'Black Curry Bun', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
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
	
    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
    local runes = T{'Ignis','Gelus','Flabra','Tellus','Sulpor','Unda','Lux','Tenebrae',};
    
    if runes:contains(ability.Name) then return end

    gFunc.EquipSet(sets.Enmity);

    if string.match(ability.Name, 'Swipe') or string.match(ability.Name, 'Lunge') then
		gFunc.EquipSet(sets.Swipe);
    elseif string.match(ability.Name, 'Vallation') or string.match(ability.Name, 'Valiance') then
		gFunc.EquipSet(sets.Vallation);
    elseif string.contains(ability.Name, 'Pulse') then
		gFunc.EquipSet(sets.Pulse);
    elseif string.contains(ability.Name, 'Sforzo') then
		gFunc.EquipSet(sets.Sforzo);
    elseif string.match(ability.Name, 'Battuta') then
		gFunc.EquipSet(sets.Battuta);
	end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    local val = gData.GetBuffCount('Valiance');
    local vall = gData.GetBuffCount('Vallation');
    gFunc.EquipSet(sets.Precast)

    if (val >= 1) or (vall >= 1) then
        gFunc.EquipSet(sets.Precast_Inspiration);
    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()--sloppy set handling here, need to clean this up
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.SIR);
    gFunc.EquipSet(sets.Enhancing);

    if string.contains(spell.Name, 'Cur') or string.contains(spell.Name, 'Carrot') then
        gFunc.EquipSet(sets.Cure);
    elseif string.contains(spell.Name, 'Regen') then
        gFunc.EquipSet(sets.Regen);
    elseif string.match(spell.Name, 'Phalanx') then
        gFunc.EquipSet(sets.Phalanx);
    elseif string.match(spell.Name, 'Stoneskin') then
        gFunc.EquipSet(sets.Stoneskin);
    elseif string.match(spell.Name, 'Temper') then
        gFunc.EquipSet(sets.Temper);
    elseif string.match(spell.Name, 'Foil') or (spell.Skill == 'Blue Magic') then
        gFunc.EquipSet(sets.SIRenmity);
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
   
        if string.match(ws.Name, 'Dimidiation') then
            gFunc.EquipSet(sets.Dimi_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Dimi_' .. gcdisplay.GetCycle('MeleeSet')); end
            gcinclude.DoMoonshade()
	    elseif string.match(ws.Name, 'Resolution') then
            gFunc.EquipSet(sets.Reso_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Reso_' .. gcdisplay.GetCycle('MeleeSet')); end
            gcinclude.DoMoonshade()
        elseif string.match(ws.Name, 'Shockwave') then
            gFunc.EquipSet(sets.Shockwave_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Shockwave_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
