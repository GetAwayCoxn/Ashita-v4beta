local profile = {};
local sets = {
    augs = {
        Main = 'Tanmogayi',
        Sub = { Name = 'Ochain', AugTrial=4399 },
        Ammo = 'Crepuscular Pebble',
        Head = 'Rev. Coronet +1',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Creed Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Rev. Surcoat +1',
        Hands = 'Sulev. Gauntlets +1',
        Ring1 = 'K\'ayres Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Eva.+20', [3] = 'HP+60', [4] = 'Mag. Eva.+20' } },
        Waist = 'Nierenschutz',
        Legs = { Name = 'Carmine Cuisses', AugPath='D' },
        Feet = 'Rev. Leggings',
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
