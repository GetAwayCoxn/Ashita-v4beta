local profile = {};
local gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


local sets = {
    Idle = {
        Main = 'Emeici +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Foire Tobe +2',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Defending Ring',
        Ring2 = 'Sheltered Ring',
        Waist = 'Isa Belt',
        Back = 'Repulse Mantle',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
    Idle_Pet = {
        Head = 'Foire Taj +2',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Waist = 'Isa Belt',
    },
	Resting = {},
    Idle_Regen = {
        Neck = 'Wiglen Gorget',
        Ring1 = 'Paguroidea Ring',
        Ring2 = 'Sheltered Ring',
    },
    Idle_Refresh = {
        Body = 'Vrikodara Jupon',
    },
	Town = {
        Range = 'Neo Animator',
        Ammo = 'Automat. Oil +3',
        Head = 'Kara. Cappello +2',
        Neck = 'Wiglen Gorget',
        Body = 'Foire Tobe +2',
        Ring1 = 'Paguroidea Ring',
        Ring2 = 'Sheltered Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Hermes\' Sandals',
    },
	
	Dt = {
        Neck = 'Loricate Torque',
        Ring1 = 'Defending Ring',
	},
    Pet_Dt = {
        Head = 'Anwig Salade',
        Ring1 = 'Defending Ring',
        Waist = 'Isa Belt',
	},
	
    Pet_Only_Tp_Default = {
        Main = 'Emeici +1',
        Range = 'Neo Animator',
        Ammo = 'Automat. Oil +3',
        Head = 'Tali\'ah Turban +1',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Guignol Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Foire Tobe +2',
        Hands = 'Foire Dastanas +2',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Sheltered Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Waist = 'Incarnation Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
    Pet_Only_Tp_Hybrid = {
    },
    Pet_Only_Tp_Acc = {
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
    },
    -- These sets will be for when both you and your pet are engaged
	Tp_Default = {
        Head = 'Kara. Cappello +2',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Hizamaru Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Waist = 'Kuku Stone',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Herculean Boots',
    },
	Tp_Hybrid = {
    },
	Tp_Acc = {
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Hizamaru Ring',
    },
    -- These following sets are intended for one off items to equip while the pet is engaged (or both of you) based on the PupMode. An example would be Pet HP+ pieces for Tank mode. Can be empty but do not delete.
    Tank = {
        Range = 'Animator P',
        Waist = 'Isa Belt',
    },
    Melee = {
        Range = 'Neo Animator',
    },
    Ranger = {
        Range = 'Animator P II',
        -- Waist = 'Klouskap Sash +1', -- do this after getting +1
    },
    Mage = {
        Range = 'Animator P II',
        --Neck = 'Empath Necklace',
        Ring1 = 'Defending Ring',
        Waist = 'Ukko Sash',
        Legs = 'Foire Churidars +2',
        Feet = 'Foire Babouches +2',
    },

    Precast = {
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Vrikodara Jupon',
        Ring2 = 'Prolix Ring',
        Back = 'Swith Cape',
        Waist = 'Siegel Sash',
        Feet = 'Chelona Boots',
    },

    Enhancing = {
    },
    Phalanx = {
    },
    Stoneskin = {
        Neck = 'Stone Gorget',
        Waist = 'Siegel Sash',
    },
    Refresh = {
    },

    Cure = {
        Ring1 = 'Sirona\'s Ring',
        Ring2 = 'Ephedra Ring',
    },

    Enfeebling = {
    },

	Ws_Default = {
        Head = 'Herculean Helm',
        Neck = 'Light Gorget',
        Ear1 = 'Schere Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Abnoba Kaftan',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'STR+25', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Samnuha Tights',
        Feet = 'Hiza. Sune-Ate +1',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Shijin_Default = {
        Legs = 'Samnuha Tights',
    },
    Shijin_Hybrid = {
    },
    Shijin_Acc = {
    },

    Pet_WS = {
        Head = 'Kara. Cappello +2',
        Neck = 'Shulmanu Collar',
	},
    Pet_RNGWS = {
        Head = 'Kara. Cappello +2',
        Neck = 'Shulmanu Collar',
        Waist = 'Klouskap Sash',
	},
	
	Repair = {
		Ammo = 'Automat. Oil +3',
        Ear1 = 'Guignol Earring',
        Feet = 'Foire Babouches +2',
	},
    Maneuver = {
        --Ear1 = 'Burana Earring',
        --Body = 'Kara. Farsetto +1',
        Hands = 'Foire Dastanas +2',
        Neck = 'Buffoon\'s Collar',
        Back = 'Visucius\'s Mantle',
	},
    Overdrive = {-- this set will force on the ability AND stay on for the duration of OD, dont change the body out because of that
        Range = 'Animator P',
        Ammo = 'Automat. Oil +3',
        Head = 'Kara. Cappello +2',
        Neck = 'Shulmanu Collar',
        --Ear1 = 'Enmerkar Earring',
        --Ear2 = 'Domes. Earring',
        --Body = 'Pitre Tobe +3',
        --Hands = 'Mpaca\'s Gloves',
        Body = 'Foire Tobe +2',
        Hands = 'Foire Dastanas +2',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'Varar Ring +1',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Waist = 'Klouskap Sash',
        --Legs = 'Nyame Flanchard',
        --Feet = 'Mpaca\'s Boots',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },

	TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
	Movement = {
        Feet = 'Hermes\' Sandals',
	},
};
profile.Sets = sets;

profile.Packer = {
    {Name = 'Automat. Oil +3', Quantity = 'all'},
    {Name = 'Bean Daifuku', Quantity = 'all'},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    gcinclude.settings.RefreshGearMPP = 30;
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local pet = gData.GetPet();
    local OD = gData.GetBuffCount('Overdrive');
	
    gFunc.EquipSet(sets.Idle);
    if (pet ~= nil) then
        gFunc.EquipSet(sets.Idle_Pet);
    end
	
    if (pet ~= nil and pet.Status == 'Engaged') then
        gFunc.EquipSet('Pet_Only_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
        gFunc.EquipSet(gcdisplay.GetCycle('PupMode'));
        if (player.Status == 'Engaged') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
    if (pet ~= nil) and (pet.TP > 950) and (pet.Status == 'Engaged') then 
        if (gcdisplay.GetCycle('PupMode') == 'Ranger') then
            gFunc.EquipSet(sets.Pet_RNGWS);
        elseif (gcdisplay.GetCycle('PupMode') == 'Melee') then
            gFunc.EquipSet(sets.Pet_WS);
        end
    end
    if (gcdisplay.GetToggle('DTset') == true) then
        if (pet ~= nil) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
        gFunc.EquipSet(sets.Dt);
	end
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;

    if OD > 0 then
        gFunc.EquipSet(sets.Overdrive);
    end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	if (string.match(ability.Name, 'Repair')) or (string.match(ability.Name, 'Maintenance')) then
		gFunc.EquipSet(sets.Repair);
    elseif (string.contains(ability.Name, 'Maneuver')) then
        gFunc.EquipSet(sets.Maneuver);
    elseif (string.match(ability.Name, 'Overdrive')) then
        gFunc.EquipSet(sets.Overdrive);
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
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

        if string.match(ws.Name, 'Shijin Spiral') then
            gFunc.EquipSet(sets.Shijin_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Shijin_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;