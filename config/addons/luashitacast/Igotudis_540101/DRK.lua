local profile = {}
local gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local sets = {
    Idle = {
        Ammo = "Staunch Tathlum",
        Head = "Jumalik Helm",
        Neck = "Bathy Choker +1",
        Ear1 = "Infused Earring",
        Ear2 = "Etiolation Earring",
        Body = "Nyame Mail",
        Hands = "Volte Moufles",
        Ring1 = "Stikini Ring +1",
        Ring2 = "Chirich Ring +1",
        Back = "Solemnity Cape",
        Waist = "Gishdubar Sash",
        Legs = "Nyame Flanchard",
        Feet = "Nyame Sollerets",
    },
    Resting = {},
    Idle_Regen = {
        Head = "Crepuscular Helm",
        Neck = "Bathy Choker +1",
        Ear1 = "Infused Earring",
        Ring2 = "Chirich Ring +1",
    },
    Idle_Refresh = {
        Head = "Jumalik Helm",
        Ring1 = "Stikini Ring +1",
        Feet = { Name = 'Odyssean Greaves', Augment = { [1] = 'Damage taken-1%', [2] = 'Mag. Acc.+16', [3] = '"Refresh"+2', [4] = 'Attack+16', [5] = '"Mag. Atk. Bns."+16' } },
    },
    Town = {
        Main = "Apocalypse",
        Sub = "Utu Grip",
        Ammo = "Staunch Tathlum",
        Head = "Crepuscular Helm",
        Body = "Fall. Cuirass +3",
        Hands = "Nyame Gauntlets",
        Ring1 = "Stikini Ring +1",
        Ring2 = "Chirich Ring +1",
        Legs = { Name = "Carmine Cuisses +1", AugPath="D" },
        Feet = "Nyame Sollerets",
    },

    Dt = {
        Ammo = "Staunch Tathlum",
        Head = "Nyame Helm",
        Neck = { Name = "Loricate Torque +1", AugPath="A" },
        Ear1 = { Name = "Odnowa Earring +1", AugPath="A" },
        Ear2 = "Etiolation Earring",
        Body = "Nyame Mail",
        Hands = "Volte Moufles",
        Ring1 = "Defending Ring",
        Ring2 = { Name = "Gelatinous Ring +1", AugPath="A" },
        Back = "Solemnity Cape",
        Waist = "Flume Belt +1",
        Legs = "Sakpata's Cuisses",
        Feet = "Nyame Sollerets",
    },

    Tp_Default = {
        Ammo = { Name = "Coiste Bodhar", AugPath="A" },
        Head = "Flam. Zucchetto +2",
        Neck = "Sanctity Necklace",--jse neck
        Ear1 = "Telos Earring",
        Ear2 = "Cessance Earring",
        Body = "Flamma Korazin +2",--Sakpata\ body
        Hands = "Sakpata's Gauntlets",
        Ring1 = "Petrov Ring",
        Ring2 = "Niqmaddu Ring",
        Back = { Name = "Ankou's Mantle", Augment = { [1] = "Accuracy+20", [2] = '"Dbl.Atk."+10', [3] = "Attack+20", [4] = "DEX+20" } },
        Waist = "Ioskeha Belt +1",
        -- Waist = { Name = "Sailfi Belt +1", AugPath="A" },
        Legs = "Sakpata's Cuisses",--af+3 maybe
        Feet = "Flam. Gambieras +2",
    },
    Tp_Hybrid = {
        Body = "Hjarrandi Breast.",
        Ring1 = "Moonbeam Ring",
        Ring2 = "Sulevia's Ring",
        Waist = { Name = "Sailfi Belt +1", AugPath="A" },
        Legs = "Sakpata's Cuisses",
    },
    Tp_Acc = {
        Ammo = "Seeth. Bomblet +1",
        Head = "Blistering Sallet +1",
        Ring1 = "Cacoethic Ring +1",
        Ring2 = "Chirich Ring +1",
        Waist = "Ioskeha Belt +1",
    },


    Precast = {
        Ammo = "Sapience Orb",--2
        Head = "Haruspex Hat",--8
        Neck = "Baetyl Pendant",--4
        Body = "Fall. Cuirass +3",--10
        Hands = "Leyline Gloves",--6
        Ear1 = "Malignance Earring",--4
        Ear2 = "Loquac. Earring",--2
        Ring1 = "Prolix Ring",--2
        Ring2 = "Kishar Ring",--4
        Legs = "Enif Cosciales",--8
        Feet = "Carmine Greaves +1",--8
    },
    Precast_Dark = {
        Head = "Fall. Burgeonet +1",--10
    },


    Cure = {
        Ammo = "Pemphredo Tathlum",
        Neck = "Incanter's Torque",
        Ear1 = "Mendi. Earring",
        Ring1 = "Stikini Ring +1",
        Ring2 = { Name = "Metamor. Ring +1", AugPath="A" },
        Back = "Solemnity Cape",
        Legs = "Carmine Cuisses +1",
        Feet = { Name = 'Odyssean Greaves', Augment = { [1] = 'Damage taken-1%', [2] = 'Mag. Acc.+16', [3] = '"Refresh"+2', [4] = 'Attack+16', [5] = '"Mag. Atk. Bns."+16' } },
    },

    Enhancing = {
        Ammo = "Pemphredo Tathlum",
        Head = "Befouled Crown",
        Body = "Shab. Cuirass +1",
        Neck = "Incanter's Torque",
        Ear1 = "Mendi. Earring",
        Ear2 = "Andoaa Earring",
        Ring2 = { Name = "Metamor. Ring +1", AugPath="A" },
    },

    Enfeebling = {
        Ammo = "Pemphredo Tathlum",
        Head = "Befouled Crown",
        Neck = "Incanter's Torque",
        Ear1 = "Crep. Earring",
        Ear2 = "Malignance Earring",
        Body = "Nyame Mail",
        Hands = "Nyame Gauntlets",
        Ring1 = "Kishar Ring",
        Ring2 = "Stikini Ring +1",
        Legs = "Nyame Flanchard",
        Feet = "Nyame Sollerets",
    },

    Dread_Spikes = { -- HP+++++ at cast for max potency
        Head = "Hjarrandi Helm",
        Neck = "Unmoving Collar +1",
        Ear1 = "Odnowa Earring +1",
        Ear2 = "Etiolation Earring",
        Body = "Hjarrandi Breast.",
        Hands = "Sakpata's Gauntlets",
        Ring1 = "Moonbeam Ring",
        Ring2 = "Eihwaz Ring",
        Waist = "Plat. Mog. Belt",
        Legs = "Nyame Flanchard",
        Feet = "Carmine Greaves +1",
    },

    Endark = {
        Ammo = "Pemphredo Tathlum",
        Head = "Igno. Burgeonet +1",
        Neck = "Incanter's Torque",
        Hands = "Fall. Fin. Gaunt. +1",
        Ring1 = "Stikini Ring +1",
    },

    Dark = {
        Ammo = "Pemphredo Tathlum",
        Head = "Fall. Burgeonet +1",
        Neck = "Erra Pendant",
        Ear1 = "Crep. Earring",
        Ear2 = "Malignance Earring",
        Body = "Fall. Cuirass +3",
        Hands = "Fall. Fin. Gaunt. +1",
        Ring1 = "Kishar Ring",
        Ring2 = "Stikini Ring +1",
        Waist = "Eschan Stone",
        Legs = "Nyame Flanchard",
        Feet = "Odyssean Greaves", --Ratri Sollerets
    },

    Drain = {
        Head = "Pixie Hairpin +1",
        Neck = "Erra Pendant",
        Ear1 = "Crep. Earring",
        Ear2 = "Malignance Earring",
        Ring1 = "Archon Ring",
        Ring2 = "Stikini Ring +1",
        Waist = "Austerity Belt +1",
        Legs = "Eschite Cuisses",
        Feet = "Odyssean Greaves",
    },
    Drain2 = { -- for drain 2/3
        Head = "Fall. Burgeonet +1",
        Neck = "Erra Pendant",
        Ear1 = "Crep. Earring",
        Ear2 = "Malignance Earring",
        Ring1 = "Archon Ring",
        Ring2 = "Stikini Ring +1",
        Waist = "Austerity Belt +1",
        Legs = "Heath. Flanchard +1",
        Feet = "Odyssean Greaves", --Ratri Sollerets
    },

    Nuke = {
        Ammo = "Pemphredo Tathlum",
        Head = "Nyame Helm",
        Neck = "Baetyl Pendant",
        Ear1 = "Crematio Earring",
        Ear2 = "Malignance Earring",
        Body = "Fall. Cuirass +3",
        Hands = "Nyame Gauntlets",
        Ring1 = "Shiva Ring +1",
        Ring2 = { Name = "Metamor. Ring +1", AugPath="A" },
        Legs = "Nyame Flanchard",
        Feet = "Nyame Sollerets",
    },

    Preshot = {
    },
    Midshot = {
        Ear1 = "Telos Earring",
        Ear2 = "Crep. Earring",
    },

    Ws_Default = {
        Ammo = "Knobkierrie",
        Head = { Name = "Valorous Mask", Augment = { [1] = "Attack+16", [2] = "Weapon skill damage +10%", [3] = "Accuracy+16", [4] = "Pet: Mag. Acc.+1", [5] = "Pet: STR+4" } },
        Neck = "Fotia Gorget",-- jse neck
        Ear1 = "Thrud Earring",
        Ear2 = "Moonshade Earring",
        Body = "Hjarrandi Breast.", -- af+3
        Hands = "Nyame Gauntlets", -- ratri unless nyame aug'd
        Ring1 = "Niqmaddu Ring",
        Ring2 = "Karieyh Ring +1", -- regal
        Back = { Name = "Ankou's Mantle", Augment = { [1] = "Accuracy+20", [2] = '"Dbl.Atk."+10', [3] = "Attack+20", [4] = "DEX+20" } },
        Waist = "Sailfi Belt +1",
        Legs = "Fall. Flanchard +3",
        Feet = "Heath. Sollerets +2",
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Quietus_Default = {
        Waist = "Fotia Belt",
        Legs = "Sakpata's Cuisses", -- aug these
    },
    Quietus_Hybrid = {
    },
    Quietus_Acc = {
    },
    Entropy_Default = {
        Ammo = "Coiste Bodhar",
        Head = "Hjarrandi Helm",
        Ear1 = "Lugra Earring +1",
        Ear2 = "Malignance Earring",
        Body = "Sakpata's Plate",
        Hands = "Sakpata's Gauntlets",
        Waist = "Fotia Belt",
        Legs = "Sakpata's Cuisses",
        Feet = "Flam. Gambieras +2", -- sakpata's once aug'd
    },
    Entropy_Hybrid = {
    },
    Entropy_Acc = {
    },
    Guillotine_Default = {
        Ammo = "Coiste Bodhar",
        Head = "Hjarrandi Helm",
        Ear1 = "Lugra Earring +1",
        Ear2 = "Cessance Earring",
        Body = "Sakpata's Plate",
        Hands = "Sakpata's Gauntlets",
        Waist = "Sailfi Belt +1",
        Legs = "Sakpata's Cuisses",
        Feet = "Flam. Gambieras +2", -- sakpata's once aug'd
    },
    Guillotine_Hybrid = {
    },
    Guillotine_Acc = {
    },
    Catastrophe_Default = {
        Ear2 = "Lugra Earring +1",
    },
    Catastrophe_Hybrid = {
    },
    Catastrophe_Acc = {
    },
    Infernal_Default = {
        Ammo = "Knobkierrie",
        Head = "Pixie Hairpin +1",
        Neck = "Sanctity Necklace",
        Ear1 = "Friomisi Earring",
        Ear2 = "Malignance Earring", -- empy +2
        Body = "Nyame Mail", -- relic+3
        Hands = "Nyame Gauntlets", -- relic +3
        Ring1 = "Archon Ring",
        Ring2 = "Karieyh Ring +1",
        Back = { Name = "Ankou's Mantle", Augment = { [1] = "Accuracy+20", [2] = '"Dbl.Atk."+10', [3] = "Attack+20", [4] = "DEX+20" } },
        Waist = "Eschan Stone",
        Legs = "Fall. Flanchard +3",
        Feet = "Heath. Sollerets +2",
    },
    Infernal_Hybrid = {
    },
    Infernal_Acc = {
    },

    Aedge_Default = {
        Ammo = "Seeth. Bomblet +1",
        Head = { Name = "Valorous Mask", Augment = { [1] = "Attack+16", [2] = "Weapon skill damage +10%", [3] = "Accuracy+16", [4] = "Pet: Mag. Acc.+1", [5] = "Pet: STR+4" } },
        Neck = "Sanctity Necklace",
        Ear1 = "Malignance Earring",
        Ear2 = "Friomisi Earring",
        Body = "Fall. Cuirass +3",
        Hands = "Carmine Fin. Ga. +1",
        Ring1 = "Shiva Ring +1",
        Ring2 = "Metamor. Ring +1",
        Back = { Name = "Ankou's Mantle", Augment = { [1] = "Accuracy+20", [2] = '"Dbl.Atk."+10', [3] = "Attack+20", [4] = "DEX+20" } },
        Waist = "Eschan Stone",
        Legs = "Nyame Flanchard",
        Feet = "Nyame Sollerets",
    },
    Aedge_Hybrid = {
    },
    Aedge_Acc = {
    },

    Spikes = { -- set to leave body on with dread spikes up, only body here!
        Body = "Heath. Cuirass +1",
    },
    Blood_Weapon = {
        Body = "Fall. Cuirass +3",
    },
    Arcane_Cirle = {
        Feet = "Igno. Sollerets +1",
    },
    Last_Resort = { -- need to keep on while last resort is up
        Back = "Ankou's Mantle",
        Feet = "Fall. Sollerets +1",
    },
    Bash = {
        Hands = "Igno. Gauntlets +1",
    },
    Dark_Seal = { -- must be equiped during casting of dark magic with seal up
        Head = "Fall. Burgeonet +1",
    },
    Diabolic_Eye = {
        Hands = "Fall. Fin. Gaunt. +1",
    },
    Nether_Void = {
        Legs = "Heath. Flanchard +1",
    },
    Souleater = {
        Head = "Igno. Burgeonet +1",
    },

    TH = {
        Ammo = "Per. Lucky Egg",
		Waist = "Chaac Belt",
	},
    Movement = {
        Legs = "Carmine Cuisses +1",
	},
}
profile.Sets = sets

profile.Packer = {
    {Name = "Grape Daifuku", Quantity = "all"},
    {Name = "Red Curry Bun", Quantity = "all"},
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
    gcinclude.Initialize()

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 7")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 10")
end

profile.OnUnload = function()
    gcinclude.Unload()
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle)
    local spikes = gData.GetBuffCount(173) -- Dread Spikes
    local lastResort = gData.GetBuffCount(64) -- Last Resort
    local souleater = gData.GetBuffCount(63) -- Souleater

	local player = gData.GetPlayer()
    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting)
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement)
    end

    if spikes ~= 0 then gFunc.EquipSet(sets.Spikes) end
    if lastResort ~= 0 then gFunc.EquipSet(sets.Last_Resort) end
    if souleater ~= 0 then gFunc.EquipSet(sets.Souleater) end

    gcinclude.CheckDefault ()
    if (gcdisplay.GetToggle("DTset") == true) then gFunc.EquipSet(sets.Dt) end
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end
end

profile.HandleAbility = function()
    local ability = gData.GetAction()

    if ability.Name == "Blood Weapon" then
		gFunc.EquipSet(sets.Blood_Weapon)
    elseif ability.Name == "Last Resort" then
		gFunc.EquipSet(sets.Last_Resort)
    elseif ability.Name == "Arcane Cirle" then
        gFunc.EquipSet(sets.Arcane_Cirle)
    elseif ability.Name == "Weapon Bash" then
        gFunc.EquipSet(sets.Bash)
    elseif ability.Name == "Diabolic Eye" then
        gFunc.EquipSet(sets.Diabolic_Eye)
    elseif ability.Name == "Nether Void" then
        gFunc.EquipSet(sets.Nether_Void)
    end

    gcinclude.CheckCancels()
end

profile.HandleItem = function()
    local item = gData.GetAction()

	if item.Name == "Holy Water" then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction()
    gFunc.EquipSet(sets.Precast)

    if spell.Skill == "Dark Magic" then
        gFunc.EquipSet(sets.Precast_Dark)
    end

    gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment()
    local spell = gData.GetAction()
    local darkSeal = gData.GetBuffCount(345) -- dark seal

    if spell.Skill == "Enhancing Magic" then
        gFunc.EquipSet(sets.Enhancing)
    elseif spell.Skill == "Healing Magic" then
        gFunc.EquipSet(sets.Cure)
    elseif spell.Skill == "Elemental Magic" then
        gFunc.EquipSet(sets.Nuke)
        if spell.Element == weather.WeatherElement or spell.Element == weather.DayElement then
            gFunc.Equip("Waist", "Hachirin-no-Obi")
        end
    elseif spell.Skill == "Enfeebling Magic" then
        gFunc.EquipSet(sets.Enfeebling)
    elseif spell.Skill == "Dark Magic" then
        gFunc.EquipSet(sets.Dark)
        if spell.Name == "Aspir" or spell.Name == "Drain" then
            gFunc.EquipSet(sets.Drain)
        elseif spell.Name == "Drain II" or spell.Name == "Drain III" then
            gFunc.EquipSet(sets.Drain2)
        elseif spell.Name == "Dread Spikes" then
            gFunc.EquipSet(sets.Dread_Spikes)
        end

        if darkSeal ~= 0 then gFunc.EquipSet(sets.Dark_Seal) end
    end
	if gcdisplay.GetToggle("TH") then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot)
	if gcdisplay.GetToggle("TH") then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout()
    if not canWS then gFunc.CancelAction() return
    else
        local ws = gData.GetAction()

        gFunc.EquipSet(sets.Ws_Default)
        if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
        gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet")) end

        if ws.Name == "Aeolian Edge" then
            gFunc.EquipSet(sets.Aedge_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet")) end
        elseif ws.Name == "Infernal Scythe" then
            gFunc.EquipSet(sets.Infernal_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Infernal_" .. gcdisplay.GetCycle("MeleeSet")) end
        elseif ws.Name == "Quietus" then
            gFunc.EquipSet(sets.Quietus_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Quietus_" .. gcdisplay.GetCycle("MeleeSet")) end
        elseif ws.Name == "Entropy" then
            gFunc.EquipSet(sets.Entropy_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Entropy_" .. gcdisplay.GetCycle("MeleeSet")) end
        elseif ws.Name == "Guillotine" then
            gFunc.EquipSet(sets.Guillotine_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Guillotine_" .. gcdisplay.GetCycle("MeleeSet")) end
        elseif ws.Name == "Catastrophe" then
            gFunc.EquipSet(sets.Catastrophe_Default)
            if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
            gFunc.EquipSet("Catastrophe_" .. gcdisplay.GetCycle("MeleeSet")) end
        end
    end
end

return profile
