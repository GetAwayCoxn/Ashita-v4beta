local profile = {};
local sets = {
    augs = {
        Main = 'Izhiikoh',
        Sub = { Name = 'Shijo', AugPath='D' },
        Range = 'Raider\'s Bmrng.',
        Head = 'Meghanada Visor +1',
        Neck = 'Twilight Torque',
        Ear1 = 'Genmei Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Meg. Cuirie +2',
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = '"Store TP"+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Meg. Chausses +2',
        Feet = 'Fajin Boots',
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
