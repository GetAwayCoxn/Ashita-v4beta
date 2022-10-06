local profile = {};
local sets = {
    augs = {
        Main = { Name = 'Emeici +1', AugPath='A' },
        Range = 'Neo Animator',
        Ammo = 'Automat. Oil +3',
        Head = 'Karagoz Capello +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Vrikodara Jupon',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Paguroidea Ring',
        Ring2 = 'Sheltered Ring',
        Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = 'STR+25', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Isa Belt',
        Legs = 'Tali\'ah Sera. +1',
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
