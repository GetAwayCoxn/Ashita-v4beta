local profile = {};
local sets = {
    augs = {
        Main = 'Excalibur',
        Sub = { Name = 'Aegis', AugTrial=4453 },
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck = { Name = 'Unmoving Collar +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = 'Hjarrandi Breast.',
        Hands = 'Volte Moufles',
        Ring1 = 'Moonbeam Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -8%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
        Waist = 'Flume Belt +1',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Nyame Sollerets',
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
