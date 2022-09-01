local profile = {};
local sets = {
    augs = {
        Main = { Name = 'Malevolence', Augment = { [1] = '"Mag. Atk. Bns."+7', [2] = 'INT+3', [3] = 'Mag. Acc.+5' } },
        Sub = { Name = 'Ochain', AugTrial=4399 },
        Ammo = 'Staunch Tathlum',
        Neck = 'Wiglen Gorget',
        Ear2 = 'Ethereal Earring',
        Hands = 'Sulev. Gauntlets +1',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Mag. Eva.+20', [2] = 'Spell interruption rate down-10%', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
        Legs = { Name = 'Carmine Cuisses', AugPath='D' },
        Feet = { Name = 'Odyssean Greaves', Augment = { [1] = '"Mag. Atk. Bns."+3', [2] = 'Accuracy+4', [3] = 'Rng.Acc.+8', [4] = 'Mag. Acc.+3', [5] = 'Pet: Attack+26', [6] = 'Pet: Rng.Atk.+26', [7] = 'Attack+4', [8] = 'Weapon skill damage +6%' } },
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
