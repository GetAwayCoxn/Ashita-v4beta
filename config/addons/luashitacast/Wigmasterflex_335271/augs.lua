local profile = {};
local sets = {
    augs = {
        Main = 'Emeici +1',
        Range = 'Neo Animator',
        Ammo = 'Automat. Oil +3',
        Head = { Name = 'Anwig Salade', Augment = { [1] = 'Accuracy+3', [2] = 'Pet: Damage taken -10%', [3] = 'Attack+3', [4] = 'Pet: Haste+5' } },
        Neck = 'Shulmanu Collar',
        Ear1 = 'Guignol Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Tali\'ah Gages +1',
        Ring1 = 'Defending Ring',
        Ring2 = 'Facility Ring',
        Back = 'Shadow Mantle',
        Waist = 'Kuku Stone',
        Legs = 'Tali\'ah Sera. +1',
        Feet = 'Tali\'ah Crackows +1',
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
