local profile = {};
local sets = {
    augs = {
        Main = 'Sakpata\'s Sword',
        Sub = { Name = 'Aegis', AugTrial=4453 },
        Ammo = 'Staunch Tathlum',
        Head = 'Sulevia\'s Mask +2',
        Neck = 'Sanctity Necklace',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Cab. Surcoat +3', AugTrial=5478 },
        Hands = 'Volte Moufles',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sulev. Leggings +2',
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
