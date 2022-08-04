local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

sets = T{
    Idle = {
        Range = 'Doomsday',
        Ammo = 'Decimating Bullet',
        Head = 'Meghanada Visor +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Sheltered Ring',
        Ring2 = 'Meghanada Ring',
        Back = 'Repulse Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Mummu Kecks +1',
        Feet = 'Meg. Jam. +1',
    },
    Resting = {},
    Idle_Regen = {
        Head = 'Meghanada Visor +1',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring2 = 'Meghanada Ring',
        Feet = 'Meg. Jam. +1',
    },
    Idle_Refresh = {},
    Town = {
    },

    Dt = {
        Head = 'Meghanada Visor +1',
        Neck = 'Loricate Torque',
        Ear1 = 'Colossus\'s Earring',
        --Ear2 = 'Etiolation Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        --Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Ring2 = 'Meghanada Ring',
        Back = 'Repulse Mantle',
        --Waist = 'Flume Belt +1',
        --Legs = 'Nyame Flanchard',
        Feet = 'Meg. Jam. +1',
    },

    Tp_Default = {
        Range = 'Doomsday',
        Head = 'Mummu Bonnet +1',
        Neck = 'Clotharius Torque',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Mummu Wrists +1',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Meghanada Ring',
        Back = 'Bleating Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Carmine Cuisses',
        Feet = 'Mummu Gamash. +1',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },


    Precast = {
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear2 = 'Etiolation Earring',
        Body = 'Taeon Tabard',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Legs = 'Enif Cosciales',
    },


    Cure = {
        Legs = 'Carmine Cuisses',
    },

    Enhancing = {
    },

    Enfeebling = {
    },
    Macc = {},

    Drain = {
    },

    Nuke = {
        Ear1 = 'Hecate\'s Earring',
    },

    Preshot = {--base preshot, no flurry
        Waist = 'Impulse Belt',
        Legs = 'Adhemar Kecks +1',
    },
    Preshot_FlurryI = {--with flurry I on
    },
    Preshot_FlurryII = {--with flurry II on
    },
    Midshot = {
        Ring1 = 'Dingir Ring',
        Waist = 'Aquiline Belt',
    },
    Midshot_Acc = {
    },
    TripleShot = {
    },

    Ws_Default = {
        Head = 'Nyame Helm',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Savage_Default = {
        Neck = 'Light Gorget',
        Ear2 = 'Moonshade Earring',
        Hands = 'Meg. Gloves +2',
        Waist = 'Sailfi Belt +1',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },

    Evisceration_Default = {
        Head = 'Adhemar Bonnet +1', 
        Neck = 'Shadow Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Mummu Jacket +2',
        Hands = 'Mummu Wrists +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Begrudging Ring',
        Waist = 'Fotia Belt',
        Legs = 'Mummu Kecks +2',
        Feet = 'Mummu Gamash. +2',
    },
    Evisceration_Hybrid = {
    },
    Evisceration_Acc = {
    },

    Aedge_Default = {
        Head = 'Herculean Helm', 
        Neck = 'Baetyl Pendant',
        Ear1 = 'Hecate\'s Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Rawhide Vest',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Shiva Ring +1',
        Back = 'Gunslinger\'s Cape',
        Waist = 'Fotia Belt',
        Legs = 'Mummu Kecks +1',
        Feet = 'Adhemar Gamashes',
    },
    Aedge_Hybrid = {
    },
    Aedge_Acc = {
    },

    Laststand_Default = {
        Head = 'Adhemar Bonnet +1', 
        Neck = 'Fotia Gorget',
        Ear1 = 'Telos Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Mummu Jacket +2',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Rufescent Ring',
        Ring2 = 'Karieyh Ring',
        Waist = 'Fotia Belt',
        Legs = 'Mummu Kecks +2',
        Feet = 'Adhemar Gamashes',
    },
    Laststand_Hybrid = {
    },
    Laststand_Acc = {
    },

    Wildfire_Default = {
        Head = 'Herculean Helm', 
        Neck = 'Baetyl Pendant',
        Ear1 = 'Hecate\'s Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Rawhide Vest',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Shiva Ring +1',
        Back = 'Gunslinger\'s Cape',
        Waist = 'Fotia Belt',
        Legs = 'Mummu Kecks +1',
        Feet = 'Adhemar Gamashes',
    },
    Wildfire_Hybrid = {
    },
    Wildfire_Acc = {
    },

    Leaden_Default = {
        Head = 'Herculean Helm', 
        Neck = 'Baetyl Pendant',
        Ear1 = 'Hecate\'s Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Rawhide Vest',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Shiva Ring +1',
        Back = 'Gunslinger\'s Cape',
        Waist = 'Fotia Belt',
        Legs = 'Mummu Kecks +1',
        Feet = 'Adhemar Gamashes',
    },
    Leaden_Hybrid = {
    },
    Leaden_Acc = {
    },

    QD = {
        Ammo = 'Animikii Bullet',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Crematio Earring',
        Body = 'Rawhide Vest',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Shiva Ring +1',
        Back = 'Gunslinger\'s Cape',
        Waist = 'Aquiline Belt',
        Legs = 'Ikenga\'s Trousers',
        Feet = 'Adhemar Gamashes',
    },
    QD_Acc = {
        Head = 'Malignance Chapeau',
        Neck = 'Sanctity Necklace',
        Ear2 = 'Crep. Earring',
        Body = 'Nyame Mail',
        Hands = 'Malignance Gloves',
        Ring1 = 'Crepuscular Ring',
        Ring2 = 'Metamor. Ring +1',
        Legs = 'Ikenga\'s Trousers',
        Feet = 'Nyame Sollerets',
    },
    Rolls = {
        Range = 'Compensator',
        Ring2 = 'Barataria Ring',
    },
    WildCard = {Feet = 'Lanun Bottes +2'},
    TH = {--/th will force this set to equip for 10 seconds
		Waist = 'Chaac Belt',
	},
    Movement = {
        Legs = 'Carmine Cuisses',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    gcinclude.CORmsg = true; -- set this to false if you do not want to see lucky/unlucky # messages, can also do /cormsg in game to change on the fly
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
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
		 
		gFunc.EquipSet(sets.Dt);
	end
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
     
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if (ability.Name:contains('Roll')) then
        gFunc.EquipSet(sets.Dt);
        gFunc.EquipSet(sets.Rolls);
        gcinclude.DoCORmsg(ability.Name);
    elseif (ability.Name == 'Wild Card') then
        gFunc.EquipSet(sets.WildCard);
    elseif (ability.Name:contains('Shot')) then
        gFunc.EquipSet(sets.QD);
        if (gcdisplay.GetCycle('Melee') == 'Acc') or (ability.Name == 'Dark Shot') or (ability.Name == 'Light Shot') then
            gFunc.EquipSet(sets.QD_Acc);
        end
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
    local flurryI = gData.GetBuffCount(265);
    local flurryII = gData.GetBuffCount(581);

    gFunc.EquipSet(sets.Preshot);

    if flurryII < 0 then
        gFunc.EquipSet(sets.Preshot_FlurryII);
    elseif flurryI < 0 then
        gFunc.EquipSet(sets.Preshot_FlurryI);
    end
end

profile.HandleMidshot = function()
    local triple = gData.GetBuffCount('Triple Shot');
    gFunc.EquipSet(sets.Midshot);

    if triple > 0 then
        gFunc.EquipSet(sets.TripleShot);
    end

    if (gcdisplay.GetCycle('MeleeSet') == 'Acc') then
        gFunc.EquipSet(sets.Midshot_Acc);
    end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
        
        if string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Evisceration') then
            gFunc.EquipSet(sets.Evisceration_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Evisceration_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Last Stand') then
            gFunc.EquipSet(sets.Laststand_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Laststand_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Wildfire') then
            gFunc.EquipSet(sets.Wildfire_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Wildfire_' .. gcdisplay.GetCycle('MeleeSet')); end
        elseif string.match(ws.Name, 'Leaden Salute') then
            gFunc.EquipSet(sets.Leaden_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Leaden_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
