local profile = {};
local sets = {
    augs = {
        Main = 'Sakpata\'s Fists',
        Ammo = 'Staunch Tathlum',
        Head = 'Anchorite\'s Crown',
        Neck = { Name = 'Bathy Choker +1', AugPath='A' },
        Ear1 = 'Telos Earring',
        Ear2 = 'Eabani Earring',
        Body = 'Bhikku Cyclas +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Karieyh Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Segomo\'s Mantle', Augment = { [1] = 'STR+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Moonbow Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
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
