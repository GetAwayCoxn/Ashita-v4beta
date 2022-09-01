local profile = {};
local sets = {
    augs = {
        Main = 'Tauret',
        Sub = { Name = 'Shijo', AugPath='D' },
        Range = 'Wingcutter +1',
        Head = 'Malignance Chapeau',
        Neck = { Name = 'Unmoving Collar +1', AugPath='A' },
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Malignance Gloves',
        Ring1 = 'Moonbeam Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Flume Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Potency of "Cure" effect received+5%', [2] = 'Mag. Acc.+19', [3] = 'Accuracy+21', [4] = '"Mag. Atk. Bns."+19', [5] = '"Treasure Hunter"+2' } },
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
