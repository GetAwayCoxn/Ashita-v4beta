local profile = {};
local sets = {
    augs = {
        Main = 'Sakpata\'s Fists',
        Range = { Name = 'Neo Animator', AugPath='A' },
        Ammo = 'Automat. Oil +3',
        Head = 'Karagoz Capello +1',
        Neck = 'Empath Necklace',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Pitre Tobe +3', AugTrial=5489 },
        Hands = 'Malignance Gloves',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: Haste+10', [4] = 'Accuracy+20', [5] = 'Attack+20', [6] = 'Pet: Acc.+20', [7] = 'Pet: Atk.+20' } },
        Waist = 'Moonbow Belt',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Hermes\' Sandals',
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
