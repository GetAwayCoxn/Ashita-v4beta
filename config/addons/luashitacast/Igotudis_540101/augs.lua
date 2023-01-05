local profile = {};
local sets = {
    augs = {
        Main = 'Tauret',
        Sub = { Name = 'Acrontica', AugPath='A' },
        Ammo = 'Yamarang',
        Head = 'Malignance Chapeau',
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Gishdubar Sash',
        Legs = 'Gleti\'s Breeches',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
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
