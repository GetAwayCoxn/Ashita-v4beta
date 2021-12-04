local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');


sets = {
    Idle = {
        Ammo = 'Voluspa Tathlum',
        Head = { Name = 'Emicho Coronet', AugPath='C' },
        Neck = 'Empath Necklace',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Macabre Gaunt.',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
	
	Resting = {},
	
	Town = {},
	
	Dt = {
		Head = 'Meghanada Visor +1',
		Body = 'Tartarus Platemail',
		Hands = 'Meg. Gloves +2',
		Legs = 'Meg. Chausses +2',
		Feet = 'Meg. Jam. +1',
		Neck = 'Diemer Gorget',
		Ring1 = 'Defending Ring',
		Back = 'Impassive Mantle',
	},
	
	Tp_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = { Name = 'Emicho Coronet', AugPath='C' },
        Neck = 'Empath Necklace',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Macabre Gaunt.',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
	Tp_Hybrid = {},
	Tp_Acc = {},

	Ws_Default = {
        Ammo = '',
        Head = '',
        Neck ='',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
	
	Call = {
		Hands = 'Ankusa Gloves',
	},
	Reward = {
		Ammo = 'Pet Food Theta',
		Body = 'Monster Jackcoat',
		Feet = 'Monster Gaiters',
		Ear1 = 'Ferine Earring'
	},
	PetReadyDefault = {
		Ammo = 'Voluspa Tathlum',
		Head = 'Emicho Coronet',
		Body = 'Valorous Mail',
		Legs = 'Despair Cuisses',
		Neck = 'Empath Necklace',
		Waist = 'Incarnation Sash',
		Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
	},
	PetAttack = {},
	PetMagicAttack = {},
	PetMagicAccuracy = {},
	
	Movement = {
		Feet = 'Meg. Jam. +1',
	},
};

profile.Sets = gcinclude.MergeSets();

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
	gcinclude.Initialize:once(3);
	
end

profile.OnUnload = function()
	varhelper.Destroy();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) and gcinclude.BstPetAttack:contains(petAction.Name) then
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
	gcinclude.CheckDefault ();
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
    gcinclude.CheckPrecast ();
    gFunc.EquipSet(sets.Precast)
end

profile.HandleMidcast = function()
    gcinclude.CheckMidcast ();
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
	local canWS = gcinclude.WSbailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (varhelper.GetCycle('Set') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. varhelper.GetCycle('Set')) end
    end
end

return profile;