local profile = {};
local gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
    
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

    -- gFunc.EquipSet(sets.Idle);

    gcinclude.CheckDefault();
end

profile.HandleAbility = function()

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