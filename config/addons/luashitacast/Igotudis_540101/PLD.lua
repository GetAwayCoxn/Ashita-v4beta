local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');


sets = {
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck ='Sanctity Necklace',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Etoilation Earring',
        Body = 'Cab. Surcoat +3',
        Hands = 'Volte Moufles',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Nyame Sollerets',
    },
    Reseting = {},
    Regen = {},
    Refresh = {},
    Town = {
        Main = 'Exalibur',
        Sub = 'Aegis',
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Body = 'Cab. Surcoat +3',
        Hands = 'Sakpata\'s Gauntlets',
        Legs = 'Carmine Cuisses +1',
        Feet = 'Nyame Sollerets',
    },

    Dt = {
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck ='Loricate Torque +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Etoilation Earring',
        Body = 'Cab. Surcoat +3',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Nyame Sollerets',
    },

    Tp_Default = {
        Ammo = 'Coiste Bodhar',
        Head = 'Flam. Zucchetto +2',
        Neck ='Sanctity Necklace',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Flamma Korazin +2',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Flamma Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Flam. Gambieras +2',
    },
    Tp_Hybrid = {
        Ammo = 'Ginsen',
        Head ='Sulevia\'s Mask +2',
        Ear1 = 'Odnowa Earring +1',
        Body = 'Sulevia\'s Plate. +2',
        Hands = 'Sakpata\'s Gauntlets',
        Ring2 = 'Cacoethic Ring',
        Waist = 'Creed Baudrier',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sulev. Leggings +2',
    },
    Tp_Acc = {
    },


    Precast = {
        Ammo = 'Staunch Tathlum',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Etiolation Earring',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Legs = 'Enif Cosciales',
        Feet = 'Odyssean Greaves',
    },
    Cure_Precast = {
        Ear2 = 'Nourish. Earring +1',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    SIR = {
        Ammo = 'Staunch Tathlum', -- 10
        Neck = 'Loricate Torque +1', -- 5
        Ear1 = 'Gwati Earring',
        Back = 'Solemnity Cape',
        Waist = 'Rumination Sash', -- 10
        Legs = 'Carmine Cuisses +1', -- 20
    },
    Enmity = {
        Neck = 'Unmoving Collar +1',
        Body = 'Cab. Surcoat +3',
        Ring1 = 'Cacoethic Ring',
        Ring2 = 'Vengeful Ring',
        Ear2 = 'Cryptic Earring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Creed Baudrier',
    },

    Cure = {
        Neck = 'Sacro Gorget', -- 10
        Ear2 = 'Nourish. Earring +1', -- 6
        Hands = 'Macabre Gaunt. +1', -- 11
        Back = 'Solemnity Cape', -- 7
        Legs = 'Flamma Dirs +2', -- 9 on me
        Feet = 'Odyssean Greaves', -- 7
    },
    Phalanx = {
        Legs = 'Sakpata\'s Cuisses', -- 5
    },
    Stoneskin = {
        Waist = 'Siegel Sash',
    },

    Preshot = {},
    Midshot = {},

    Ws_Default = {
        Ammo = 'Ginsen',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Feet = 'Valorous Greaves',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Chant_Default = {
        Ammo = 'Jukukik Feather',
        Head = 'Blistering Sallet +1',
        Ear1 = 'Mache Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Cab. Surcoat +3',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
    },
    Chant_Acc = {
    },
    Savage_Default = {
        Ammo = 'Ginsen',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Moonshade Earring',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Feet = 'Sulev. Leggings +2',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },

    Fealty = {
        Body = 'Cab. Surcoat +3',
    },
    Movement = {
        Legs = 'Carmine Cuisses +1',
	},
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
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
    gFunc.EquipSet(sets.Enmity)
	if string.match(ability.Name, 'Fealty') then
		gFunc.EquipSet(sets.Fealty);
	end
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gcinclude.CheckPrecast ();
    gFunc.EquipSet(sets.Precast)

    if string.contains(spell.Name, 'Cur') then
        gFunc.EquipSet(sets.Cure_Precast);
    end
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);
    end
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    gcinclude.CheckMidcast ();
    gFunc.EquipSet(sets.SIR)

    if string.contains(spell.Name, 'Cur') then
        gFunc.EquipSet(sets.Cure);
    elseif string.match(spell.Name, 'Phalanx') then
        gFunc.EquipSet(sets.Phalanx);
    elseif string.match(spell.Name, 'Stoneskin') then
        gFunc.EquipSet(sets.Stoneskin);
    end
end

profile.HandlePreshot = function()
    gcinclude.CheckPreshot();
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gcinclude.CheckMidshot();
    gFunc.EquipSet(sets.Midshot);
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
            gFunc.EquipSet('Chant_' .. varhelper.GetCycle('Set')); end
	    elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (varhelper.GetCycle('Set') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. varhelper.GetCycle('Set')); end
        end
    end
end

return profile;
