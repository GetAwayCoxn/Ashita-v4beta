local profile = {};
varhelper = gFunc.LoadFile('common\\varhelper.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


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
    Idle_Regen = {},
    Idle_Refresh = {},
	Town = {},
	
	Dt = {
		Head = 'Meghanada Visor +1',
		Body = 'Tartarus Platemail',
		Hands = 'Meg. Gloves +2',
		Legs = 'Meg. Chausses +2',
		Feet = 'Meg. Jam. +1',
		Neck = 'Diemer Gorget',
		Ring1 = 'Defending Ring',
		Back = 'Solemnity Cape',
	},
    Pet_Dt = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Anwig Salade',
        Neck = 'Empath Necklace',
        Ear1 = 'Rimeice Earring',
        Ear2 = 'Handler\'s Earring +1',
        Body = 'Taeon Tabard',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Gishdubar Sash',
        Legs = 'Taeon Tights',
        Feet = 'Gleti\'s Boots',
	},
	
	Tp_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Malignance Chapeau',
        Neck = 'Anu Torque',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Petrov Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
	Tp_Hybrid = {
        Neck = 'Empath Necklace',
        Ear1 = 'Mache Earring',
        Hands = 'Malignance Gloves',
        Ring1 = 'Cacoethic Ring',
    },
	Tp_Acc = {},
    Pet_Only_Tp = {
        Neck = 'Shulmanu Collar',
        Legs = 'Taeon Tights',
    },

    Precast = {
        Body = 'Taeon Tabard',
    },

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
    Ready = {
		Legs = 'Gleti\'s Breeches',
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

profile.Sets = sets;

local function HandlePetAction(PetAction)
	gFunc.EquipSet(sets.PetReadyDefault);

	if (PetAction.Name == BstPetAttack) then
        gFunc.EquipSet(sets.PetAttack);
	elseif (PetAction.Name == BstMagicAttack) then
        gFunc.EquipSet(sets.PetMagicAttack);
	elseif (PetAction.Name == BstMagicAccuracy) then
        gFunc.EquipSet(sets.PetMagicAccuracy);
    end
end

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
	gcinclude.Initialize:once(3);

    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) and gcinclude.BstPetAttack:contains(petAction.Name) then
        HandlePetAction(petAction);
        return;
    end
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet('Tp_' .. varhelper.GetCycle('Set'));
    elseif (pet ~= nil and pet.Status == 'Engaged') then
        gFunc.EquipSet(sets.Pet_Only_Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end
	
	if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end
	if (varhelper.GetToggle('DTset') == true) then
		gFunc.EquipSet(sets.Dt);
        if (pet ~= nil) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
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
    elseif string.match(ability.Type, 'Ready') then
		gFunc.EquipSet(sets.Ready);
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

    if string.contains(spell.Name, 'Utsusemi') then
        gFunc.EquipSet(gcinclude.sets.Utsu_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
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
    end
end

return profile;