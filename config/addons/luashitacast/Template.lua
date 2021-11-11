local profile = {};
local varhelper = gFunc.LoadFile('common/varhelper.lua');
local gcinclude = gFunc.LoadFile('common/gcinclude.lua');
local sets = {
    Idle = {
        Main = 'Arktoi',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Voluspa Tathlum',
        Head = { Name = 'Emicho Coronet', AugPath='C' },
        Neck = 'Empath Necklace',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = { Name = 'Ankusa Gloves', AugTrial=5162 },
        Ring1 = 'Tali\'ah Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
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
