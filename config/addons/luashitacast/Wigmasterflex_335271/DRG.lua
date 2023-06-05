local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
    Idle = {
        Main = 'Trishula',
        Sub = 'Duplus Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Ioskeha Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resting = {},
    Idle_Regen = {
        Neck = 'Bathy Choker +1',
    },
    Idle_Refresh = {},
    Town = {
        Main = 'Trishula',
        Sub = 'Duplus Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Flam. Zucchetto +2',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Flamma Korazin +2',
        Hands = 'Sulev. Gauntlets +2',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Ioskeha Belt',
        Legs = { Name = 'Valorous Hose', Augment = { [1] = 'Accuracy+30', [2] = '"Dbl.Atk."+3', [3] = 'Attack+4', [4] = 'DEX+10' } },
        Feet = 'Flam. Gambieras +2',
    },

    Dt = {
        Main = 'Trishula',
        Sub = 'Duplus Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Ioskeha Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },

    Tp_Default = {
        Main = 'Trishula',
        Sub = 'Duplus Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Flam. Zucchetto +2',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Flamma Korazin +2',
        Hands = 'Sulev. Gauntlets +2',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Ioskeha Belt',
        Legs = { Name = 'Valorous Hose', Augment = { [1] = 'Accuracy+30', [2] = '"Dbl.Atk."+3', [3] = 'Attack+4', [4] = 'DEX+10' } },
        Feet = 'Flam. Gambieras +2',
    },
    Tp_Hybrid = {
        Main = 'Trishula',
        Sub = 'Duplus Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Flam. Zucchetto +2',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Nyame Mail',
        Hands = 'Sulev. Gauntlets +2',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Ioskeha Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Flam. Gambieras +2',
    },
    
    Tp_Acc = {
    },


    Precast = {
        Neck = 'Baetyl Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Taeon Tabard',
        Ring1 = 'Prolix Ring',
        Legs = 'Enif Cosciales',
    },


    Cure = {
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ring1 = 'Rufescent Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Legs = 'Carmine Cuisses +1',
    },

    Enhancing = {
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Andoaa Earring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
    },

    Enfeebling = {
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Erra Pendant',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
    },
    Macc = {},

    Drain = {
        Neck = 'Erra Pendant',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
    },

    Nuke = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Hecate\'s Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = 'Knobkierrie',
        Head = { Name = 'Valorous Mask', Augment = { [1] = 'Weapon skill damage +4%', [2] = 'Accuracy+13', [3] = '"Mag. Atk. Bns."+8' } },
        Neck = 'Fotia Gorget',
        Ear1 = 'Thrud Earring',
        Ear2 = { Name = 'Moonshade Earring', Augment = { [1] = 'Accuracy+4', [2] = 'TP Bonus +250' } },
        Body = 'Gleti\'s Cuirass',
        Hands = { Name = 'Valorous Mitts', Augment = { [1] = '"Mag. Atk. Bns."+1', [2] = 'Attack+9', [3] = 'Mag. Acc.+1', [4] = 'STR+5', [5] = 'Weapon skill damage +5%', [6] = 'AGI+2', [7] = 'Accuracy+9' } },
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Back = { Name = 'Brigantia\'s Mantle', Augment = { [1] = 'Accuracy+30', [2] = 'Magic dmg. taken -10%', [3] = 'Attack+20', [4] = '"Store TP"+10' } },
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Sulev. Leggings +2',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Movement = {
        Legs = 'Carmine Cuisses',
	},
};
profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
		gFunc.EquipSet(gcinclude.sets.Dt);
		gFunc.EquipSet(sets.Dt);
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
     
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

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
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Macc);
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
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
