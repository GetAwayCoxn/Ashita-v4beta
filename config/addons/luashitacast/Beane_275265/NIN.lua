local profile = {};
local gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
    Idle = {
        Sub = 'Leafkin Shield',
        -- Legs = 'Morbol Subligar',
    },
    -- Idle_40 = {
        -- Legs = 'Morbol Subligar',
    -- },
    Idle_20 = {
        Legs = 'Morbol Subligar',
    },
    Resting = {},
    Idle_Regen = {
        Head = 'Meghanada Visor +2',
        Neck = 'Sanctity Necklace',
        Body = 'Meg. Cuirie +2',
        Hands = 'Meg. Gloves +2',
        Ring2 = 'Meghanada Ring',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +2',
    },
    Idle_Refresh = {
        Head = 'Rawhide Mask',
    },
    Town = {
        Sub = 'Leafkin Shield',
        Legs = 'Morbol Subligar',
    },

    Dt = {
        Head = 'Meghanada Visor +2',
        Neck ='Twilight Torque',
        Ear1 = 'Genmei Earring',
        Body = 'Meg. Cuirie +2',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +2',
    },

    Tp_Default = {
        Head = 'Mummu Bonnet +1',
        Neck = 'Anu Torque',
        Ear1 = 'Bladeborn Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Mummu Jacket +2',
        Hands = 'Mummu Wrists +2',
        Ring1 = 'Mummu Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = '"Store TP"+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Meg. Chausses +2',
        Feet = 'Mummu Gamash. +1',
    },
    Tp_Hybrid = {
        Head = 'Meghanada Visor +2',
        Body = 'Meg. Cuirie +2',
        Hands = 'Meg. Gloves +2',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +2',
    },
    Tp_Acc = {
        Neck = 'Sanctity Necklace',
        Ear2 = 'Steelflash Earring',
        Waist = 'Hurch\'lan Sash',
    },


    Precast = {
        Ear2 = 'Etiolation Earring',
    },

    Preshot = {
    },
    Midshot = {
        Body = 'Mummu Jacket +2',
    },

    Ws_Default = {
        Head = 'Mummu Bonnet +1',
        Neck = 'Sanctity Necklace',
        Body = 'Mummu Jacket +2',
        Hands = 'Meg. Gloves +2',
        Legs = 'Mummu Kecks +1',
        Feet = 'Mummu Gamash. +1',
    },
    Ws_Default_SA = {
    },
    Ws_Default_TA = {
    },
    Ws_Default_SATA = {
    },
    Ws_Hybrid = {
    },
    Ws_Hybrid_SA = {},
    Ws_Hybrid_TA = {},
    Ws_Hybrid_SATA = {},
    Ws_Acc = {
    },
    Ws_Acc_SA = {},
    Ws_Acc_TA = {},
    Ws_Acc_SATA = {},

    Evis_Default = {
        Head = 'Mummu Bonnet +1',
        Neck = 'Sanctity Necklace',
        Body = 'Mummu Jacket +2',
        Hands = 'Mummu Wrists +2',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Shadow Belt',
        Legs = 'Mummu Kecks +1',
        Feet = 'Mummu Gamash. +1',
    },
    Evis_Default_SA = {
    },
    Evis_Default_TA = {
        
    },
    Evis_Default_SATA = {
    },
    Evis_Hybrid = {
    },
    Evis_Hybrid_SA = {},
    Evis_Hybrid_TA = {},
    Evis_Hybrid_SATA = {},
    Evis_Acc = {
    },
    Evis_Acc_SA = {},
    Evis_Acc_TA = {},
    Evis_Acc_SATA = {},
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
    Savage_Default = {
        Head = 'Meghanada Visor +2',
        Body = 'Meg. Cuirie +2',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Atheling Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Meg. Chausses +2',
        Feet = 'Meg. Jam. +2',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },

    SATA = {
        
    },
    SA = {
        
    },
    TA = {
    
    },
    TH = {
        Hands = 'Assassin\'s Armlets',
        Waist = 'Chaac Belt',
    },
    Flee = {
    },
    Movement = {
        Feet = 'Fajin Boots',
	},
};
profile.Sets = sets;

profile.Packer = {};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    gFunc.EquipSet(sets.Idle);
    gcinclude.HandleLevelSync(sets, 'Idle')

    gcinclude.CheckDefault();
end

profile.HandleAbility = function()
    gcinclude.HandleLevelSync(sets, 'Lolz')
    gcinclude.CheckCancels();
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()

    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();

        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

        -- if string.match(ws.Name, 'Aeolian Edge') then
        --     gFunc.EquipSet(sets.Aedge_Default)
        --     if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        --     gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        -- end
    end
end

return profile;