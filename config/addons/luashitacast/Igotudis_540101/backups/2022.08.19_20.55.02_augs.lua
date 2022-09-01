local profile = {};
local sets = {
    augs = {
        Main = 'Naegling',
        Sub = 'Blurred Shield +1',
        Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
        Head = 'Hjarrandi Helm',
        Neck = { Name = 'Bathy Choker +1', AugPath='A' },
        Ear1 = 'Telos Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Hjarrandi Breast.',
        Hands = 'Volte Moufles',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Sakpata\'s Cuisses',
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
