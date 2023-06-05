local profile = {};
local sets = {
    ['augs'] = {
        Main = { Name = 'Kali', AugPath='C' },
        Sub = 'Culminus',
        Range = { Name = 'Daurdabla', AugTrial=3590 },
        Head = 'Pixie Hairpin +1',
        Neck = 'Mnbw. Whistle +1',
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Eabani Earring',
        Body = 'Fili Hongreline +2',
        Hands = 'Fili Manchettes +1',
        Ring1 = 'Defending Ring',
        Ring2 = 'Vengeful Ring',
        Back = { Name = 'Intarabus\'s Cape', Augment = { [1] = 'STR+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'Accuracy+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Brioso Cannions +2',
        Feet = 'Fili Cothurnes +1',
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
