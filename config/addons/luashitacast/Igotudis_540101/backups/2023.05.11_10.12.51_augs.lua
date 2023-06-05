local profile = {};
local sets = {
    ['augs'] = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Culminus',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Agwu\'s Cap',
        Neck = { Name = 'Bathy Choker +1', AugPath='A' },
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Agwu\'s Robe',
        Hands = { Name = 'Amalric Gages +1', AugPath='D' },
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Taranus\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc+20', [4] = 'INT+20', [5] = 'Magic Damage +20' } },
        Waist = 'Gishdubar Sash',
        Legs = 'Agwu\'s Slops',
        Feet = 'Herald\'s Gaiters',
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
