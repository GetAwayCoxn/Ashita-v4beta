local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Skormoth Mask',
        Neck = 'Empath Necklace',
        Ear1 = 'Genmei Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Isa Belt',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Meg. Jam. +1',
    },
	Resting = {},
    Idle_Regen = {
        Head = 'Meghanada Visor +1',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring2 = 'Meghanada Ring',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +1',
    },
    Idle_Refresh = {},
	Town = {
        Main = 'Kaja Axe',
        Sub = 'Leafkin Shield',
        Body = 'Argent Coat',
        Hands = '',
        Legs = 'Argent Hose',
        Feet = '',
    },
	
	Dt = {
        Ammo = 'Crepuscular Pebble',
		Head = 'Meghanada Visor +1',
        Neck = 'Diemer Gorget',
        Ear1 = 'Genmei Earring',
		Body = 'Tartarus Platemail',
		Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
		Legs = 'Meg. Chausses +2',
		Feet = 'Diama. Sollerets',
		Back = 'Impassive Mantle',
	},
    Pet_Dt = {
        Ammo = 'Crepuscular Pebble',
        --Head = 'Anwig Salade',
        Neck = 'Empath Necklace',
        Ear1 = 'Rimeice Earring',
        --Ear2 = 'Handler\'s Earring +1',
        --Body = 'Taeon Tabard',
        Hands = 'Ankusa Gloves',
        Ring2 = 'Defending Ring',
        --Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Isa Belt',
        Legs = 'Tali\'ah Sera. +2',
        --Feet = 'Gleti\'s Boots',
	},
	
	Tp_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Emicho Coronet',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Rimeice Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+6', [2] = '"Store TP"+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'Pet: Accuracy+6', [6] = 'DEX+20' } },
        Waist = 'Sarissapho. Belt',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
	Tp_Hybrid = {
        Head = 'Emicho Coronet',
        Neck = 'Empath Necklace',
        Hands = 'Valorous Mitts',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+6', [2] = '"Store TP"+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'Pet: Accuracy+6', [6] = 'DEX+20' } },
        Waist = 'Hurch\'lan Sash',
    },
	Tp_Acc = {},
    Pet_Only_Tp = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Emicho Coronet',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Rimeice Earring',
        Ear2 = 'Gelai Earring',
        Body = 'Valorous Mail',
        Hands = 'Skd. Bazubands +1',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },

    Precast = {
        Neck = 'Voltsurge Torque',
        Ear2 = 'Etiolation Earring',
        Body = 'Taeon Tabard',
        Legs = 'Limbo Trousers',
    },

    Enhancing = {
    },
    Phalanx = {
    },
    Stoneskin = {
    },
    Refresh = {
    },

    Cure = {
        Hands = 'Macabre Gaunt.',
    },

    Enfeebling = {
    },

	Ws_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Valorous Mask',
        Neck ='Sanctity Necklace',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Flame Ring',
        Ring2 = 'Meghanada Ring',
        Back = 'Bleating Mantle',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +1',
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
		Feet = 'Mst. Gaiters +2',
		Ear1 = 'Ferine Earring'
	},
    Ready = {
	},
	PetReadyDefault = {
		Ammo = 'Voluspa Tathlum',
		Head = 'Emicho Coronet',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Ferine Earring',
        Ear2 = 'Sabong Earring',
		Body = 'Valorous Mail',
        Hands = 'Nukumi Manoplas',
        Ring1 = 'Tali\'ah Ring',
		Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Incarnation Sash',
        Legs = 'Despair Cuisses',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+6', [2] = 'Pet: Attack+22', [3] = 'Pet: Rng.Atk.+22', [4] = 'Attack+12', [5] = 'Accuracy+12' } },
		
	},
	PetAttack = {},
	PetMagicAttack = {
        Head = 'Tali\'ah Turban +2',
        Neck = 'Adad Amulet',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Waist = 'Incarnation Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+6', [2] = 'Pet: Attack+22', [3] = 'Pet: Rng.Atk.+22', [4] = 'Attack+12', [5] = 'Accuracy+12' } },
    },
	PetMagicAccuracy = {
        Head = 'Tali\'ah Turban +2',
        Neck = 'Adad Amulet',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Waist = 'Incarnation Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
	
    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
	Movement = {
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.Packer = {
    {Name = 'Pet Food Theta', Quantity = 'all'},
    {Name = 'Meaty Broth', Quantity = 'all'},
    {Name = 'Spicy Broth', Quantity = 'all'},
    {Name = 'Spumante Broth', Quantity = 'all'},
    {Name = 'Feculent Broth', Quantity = 'all'},
    {Name = 'Venomous Broth', Quantity = 'all'},
    {Name = 'Tant. Broth', Quantity = 'all'},
    {Name = 'Crackling Broth', Quantity = 'all'},
    {Name = 'Dire Broth', Quantity = 'all'},
    {Name = 'Bubbly Broth', Quantity = 'all'},
};

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
	gcinclude.Initialize();

    --[[ Set you job macro defaults here]]
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
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet'));
    elseif (pet ~= nil) and (player.Status == 'Engaged') and (pet.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Hybrid);
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
	if (gcdisplay.GetToggle('DTset') == true) then
         
		gFunc.EquipSet(sets.Dt);
        if (pet ~= nil) and (pet.HPP < 80) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end
	gcinclude.CheckDefault ();
    if (pet ~= nil) then 
        if (player.Status == 'Engaged') and (pet.Status ~= 'Engaged') then
            AshitaCore:GetChatManager():QueueCommand(1, '/ja "Fight" <t>');
        end
    end
     
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
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local spell = gData.GetAction();

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
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
    end
end

return profile;