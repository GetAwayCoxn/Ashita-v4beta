local profile = {};
varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('gcfiles/gcinclude.lua');


sets = {
	Idle = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck ='',
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
    Reseting = {},
    Town = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Culminus',
        Ammo = 'Gastly Tathlum +1',
        Head = 'Peda. M.Board +2',
        Body = 'Agwu\'s Robe',
        Hands = 'Peda. Bracers +2',
        Legs = 'Agwu\'s Slops',
        Feet = 'Volte Gaiters',
    },

    Dt = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck ='',
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
        Neck ='',
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
    Tp_Hybrid = Tp_Default;
    Tp_Acc = Tp_Hybrid;


    Precast = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck ='',
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

    Ws = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck ='',
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
    Ws_Hybrid = Tp_Default;
    Ws_Acc = Tp_Hybrid;
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();
end

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
	local zone = gData.GetEnvironment();

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

	if (gcinclude.Towns:contains(zone.area)) then
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