local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');


sets = {
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Sulevia\'s Mask +2',
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
        Feet = 'Sulev. Leggings +2',
    },
    Reseting = {},
    Town = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Aegis',
        Ammo = 'Staunch Tathlum',
        Head = 'Blistering Sallet +1',
        Body = 'Cab. Surcoat +3',
        Hands = 'Sakpata\'s Gauntlets',
        Legs = 'Carmine Cuisses +1',
        Feet = 'Sulev. Leggings +2',
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
    },

    Ws_Default = {
        Ammo = 'Ginsen',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Chant_Default = {
        Ammo = 'Ginsen',
        Head = 'Blistering Sallet +1',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Assim. Jubbah +2',
        Hands = 'Adhemar Wrist. +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Legs = 'Gleti\'s Breeches',
        Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
    },
    Chant_Acc = {
    },
    Savage = {
        Ammo = 'Ginsen',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Moonshade Earring',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Begrudging Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Legs = 'Gleti\'s Breeches',
        Feet = 'Herculean Boots',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },

    Movement = {
        Legs = 'Carmine Cuisses +1',
	},
};

profile.Sets = gcinclude.MergeSets();

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10');
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
    if (args[1] == 'test') then print(chat.header('Test') .. chat.message('This is a test')) end
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

    gcinclude.CheckCommonDebuffs();
	gcinclude.CheckLockingRings();
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
	if string.match(ability.Name, 'Call Beast') or string.match(ability.Name, 'Bestial Loyalty') then
		gFunc.EquipSet(sets.Call);
	elseif string.match(ability.Name, 'Reward') then
		gFunc.EquipSet(sets.Reward);
	end
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast)
end

profile.HandleMidcast = function()
    gFunc.EquipSet(sets.Cure)
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.WSbailout();
    if not (canWS) then gFunc.CancelAction() return;
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
