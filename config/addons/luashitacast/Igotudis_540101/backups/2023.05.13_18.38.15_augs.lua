local profile = {};
local sets = {
    ['augs'] = {
        Main = { Name = 'Gridarvor', AugPath='A' },
        Sub = 'Khonsu',
        Ammo = { Name = 'Epitaph', AugPath='A' },
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Shomonjijoe +1', AugPath='A' },
        Hands = { Name = 'Asteria Mitts +1', AugPath='A' },
        Ring1 = 'Varar Ring +1',
        Ring2 = 'Varar Ring +1',
        Back = { Name = 'Campestres\'s Cape', Augment = { [1] = 'Pet: Atk.+20', [2] = 'Pet: Rng.Atk.+10', [3] = 'Pet: Acc.+20', [4] = 'Mag. Eva.+20', [5] = 'Pet: R.Acc.+20', [6] = 'Pet: R.Atk.+20', [7] = 'Pet: Haste+10', [8] = 'Pet: Attack+10', [9] = 'Eva.+20' } },
        Waist = 'Regal Belt',
        Legs = { Name = 'Assid. Pants +1', AugPath='A' },
        Feet = 'Herald\'s Gaiters',
    },
};

profile.Sets = sets;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;
