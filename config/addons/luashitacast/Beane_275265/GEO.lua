local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

sets = T{
    Idle = {
        Main = 'Malignance Pole',
        Sub = 'Niobid Strap',
        Range = 'Dunna',
        Head = 'Befouled Crown',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Genmei Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Mallquis Saio',
        Hands = 'Mallquis Cuffs +1',
        Ring1 = 'Defending Ring',
        Ring2 = 'Blood Ring',
        Back = 'Mecisto. Mantle',
        Waist = 'Gishdubar Sash',
        Legs = 'Nares Trews',
        Feet = 'Mallquis Clogs +1',
    },
    Idle_Pet = {
        Range = 'Dunna',
        Ear1 = 'Rimeice Earring',
        -- Body = 'Telchine Chas.',
        Ring1 = 'Defending Ring',
        Waist = 'Isa Belt',
        Legs = 'Psycloth Lappas',
        -- Feet = 'Telchine Pigaches',
    },
    Resting = {},
    Idle_Regen = {
    },
    Idle_Refresh = {
        Head = 'Befouled Crown',
        Legs = 'Nares Trews',
    },
    Town = {
        Main = 'Lilith\'s Rod',
        Sub = 'Morbol Shield',
        Range = 'Dunna',
        Head = '',
        Body = 'Morbol Apron',
        Legs = 'Morbol Subligar',
    },

    Dt = {
        Main = 'Malignance Pole',
        Sub = 'Niobid Strap',
        Neck = 'Twilight Torque',
        Ear2 = 'Etiolation Earring',
        Body = 'Mallquis Saio',
        Ring1 = 'Defending Ring',
        Ring2 = 'Patricius Ring',
    },

    Tp_Default = {
        Range = 'Dunna',
        Neck = 'Sanctity Necklace',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },


    Precast = {
        -- Main = 'Solstice',
        Range = 'Dunna',
        Head = 'Merlinic Hood',
        Neck = 'Voltsurge Torque',
        Ear2 = 'Etiolation Earring',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Mallquis Ring',
        Waist = 'Rumination Sash',
        Feet = 'Merlinic Crackows',
    },
    Cure_Precast = {
        -- Feet = 'Vanya Clogs',
    },
    Enhancing_Precast = {
        -- Waist = 'Siegel Sash',
    },
    Stoneskin_Precast = {
        -- Head = 'Umuthi Hat',
        -- Hands = 'Carapacho Cuffs',
        -- Waist = 'Siegel Sash',
    },


    Cure = {--I cap is 50, II cap is 30
        Hands = 'Weath. Cuffs +1',
    },
    Self_Cure = {--cap 30
        -- Waist = 'Gishdubar Sash',
    },
    Regen = {
        Body = 'Telchine Chas.',
        Legs = 'Telchine Braconi',
        Feet = 'Telchine Pigaches',
    },
    Cursna = {
    },

    Enhancing = {
        Head = 'Befouled Crown',
        Body = 'Telchine Chas.',
        Ring1 = 'Defending Ring',
        Waist = 'Rumination Sash',
        Legs = 'Telchine Braconi',
        Feet = 'Telchine Pigaches',
    },
    Stoneskin = {
        -- Neck = 'Nodens Gorget',
        -- Waist = 'Siegel Sash',
    },
    Phalanx = {},
    Refresh = {
		-- Waist = 'Gishdubar Sash',
    },
    Geomancy = { --900 skill, then indi duration, then CMP
        Range = 'Dunna',
        Body = 'Telchine Chas.',
    },
    Indi = {
        -- Main = 'Solstice',
    },

    Enfeebling = {
        Head = 'Merlinic Hood',
        Neck = 'Sanctity Necklace',
        Back = 'Merciful Cape',
        Waist = 'Sacro Cord',
        Legs = 'Psycloth Lappas',
    },
    Macc = {
        Head = 'Merlinic Hood',
        Neck = 'Sanctity Necklace',
        Back = 'Merciful Cape',
        Waist = 'Sacro Cord',
        Feet = 'Mallquis Clogs +1',
    },

    Drain = {
        Head = 'Merlinic Hood',
        Neck = 'Sanctity Necklace',
        Ring1 = 'Kishar Ring',
        Back = 'Merciful Cape',
        Waist = 'Sacro Cord',
        Feet = 'Merlinic Crackows',
    },

    Nuke = {
        Head = 'Merlinic Hood',
        Neck = 'Sanctity Necklace',
        Body = 'Mallquis Saio',
        Hands = 'Mallquis Cuffs +1',
        Ring1 = 'Omega Ring',
        Ring2 = 'Mallquis Ring',
        Back = 'Merciful Cape',
        Waist = 'Sacro Cord',
        Legs = 'Mallquis Trews',
        Feet = 'Merlinic Crackows',
    },
    NukeACC = {
    },
    Burst = {
        Head = 'Merlinic Hood', -- 6 and 0
        Ring1 = 'Locus Ring', -- 5 and 0
        Legs = 'Mallquis Trews', -- 3 and 0
        Feet = 'Merlinic Crackows', -- 10 and 0
    },
    -- Mp_Body = {Body = 'Seidr Cotehardie',},

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Aedge_Default = {
    },
    Aedge_Hybrid = {
    },
    Aedge_Acc = {
    },

    Bolster = {Body = 'Bagua Tunic +3'},
    TH = {--/th will force this set to equip for 10 seconds
        --Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
	},
    Movement = {
        Feet = 'Herald\'s Gaiters',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.Packer = {
    {Name = 'Tropical Crepe', Quantity = 'all'},
    {Name = 'Rolan. Daifuku', Quantity = 'all'},
    {Name = 'Fruit Parfait', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local pet = gData.GetPet();

    gFunc.EquipSet(sets.Idle);

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet'));
        end
        if (gcdisplay.GetToggle('Fight') == false) then
            AshitaCore:GetChatManager():QueueCommand(1, '/fight');
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    gcinclude.CheckDefault ();
    if (pet ~= nil) and (player.Status ~= 'Engaged') then
        gFunc.EquipSet(sets.Idle_Pet);
    end
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Full Circle') then gFunc.EquipSet(sets.Geomancy) end --lazy way to ensure the empy head piece is in on use
    if string.match(ability.Name, 'Bolster') then gFunc.EquipSet(sets.Bolster) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast)

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);

        if (gcdisplay.GetCycle('NukeSet') == 'Macc') then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (gcdisplay.GetToggle('Burst') == true) then
            gFunc.EquipSet(sets.Burst);
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
        if (player.MPP <= 40) then
            gFunc.EquipSet(sets.Mp_Body);
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
        if (gcdisplay.GetCycle('NukeSet') == 'Macc') then
            gFunc.EquipSet(sets.Macc);
        end
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Macc);
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    elseif (spell.Skill == 'Geomancy') then
        gFunc.EquipSet(sets.Geomancy);
        if (string.contains(spell.Name, 'Indi')) then
            gFunc.EquipSet(sets.Indi);
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

        if string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
