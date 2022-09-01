local profile = {};
local sets = {
    TP = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Genmei Shield',
        Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
        Head = 'Malignance Chapeau',
        Neck = 'Anu Torque',
        Ear1 = 'Mache Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = 'Petrov Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+20', [3] = 'DEX+20' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = 'Jhakri Slops +2',
        Feet = 'Nyame Sollerets',
    },
    Town = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Genmei Shield',
        Ammo = 'Staunch Tathlum',
        Head = { Name = 'Viti. Chapeau +1', AugTrial=5250 },
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Jhakri Robe +2',
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Volte Gaiters',
    },
    Temp = {
        Main = 'Arktoi',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Voluspa Tathlum',
        Head = 'Meghanada Visor +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Genmei Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Macabre Gaunt.',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+6', [2] = '"Store TP"+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'Pet: Accuracy+6', [6] = 'DEX+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Tali\'ah Crackows +1',
    },
    DT = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Genmei Shield',
        Ammo = 'Staunch Tathlum',
        Head = 'Malignance Chapeau',
        Neck = { Name = 'Loricate Torque +1', AugPath='A' },
        Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
        Ear2 = 'Etiolation Earring',
        Body = { Name = 'Gende. Bliaut +1', Augment = { [1] = 'Magic dmg. taken -3%', [2] = 'Phys. dmg. taken -3%', [3] = '"Cure" potency +5%' } },
        Hands = 'Malignance Gloves',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Flume Belt +1',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Nyame Sollerets',
    },
    augs = {
        Main = { Name = 'Skullrender', AugPath='C' },
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Voluspa Tathlum',
        Head = { Name = 'Valorous Mask', Augment = { [1] = 'Weapon skill damage +3%', [2] = 'Accuracy+1', [3] = 'Attack+1', [4] = '"Drain" and "Aspir" potency +5' } },
        Neck = 'Sanctity Necklace',
        Ear1 = 'Genmei Earring',
        Ear2 = 'Bladeborn Earring',
        Body = 'Tali\'ah Manteel +1',
        Hands = 'Macabre Gaunt.',
        Ring1 = 'Defending Ring',
        Ring2 = 'Meghanada Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Hurch\'lan Sash',
        Legs = 'Tali\'ah Sera. +2',
        Feet = { Name = 'Valorous Greaves', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+6', [2] = 'Pet: Attack+22', [3] = 'Pet: Rng.Atk.+22', [4] = 'Attack+12', [5] = 'Accuracy+12' } },
    },
    Precast = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Ammurapi Shield',
        Ammo = 'Staunch Tathlum',
        Head = { Name = 'Merlinic Hood', Augment = { [1] = 'Mag. Acc.+7', [2] = 'CHR+5', [3] = 'Magic burst dmg.+6%', [4] = '"Mag. Atk. Bns."+25' } },
        Neck = 'Baetyl Pendant',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Jhakri Robe +2',
        Hands = { Name = 'Gende. Gages +1', Augment = { [1] = 'Phys. dmg. taken -4%', [2] = 'Song spellcasting time -5%' } },
        Ring1 = 'Kishar Ring',
        Ring2 = 'Prolix Ring',
        Back = 'Swith Cape +1',
        Waist = 'Embla Sash',
        Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
        Feet = 'Volte Gaiters',
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
