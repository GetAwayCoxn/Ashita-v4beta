local profile = {};
local sets = {
    augs = {
        Main = 'Epeolatry',
        Sub = 'Utu Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Cumulus Masque',
        Neck = { Name = 'Unmoving Collar +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+80', [5] = 'Enmity+10' } },
        Waist = 'Gishdubar Sash',
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
