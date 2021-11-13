local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');
local sets = {
    Ws = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Reseting = {
    },
    Idle = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Precast = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Tp_Default = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Movement = {
    },
    Dt = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Town = {
        Main = { Name = 'Kali', AugPath='C' },
        Sub = 'Culminus',
        Range = { Name = 'Gjallarhorn', AugTrial=3591 },
        Head = 'Nyame Helm',
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Bihu Jstcorps. +3', AugTrial=5481 },
        Hands = { Name = 'Gende. Gages +1', Augment = { [1] = 'Phys. dmg. taken -4%', [2] = 'Song spellcasting time -5%' } },
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Intarabus\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Fast Cast"+10', [3] = 'Mag. Acc.+10', [4] = 'Mag. Acc+20', [5] = 'CHR+20', [6] = 'Magic Damage +20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Brioso Cannions +2',
        Feet = 'Nyame Sollerets',
    },
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcinclude.Initialize();
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if (player.Status == 'engaged') then
        gFunc.EquipSet('gcinclude.sets.Tp_' .. varhelper.GetCycle('Set'));
        gFunc.EquipSet('sets.Tp_' .. varhelper.GetCycle('Set'));
    elseif (player.Status == 'resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end
	
	if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end
	if (varhelper.GetToggle('DTset') == true) then
		gFunc.EquipSet(gcinclude.sets.Dt);
		gFunc.EquipSet(sets.Dt);
	end
	if (varhelper.GetToggle('Kite') == true) then
		gFunc.EquipSet(sets.Movement);
	end

	if (zone ~= nil) and gcinclude.Towns:contains(zone.Area) then
		gFunc.EquipSet(sets.Town)
	end
    gcinclude.CheckCommonDebuffs();
	gcinclude.CheckLockingRings();
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
    local action = gData.GetAction();

	if string.match(action.Name, 'Holy Water') then
		gFunc.EquipSet(gcinclude.sets.Holy_Water);
	end
end

profile.HandlePrecast = function()
    gFunc.EquipSet(gcinclude.sets.Precast);
	gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet('gcinclude.sets.Ws_' .. varhelper.GetCycle('Set'));
    gFunc.EquipSet('sets.Ws_' .. varhelper.GetCycle('Set'));
end

return profile;
