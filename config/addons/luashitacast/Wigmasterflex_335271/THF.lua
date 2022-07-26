local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


sets = T{
    Idle = {
        Head = 'Meghanada Visor +1',
        Neck = 'Loricate Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Back = 'Repulse Mantle',
        Waist = 'Hurch\'lan Sash',
        Legs = 'Mummu Kecks +1',
        Feet = 'Meg. Jam. +1',
    },
    Resting = {},
    Idle_Regen = {
        Neck = 'Sanctity Necklace',
    },
    Idle_Refresh = {},
    Town = {
        Feet = 'Pillager\'s Poulaines',
    },

    Dt = {
        Head = 'Meghanada Visor +1',
        Neck ='Loricate Torque',
        Ear1 = 'Ethereal Earring',
        Body = 'Meg. Cuirie +1',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Patricius Ring',
        Back = 'Repulse Mantle',
        Legs = 'Mummu Kecks +1',
        Feet = 'Meg. Jam. +1',
    },

    Tp_Default = {
        Head = 'Mummu Bonnet +1',
        Neck = 'Clotharius Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Mummu Jacket +1',
        Hands = 'Mummu Wrists +1',
        Ring1 = 'Mummu Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = '"Store TP"+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Cetl Belt',
        Legs = 'Mummu Kecks +1',
        Feet = 'Mummu Gamash. +1',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
        Neck = 'Sanctity Necklace',
        Ear1 = 'Bladeborn Earring',
        Ear2 = 'Steelflash Earring',
    },


    Precast = {
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear2 = 'Etiolation Earring',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Back = 'Swith Cape',
        Legs = 'Enif Cosciales',
    },

    Preshot = {
    },
    Midshot = {
        Body = 'Mummu Jacket +1',
    },

    Ws_Default = {
        Head = 'Herculean Helm',
        Neck = 'Sanctity Necklace',
        Body = 'Mummu Jacket +1',
        Hands = 'Meg. Gloves +2',
        Legs = 'Mummu Kecks +1',
        Feet = 'Herculean Boots',
    },
    Ws_Default_SA = {
    },
    Ws_Default_TA = {
        Feet = 'Adhemar Gamashes',
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
        Body = 'Mummu Jacket +1',
        Hands = 'Mummu Wrists +1',
        Legs = 'Mummu Kecks +1',
        Feet = 'Mummu Gamash. +1',
    },
    Evis_Default_SA = {
    },
    Evis_Default_TA = {
        
    },
    Evis_Default_SATA = {
        Feet = 'Adhemar Gamashes',
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


    SATA = {
        
    },
    SA = {
        
    },
    TA = {
    
    },
    TH = {
        Hands = 'Plun. Armlets +1',
        Feet = 'Skulk. Poulaines +1',
    },
    Flee = {
        Feet = 'Pillager\'s Poulaines',
    },
    Movement = {
        Feet = 'Pillager\'s Poulaines',
	},
};

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize:once(3);

    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
    local sa = gData.GetBuffCount('Sneak Attack');
    local ta = gData.GetBuffCount('Trick Attack');
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')); end
        if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
	
	if (gcdisplay.GetToggle('DTset') == true) then
		 
		gFunc.EquipSet(sets.Dt);
	end
    if (sa == 1) and (ta == 1) then
        gFunc.EquipSet('SATA');
    elseif (sa == 1) then
        gFunc.EquipSet('SA');
    elseif (ta == 1) then
        gFunc.EquipSet('TA');
    end
    
	if (gcdisplay.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault ();
     
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
	if string.match(ability.Name, 'Flee') then
		gFunc.EquipSet(sets.Flee);
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
    if (gcdisplay.GetToggle('TH') == true) then
		gFunc.EquipSet(sets.TH);
	end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
    
    if (gcdisplay.GetToggle('TH') == true) then
		gFunc.EquipSet(sets.TH);
	end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
        local ta = gData.GetBuffCount('Trick Attack');
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (sa == 1) and (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
        elseif (sa == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
        elseif (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
        end

        if string.match(ws.Name, 'Evisceration') then
            gFunc.EquipSet(sets.Evis_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet')); end
            if (sa == 1) and (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
            elseif (sa == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
            elseif (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
            end
        elseif string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
