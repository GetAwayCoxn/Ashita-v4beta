local profile = {};
local sets = {
    augs = {
        Main = 'Naegling',
        Sub = 'Nusku Shield',
        Range = 'Kaja Bow',
        Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
        Neck = 'Anu Torque',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = { Name = 'Sct. Jerkin +2', AugTrial=5005 },
        Hands = { Name = 'Adhemar Wrist. +1', AugPath='B' },
        Ring1 = 'Petrov Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Mecisto. Mantle', Augment = { [1] = 'Cap. Point+41%', [2] = 'Attack+1', [3] = 'DEF+10' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Samnuha Tights', Augment = { [1] = 'STR+9', [2] = '"Dbl.Atk."+2', [3] = '"Triple Atk."+2', [4] = 'DEX+8' } },
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
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
