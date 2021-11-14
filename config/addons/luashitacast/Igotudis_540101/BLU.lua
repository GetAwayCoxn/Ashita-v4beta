local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');
sets = {
    Idle = {
        Ammo = 'Staunch Tathlum',
        Head = 'Rawhide Mask',
        Neck = 'Bathy Choker +1',
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
        Head = 'Ipoca Beret' -- Test Item
    };
	Town = {
    };
	
	Dt = {
		Ammo = 'Staunch Tathlum',
		Neck = 'Bathy Choker +1',
		Ear1 = 'Eabani Earring',
		Body = 'Gleti\'s Cuirass',
		Hands = 'Malignance Gloves',
		Waist = 'Flume Belt +1',
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
        Body = 'Luhlaza Jubbah +3',
        Hands = '',
        Waist = '',
        Feet = '',
    },
    Precast_Stoneskin = {
        Waist = 'Siegel Sash'   
    },

    Ws_Default = {
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
    Ws_Hybrid = {
        Head = 'Nyame Helm',
        Body = 'Gleti\'s Cuirass',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots'
    },
    Ws_Acc = {
    },
    Chant_Default = {
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
    Chant_Hybrid = {
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
    },
    Savage_Acc = {
    },
	
    Diffusion = {
        Feet = 'Luhlaza Charuqs +1'
    },
	Movement = {
		Legs = 'Carmine Cuisses +1',
	},
};
gcinclude.MergeSets();
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
	gcinclude.Initialize();
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
	gcinclude.CheckLockingRings();
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast)
    if string.match(spell.Name, 'Stoneskin') then gFunc.EquipSet(sets.Precast_Stoneskin) end
end

profile.HandleMidcast = function()
    local buff = gData.GetBuffCount('Diffusion');
    local spell = gData.GetAction();

    if (buff>=1) then gFunc.EquipSet(sets.Diffusion) end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction();
    
    gFunc.EquipSet(sets.Ws_Default)
    if (varhelper.GetCycle('Set') ~= 'Default') then
    gFunc.EquipSet('Ws_' .. varhelper.GetCycle('Set')); end
   
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

return profile;