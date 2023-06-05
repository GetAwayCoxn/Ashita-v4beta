local profile = {};
local sets = {
    ['augs'] = {
        Main = { Name = 'Apocalypse', AugPath='A' },
        Sub = 'Utu Grip',
        Ammo = 'Staunch Tathlum',
        Head = 'Crepuscular Helm',
        Neck = { Name = 'Bathy Choker +1', AugPath='A' },
        Ear1 = 'Infused Earring',
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Fall. Cuirass +3', AugTrial=5479 },
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Gishdubar Sash',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = { Name = 'Odyssean Greaves', Augment = { [1] = 'Damage taken-1%', [2] = 'Mag. Acc.+16', [3] = '"Refresh"+2', [4] = 'Attack+16', [5] = '"Mag. Atk. Bns."+16' } },
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
