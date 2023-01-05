local profile = {};
local sets = {
    Fish = {
        Main = 'Bolelabunga',
        Sub = 'Joiner\'s Shield',
        Range = 'Lu Shang\'s F. Rod',
        Ammo = 'Minnow',
        Head = 'Psycloth Tiara',
        Body = 'Fisherman\'s Apron',
        Hands = 'Fsh. Gloves',
        Ring2 = 'Warp Ring',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
};
profile.Sets = sets;

profile.Packer = {
};

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