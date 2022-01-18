local profile = {};
local sets = T{
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
        Main = { Name = 'Kali', AugPath='C' },
        Sub = 'Culminus',
        Range = { Name = 'Terpander', AugPath='A' },
        Head = 'Brioso Roundlet +2',
        Neck = 'Moonbow Whistle',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Gifted Earring',
        Body = 'Fili Hongreline +1',
        Hands = 'Fili Manchettes +1',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Intarabus\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Fast Cast"+10', [3] = 'Mag. Acc.+10', [4] = 'Mag. Acc+20', [5] = 'CHR+20', [6] = 'Magic Damage +20' } },
        Waist = 'Fucho-no-Obi',
        Legs = 'Inyanga Shalwar +2',
        Feet = 'Fili Cothurnes +1',
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
        Main = 'Naegling',
        Ammo = 'Voluspa Tathlum',
        Head = 'Straw Hat',
        Neck = 'Empath Necklace',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Cessance Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Malignance Gloves',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Petrov Ring',
        Back = { Name = 'Artio\'s Mantle', Augment = { [1] = 'Pet: R.Acc.+20', [2] = 'Pet: R.Atk.+20', [3] = 'Pet: "Regen"+10', [4] = 'Pet: Acc.+20', [5] = 'Pet: Atk.+20' } },
        Waist = 'Flume Belt +1',
        Legs = 'Tali\'ah Sera. +2',
        Feet = 'Gleti\'s Boots',
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

sets = sets:merge(gcinclude.sets, false);profile.Sets = sets;

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
