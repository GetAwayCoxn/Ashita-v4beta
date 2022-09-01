local profile = {};
local sets = {
    augs = {
        Main = 'Naegling',
        Sub = 'Nusku Shield',
        Range = { Name = 'Holliday', Augment = { [1] = 'Rng.Atk.+4', [2] = 'DMG:+14', [3] = 'AGI+11', [4] = '"Mag. Atk. Bns."+20' } },
        Ammo = 'Decimating Bullet',
        Head = 'Chass. Tricorne +1',
        Neck = 'Bathy Choker +1',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = 'Laksa. Frac +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Ilabrat Ring',
        Back = { Name = 'Camulus\'s Mantle', Augment = { [1] = 'Rng.Acc.+20', [2] = '"Store TP"+10', [3] = 'AGI+20', [4] = 'Rng.Atk.+20' } },
        Waist = 'Flume Belt +1',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Chass. Bottes +1',
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
