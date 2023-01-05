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
    Craft = {
        Main = 'Bolelabunga',
        Sub = 'Joiner\'s Shield',
        Range = 'Lu Shang\'s F. Rod',
        Ammo = 'Minnow',
        Head = 'Psycloth Tiara',
        Body = 'Carpenter\'s Smock',
        Hands = 'Carpenter\'s Gloves',
        Ring1 = 'Orvail Ring',
        Ring2 = 'Craftmaster\'s Ring',
        Legs = { Name = 'Carmine Cuisses', AugPath='D' },
        Feet = { Name = 'Merlinic Crackows', Augment = { [1] = 'CHR+10', [2] = 'Mag. Acc.+2', [3] = '"Mag. Atk. Bns."+30' } },
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