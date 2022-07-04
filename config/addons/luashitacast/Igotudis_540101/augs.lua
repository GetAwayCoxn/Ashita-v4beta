local profile = {};
local sets = {
    augs = {
        Main = 'Excalibur',
        Sub = { Name = 'Aegis', AugTrial=4453 },
        Ammo = 'Staunch Tathlum',
        Head = { Name = 'Jumalik Helm', Augment = { [1] = 'Magic burst dmg.+10%', [2] = '"Refresh"+1', [3] = 'MND+10', [4] = '"Mag. Atk. Bns."+15' } },
        Neck = { Name = 'Unmoving Collar +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Found. Breastplate', Augment = { [1] = 'Accuracy+7', [2] = 'Attack+11', [3] = 'Mag. Acc.+11' } },
        Hands = 'Volte Moufles',
        Ring1 = 'Moonbeam Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
        Waist = 'Flume Belt +1',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
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
