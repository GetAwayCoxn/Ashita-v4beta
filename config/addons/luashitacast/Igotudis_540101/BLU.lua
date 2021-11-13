local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');
local sets = {
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
	Resting = Idle;
	Town = Idle;
	
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
	Tp_Hybrid = Tp_Default;
	Tp_Acc = Tp_Hybrid;
	
	Precast = {
        Ammo = 'Staunch Tathlum',
        Body = 'Luhlaza Jubbah +3',
        Hands = '',
        Waist = '',
        Feet = '',
    },

    Ws = {
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
    Ws_Hybrid = Ws_Default;
    Ws_Acc = Ws_Hybrid;
    Chant = {
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
    Chant_Hybrid = Chant_Default;
    Chant_Acc = Chant_Hybrid;
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
    Savage_Hybrid = Savage_Default;
    Savage_Acc = Savage_Hybrid;
	
	Movement = {
		Legs = 'Carmine Cuisses +1',
	}
};

profile.Sets = sets;

local function HandlePetAction(PetAction)
	if (PetAction.Name == BstPetAttack) then
        gFunc.EquipSet(sets.PetAttack);
	elseif (PetAction.Name == BstMagicAttack) then
        gFunc.EquipSet(sets.PetMagicAttack);
	elseif (PetAction.Name == BstMagicAccuracy) then
        gFunc.EquipSet(sets.PetMagicAccuracy);
    else
        gFunc.EquipSet(sets.PetReadyDefault);
    end
end

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
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) and BstPetAttack:contains(petAction.Name) then
        HandlePetAction(petAction);
        return;
    end
	
	local player = gData.GetPlayer();
    if (player.Status == 'engaged') then
        gFunc.EquipSet('Tp_' .. varhelper.GetCycle('Set'));
    elseif (player.Status == 'resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end
	
	if (player.IsMoving == true) then
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
	local action = gData.GetAction();
	if string.match(action.Name, 'Call Beast') or string.match(action.Name, 'Bestial Loyalty') then
		gFunc.EquipSet(sets.Call);
	elseif string.match(action.Name, 'Reward') then
		gFunc.EquipSet(sets.Reward);
	end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;