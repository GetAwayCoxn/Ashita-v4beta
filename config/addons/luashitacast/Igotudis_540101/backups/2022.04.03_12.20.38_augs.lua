local profile = {};
local sets = {
    augs = {
        Main = 'Naegling',
        Sub = 'Nusku Shield',
        Range = { Name = 'Holliday', Augment = { [1] = 'Rng.Atk.+4', [2] = 'DMG:+14', [3] = 'AGI+11', [4] = '"Mag. Atk. Bns."+20' } },
        Ammo = 'Decimating Bullet',
        Head = 'Laksa. Tricorne',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Cessance Earring',
        Body = 'Tanner\'s Apron',
        Hands = 'Malignance Gloves',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Warp Ring',
        Back = { Name = 'Camulus\'s Mantle', Augment = { [1] = 'Weapon skill damage +10%', [2] = 'Mag. Acc+20', [3] = 'AGI+30', [4] = 'Magic Damage +20' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Ikenga\'s Trousers', AugPath='A' },
        Feet = { Name = 'Lanun Bottes +2', AugTrial=5444 },
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
