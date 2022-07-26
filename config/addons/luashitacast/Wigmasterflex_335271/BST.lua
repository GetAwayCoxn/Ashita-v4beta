local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Meghanada Visor +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Sheltered Ring',
        Ring2 = 'Paguroidea Ring',
        Back = 'Repulse Mantle',
        Waist = 'Nierenschutz',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Meg. Jam. +1',
    },
	Resting = {},
    Idle_Regen = {
        Neck = 'Wiglen Gorget',
        Hands = 'Meg. Gloves +2',
        Ring2 = 'Meghanada Ring',
        Feet = 'Meg. Jam. +1',
    },
    Idle_Refresh = {},
	Town = {},
	
	Dt = {
        Ammo = 'Crepuscular Pebble',
		Head = 'Meghanada Visor +1',
        Neck = 'Loricate Torque',
        Ear1 = 'Colossus\'s Earring',
        Ear2 = 'Ethereal Earring',
		Body = 'Meg. Cuirie +10',
		Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Dark Ring', Augment = { [1] = 'Magic dmg. taken -4%', [2] = 'Breath dmg. taken -5%', [3] = 'Phys. dmg. taken -4%' } },
        Back = 'Repulse Mantle',
        Waist = 'Nierenschutz',
		Legs = 'Meg. Chausses +2',
		Feet = 'Meg. Jam. +1',
	},
    Pet_Dt = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Anwig Salade',
        Neck = 'Empath Necklace',
        Hands = 'Ankusa Gloves',
        Ring1 = 'Defending Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Legs = 'Tali\'ah Sera. +2',
	},
	
	Tp_Default = {
        Ammo = 'Ginsen',
        Head = 'Meghanada Visor +1',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Meghanada Ring',
        Back = 'Pastoralist\'s Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
	Tp_Hybrid = {
        Head = 'Emicho Coronet',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring2 = 'Tali\'ah Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+6', [2] = '"Store TP"+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'Pet: Accuracy+6', [6] = 'DEX+20' } },
        Waist = 'Kuku Stone',
        Feet = 'Tali\'ah Crackows +1',
    },
	Tp_Acc = {},
    Pet_Only_Tp = {
        Head = 'Emicho Coronet',
        Neck = 'Shulmanu Collar',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring2 = 'Tali\'ah Ring',
        Waist = 'Kuku Stone',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },

    Precast = {
        Neck = 'Voltsurge Torque',
        Ear2 = 'Etiolation Earring',
        Body = 'Taeon Tabard',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
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
		Body = 'Mst. Jackcoat +1',
	},
    Ready = {
		Legs = 'Desultor Tassets',
	},
	PetReadyDefault = {
        Head = 'Emicho Coronet',
        Neck = 'Shulmanu Collar',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring2 = 'Tali\'ah Ring',
        Back = 'Pastoralist\'s Mantle',
        Waist = 'Kuku Stone',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
	},
	PetAttack = {},
	PetMagicAttack = {
        Neck = 'Adad Amulet',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Waist = 'Incarnation Sash',
    },
	PetMagicAccuracy = {
        Neck = 'Adad Amulet',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Waist = 'Incarnation Sash',
    },
	
    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
	Movement = {
		Feet = 'Meg. Jam. +1',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

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
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
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