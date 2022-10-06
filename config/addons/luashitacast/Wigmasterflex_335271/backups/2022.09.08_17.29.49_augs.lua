local profile = {};
local sets = {
    augs = {
        Main = { Name = 'Tanmogayi +1', AugPath='A' },
        Sub = 'Zantetsuken',
        Ammo = 'Crepuscular Pebble',
        Head = 'Psycloth Tiara',
        Neck = 'Wiglen Gorget',
        Ear1 = 'Steelflash Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Carpenter\'s Smock',
        Hands = 'Carpenter\'s Gloves',
        Ring1 = 'Orvail Ring',
        Ring2 = 'Craftmaster\'s Ring',
        Back = { Name = 'Rosmerta\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+25' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Carmine Cuisses', AugPath='D' },
        Feet = 'Aya. Gambieras +2',
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
