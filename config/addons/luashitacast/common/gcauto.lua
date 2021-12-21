local gcauto = {};
wstp = 1000;

gcauto.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',
};

gcauto.AMWeapons = T{
	empyrean = T{'Verethragna', 'Twashtar', 'Almace', 'Caladbolg', 'Farsha', 'Ukonvasara', 'Redemption', 'Rhongomiant', 'Kannagi', 'Masamune', 'Gambanteinn', 'Hvergelmir', 'Gandiva', 'Armageddon'},
	relic = T{'Spharai', 'Mandau', 'Excalibur', 'Ragnarok', 'Guttler', 'Bravura', 'Apocalypse', 'Gungnir', 'Kikoku', 'Amanomurakumo', 'Mjollnir', 'Claustrum', 'Yoichinoyumi', 'Annihilator'},
	mythic = T{'Conqueror', 'Glanzfaust', 'Yagrush', 'Laevateinn', 'Murgleis', 'Vajra', 'Burtgang', 'Liberator', 'Aymur', 'Carnwenhan', 'Gastraphetes', 'Kogarasumaru', 'Nagi', 'Ryunohige', 'Nirvana', 'Tizona', 'Death Penalty', 'Kenkonken', 'Terpsichore', 'Tupsimati', 'Idris', 'Epeolatry'},
	aeonic = T{'Godhands', 'Aeneas', 'Sequence', 'Lionheart', 'Tri-edge', 'Chango', 'Anguta', 'Trishula', 'Heishi Shorinken', 'Dojikiri Yasutsuna', 'Tishtrya', 'Khatvanga', 'Fail-Not', 'Fomalhaut'},
};

gcauto.AMWeaponSkills = T{
	['WAR'] = {relic = 'Scourge', empyrean = 'Ukko\'s Fury', mythic = 'King\'s Justice', aeonic = 'Upheaval'},
	['MNK'] = {relic = 'Final Heaven', empyrean = 'Victory Smite', mythic = 'Ascetic\'s Fury', aeonic = 'Shijin Spiral'},
	['WHM'] = {relic = 'Randgrith', empyrean = 'Dagan', mythic = 'Mystic Boon', aeonic = 'Realmrazer'},
	['BLM'] = {relic = 'Gates of Tartarus', empyrean = 'Mykr', mythic = 'Vidohunir', aeonic = 'Shattersoul'},
	['RDM'] = {relic = 'Mercy Stroke', empyrean = 'Chant du Cygne', mythic = 'Death Blossom', aeonic = 'Requiescat'},
	['THF'] = {relic = 'Mercy Stroke', empyrean = 'Rudra\'s Storm', mythic = 'Mandalic Stab', aeonic = 'Exenterator'},
	['PLD'] = {relic = 'Scourge', empyrean = 'Chant du Cygne', mythic = 'Atonement', aeonic = 'Requiescat'},
	['DRK'] = {relic = 'Scourge', empyrean = 'Quietus', mythic = 'Insurgency', aeonic = 'Entropy'},
	['BST'] = {relic = 'Onslaught', empyrean = 'Cloudsplitter', mythic = 'Primal Rend', aeonic = 'Ruinator'},
	['BRD'] = {relic = 'Mercy Stroke', empyrean = 'Rudra\'s Storm', mythic = 'Mordant Rime', aeonic = 'Exenterator'},
	['RNG'] = {relic = 'Coronach', empyrean = 'Armageddon', mythic = 'Trueflight', aeonic = 'Last Stand'},
	['SAM'] = {relic = 'Tachi: Kaiten', empyrean = 'Tachi: Fudo', mythic = 'Tachi: Rana', aeonic = 'Tachi: Shoha'},
	['NIN'] = {relic = 'Blade: Metsu', empyrean = 'Blade: Hi', mythic = 'Blade: Kamu', aeonic = 'Blade: Shun'},
	['DRG'] = {relic = 'Geirskogul', empyrean = 'Camlann\'s Torment', mythic = 'Drakesbane', aeonic = 'Stardiver'},
	['SMN'] = {relic = 'Gates of Tartarus', empyrean = 'Mykr', mythic = 'Garland of Bliss', aeonic = 'Shattersoul'},
	['BLU'] = {relic = '', empyrean = 'Chant du Cygne', mythic = 'Expiacion', aeonic = 'Requiescat'},
	['COR'] = {relic = '', empyrean = 'Armageddon', mythic = 'Leaden Salute', aeonic = 'Last Stand'},
	['PUP'] = {relic = '', empyrean = 'Victory Smite', mythic = 'Stringing Pummel', aeonic = 'Shijin Spiral'},
	['DNC'] = {relic = '', empyrean = 'Rudra\'s Storm', mythic = 'Pyrrhic Kleos', aeonic = 'Exenterator'},
	['SCH'] = {relic = '', empyrean = 'Mykr', mythic = 'Omniscience', aeonic = 'Shattersoul'},
	['GEO'] = {relic = '', empyrean = '', mythic = 'Exudation', aeonic = 'Realmrazer'},
	['RUN'] = {relic = '', empyrean = '', mythic = 'Dimidation', aeonic = 'Resolution'},
};

gcauto.WeaponSkills = T{
	['WAR'] = {[1] = 'None',},
	['MNK'] = {[1] = 'None', [2] = 'Victory Smite', [3] = 'Shijin Spiral'},
	['WHM'] = {[1] = 'None',},
	['BLM'] = {[1] = 'None',},
	['RDM'] = {[1] = 'None', [2] = 'Chant du Cygne', [3] = 'Savage Blade'},
	['THF'] = {[1] = 'None', [2] = 'Evisceration', [3] = 'Rudra\'s Storm', [4] = 'Savage Blade'},
	['PLD'] = {[1] = 'None', [2] = 'Chant du Cygne', [3] = 'Savage Blade'},
	['DRK'] = {[1] = 'None',},
	['BST'] = {[1] = 'None',},
	['BRD'] = {[1] = 'None', [2] = 'Evisceration', [3] = 'Rudra\'s Storm', [4] = 'Savage Blade'},
	['RNG'] = {[1] = 'None',},
	['SAM'] = {[1] = 'None', [2] = 'Tachi: Fudo', [3] = 'Tachi: Shoha', [4] = 'Tachi: Jinpu'},
	['NIN'] = {[1] = 'None', [2] = 'Blade: Metsu', [3] = 'Blade: Hi', [4] = 'Blade: Ku'},
	['DRG'] = {[1] = 'None',},
	['SMN'] = {[1] = 'None',},
	['BLU'] = {[1] = 'None', [2] = 'Chant du Cygne', [3] = 'Savage Blade'},
	['COR'] = {[1] = 'None',},
	['PUP'] = {[1] = 'None', [2] = 'Victory Smite', [3] = 'Shijin Spiral'},
	['DNC'] = {[1] = 'None', [2] = 'Evisceration', [3] = 'Rudra\'s Storm'},
	['SCH'] = {[1] = 'None',},
	['GEO'] = {[1] = 'None',},
	['RUN'] = {[1] = 'None',},
};

function gcauto.SetAlias()
	local player = gData.GetPlayer();
	local equip = gData.GetEquipment();

	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd wskill');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wstp /lac fwd wstp');

	
	if (player.MainJob == 'PLD') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /maj /lac fwd maj');
	elseif (player.MainJob == 'BLU') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /natmed /lac fwd natmed');
	elseif (player.MainJob == 'NIN') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /yonin /lac fwd yonin');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /innin /lac fwd innin');
	end

	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /zerk /lac fwd zerk');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /def /lac fwd def');
	end
	if (player.SubJob == 'SAM') or (player.MainJob == 'SAM') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /hasso /lac fwd hasso');
	end
	--[[if (player.SubJob == 'DNC') or (player.MainJob == 'DNC') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /step /lac fwd step');
	end]]

	if (gcauto.AMWeapons.empyrean:contains(equip.Main.Name)) or (gcauto.AMWeapons.relic:contains(equip.Main.Name)) or (gcauto.AMWeapons.mythic:contains(equip.Main.Name)) or (gcauto.AMWeapons.aeonic:contains(equip.Main.Name)) then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /am3 /lac fwd am3');
	end
end

function gcauto.DisplayHelp()
	print(chat.header('GCAUTO'):append(chat.message('NEED TO SET THIS UP STILL')));
end

function gcauto.SetVariables()
	local player = gData.GetPlayer();
	local equip = gData.GetEquipment();

	gcdisplay.CreateToggle('AUTO', false);
	gcdisplay.CreateCycle('WSkill', gcauto.WeaponSkills[player.MainJob]);
	

	if (player.MainJob == 'PLD') then
		gcdisplay.CreateToggle('MAJ', false);
	elseif (player.MainJob == 'BLU') then
		gcdisplay.CreateToggle('NatMed', false);
	elseif (player.MainJob == 'NIN') then
		gcdisplay.CreateToggle('Yonin', false);
		gcdisplay.CreateToggle('Innin', false);
	end


	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		gcdisplay.CreateToggle('ZERK', true);
		gcdisplay.CreateToggle('DEF', false);
	end
	if (player.SubJob == 'SAM') or (player.MainJob == 'SAM') then
		gcdisplay.CreateToggle('HASSO', true);
	end

	if (equip == nil) then return;--this isnt working on log in
	elseif (gcauto.AMWeapons.empyrean:contains(equip.Main.Name)) or (gcauto.AMWeapons.relic:contains(equip.Main.Name)) or (gcauto.AMWeapons.mythic:contains(equip.Main.Name)) or (gcauto.AMWeapons.aeonic:contains(equip.Main.Name)) then
		gcdisplay.CreateToggle('AM3', false);
	end
end

function gcauto.SetCommands(args)
	local player = gData.GetPlayer();
	local equip = gData.GetEquipment();

	if (args[1] == 'gcauto') then
		gcauto.DisplayHelp();
	elseif (args[1] == 'auto') then
		gcdisplay.AdvanceToggle('AUTO');
	elseif (args[1] == 'wskill') then
		gcdisplay.AdvanceCycle('WSkill');
	elseif (args[1] == 'wstp') then
		wstp = tonumber(args[2]);
    end
	

	if (player.MainJob == 'PLD') then
		if (args[1] == 'maj') then gcdisplay.AdvanceToggle('MAJ')
	end
	elseif (player.MainJob == 'BLU') then
		if (args[1] == 'natmed') then gcdisplay.AdvanceToggle('NatMed') end
	elseif (player.MainJob == 'NIN') then
		if (args[1] == 'yonin') and (gcdisplay.GetToggle('Innin') == true) then 
			gcdisplay.AdvanceToggle('Yonin');
			gcdisplay.AdvanceToggle('Innin');
		elseif (args[1] == 'yonin') then
			gcdisplay.AdvanceToggle('Yonin');
		end
		if (args[1] == 'innin') and (gcdisplay.GetToggle('Yonin') == true) then 
			gcdisplay.AdvanceToggle('Innin');
			gcdisplay.AdvanceToggle('Yonin');
		elseif (args[1] == 'innin') then
			gcdisplay.AdvanceToggle('Innin');
		end
	end

	
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		if (args[1] == 'zerk') then gcdisplay.AdvanceToggle('ZERK') end
		if (args[1] == 'def') then gcdisplay.AdvanceToggle('DEF') end
	end
	if (player.SubJob == 'SAM') or (player.MainJob == 'SAM') then
		if (args[1] == 'hasso') then gcdisplay.AdvanceToggle('HASSO') end
	end

	if (equip == nil) then return;--this isnt working on log in
	elseif (gcauto.AMWeapons.empyrean:contains(equip.Main.Name)) or (gcauto.AMWeapons.relic:contains(equip.Main.Name)) or (gcauto.AMWeapons.mythic:contains(equip.Main.Name)) or (gcauto.AMWeapons.aeonic:contains(equip.Main.Name)) then
		if (args[1] == 'am3') then gcdisplay.AdvanceToggle('AM3') end
	end
end

function gcauto.Warp()
	gFunc.Equip('Ring1', 'Warp Ring');
end

function gcauto.CheckRemedy()
	local player = gData.GetPlayer();
	local blind = gData.GetBuffCount('Blind');
	local paralyze = gData.GetBuffCount('Paralyze');
	local poison = 0; --gData.GetBuffCount('Poison');
	local silence = gData.GetBuffCount('Silence');

	if (blind+paralyze+poison+silence >= 1) then
		return true;
	else
		return false;
	end
end

function gcauto.CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);

			if (ability.Name[1] == check and ability ~= nil) then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end

function gcauto.AutoWS()
	local target = gData.GetTarget();
	local player = gData.GetPlayer();
	local am = (gData.GetBuffCount('Aftermath: Lv.3')) + (gData.GetBuffCount('Aftermath'));

	if (gcdisplay.GetToggle('AUTO') ~= true) then return end
	if (gcdisplay.GetToggle('AM3') == true) and (am == 0) then 
		gcauto.DoAM3(player.MainJob);
	else
		if target == nil then return end
		if (gcdisplay.GetCycle('WSkill') == 'None') then return end

		if (player.Status == 'Engaged') and (player.TP >= wstp) and (target.HPP < 99) and (target.HPP > 1) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. gcdisplay.GetCycle('WSkill') .. '" <t>');
		end
	end
end

function gcauto.DoAM3(job)
	local target = gData.GetTarget();
	local player = gData.GetPlayer();
	local equip = gData.GetEquipment();

	if (player.Status == 'Engaged') and (player.TP == 3000) and (target.HPP < 99) and (target.HPP > 1) then
		if (gcauto.AMWeapons.empyrean:contains(equip.Main.Name)) then
			if (equip.Main.Name == 'Caladbolg') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Torcleaver" <t>');
			elseif (equip.Main.Name == 'Farsha') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Cloudsplitter" <t>');
			elseif (equip.Main.Name == 'Gandiva') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Jishnu\'s Radiance" <t>');
			else
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. gcauto.AMWeaponSkills[job].empyrean .. '" <t>');
			end
		elseif (gcauto.AMWeapons.relic:contains(equip.Main.Name)) then
			if (equip.Main.Name == 'Yoichinoyumi') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Namas Arrow" <t>');
			elseif (equip.Main.Name == 'Excalibur') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Knights of Round" <t>');
			elseif (equip.Main.Name == 'Bravura') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Metatron Torment" <t>');
			elseif (equip.Main.Name == 'Apocalypse') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Catastrophe" <t>');
			else
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. gcauto.AMWeaponSkills[job].relic .. '" <t>');
			end
		elseif (gcauto.AMWeapons.mythic:contains(equip.Main.Name)) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. gcauto.AMWeaponSkills[job].mythic .. '" <t>');
		elseif (gcauto.AMWeapons.aeonic:contains(equip.Main.Name)) then
			if (equip.Main.Name == 'Fail-Not') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "Apex Arrow" <t>');
			else
				AshitaCore:GetChatManager():QueueCommand(1, '/ws "' .. gcauto.AMWeaponSkills[job].aeonic .. '" <t>');
			end
		end
	end
end


function gcauto.AutoMeds()
	local remedy = gcauto.CheckRemedy();
	local silence = gData.GetBuffCount('Silence');

	if (silence >= 1) then
		AshitaCore:GetChatManager():QueueCommand(1, '/item "Echo Drops" <me>');
	elseif (remedy == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/item "Remedy" <me>');
	end
end

function gcauto.DoJobStuff()
	local zone = gData.GetEnvironment();
	if (zone.Area == nil) or (gcauto.Towns:contains(zone.Area)) then return end
	local player = gData.GetPlayer();
	local pet = gData.GetPet();
	local target = gData.GetTarget();
	
	if (player.MainJob == 'PLD') then
		local majesty = gData.GetBuffCount('Majesty');
		if (gcdisplay.GetToggle('MAJ') == true) then	
			if ((majesty == 0) and (gcauto.CheckAbilityRecast('Majesty') == 0)) and (player.Status == 'Engaged') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "majesty" <me>')
			end
		end
	elseif (player.MainJob == 'BLU') then
		local natmed = gData.GetBuffCount('Attack Boost');
		
		if (gcdisplay.GetToggle('NatMed') == true) then	
			if (natmed <= 0) and (player.Status == 'Engaged') then
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Nat.Meditation" <me>')
			end
		end
	elseif (player.MainJob == 'NIN') then
		local yonin = gData.GetBuffCount('Yonin');
		local innin = gData.GetBuffCount('Innin');
		if (target == nil) then return;
		elseif (gcdisplay.GetToggle('Innin') == true) and (gcauto.CheckAbilityRecast('Innin') <= 0) and (innin <= 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Innin" <me>')
		elseif (gcdisplay.GetToggle('Yonin') == true) and (gcauto.CheckAbilityRecast('Yonin') <= 0) and (yonin <= 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Yonin" <me>')
		end
	elseif (player.MainJob == 'MNK') then
		local impetus = gData.GetBuffCount('Impetus');
		local berserk = gData.GetBuffCount('Berserk');
		local focus = gData.GetBuffCount('Focus');
		local dodge = gData.GetBuffCount('Dodge');

		if (berserk == 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Impetus') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Impetus" <me>');
		end
		if (focus == 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Focus') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Focus" <me>');
		elseif (dodge == 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Dodge') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Dodge" <me>');
		end
	elseif (player.MainJob == 'RDM') then
		local composure = gData.GetBuffCount('Composure');
		if (composure <= 0) and (gcauto.CheckAbilityRecast('Composure') <= 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "composure" <me>');
		end

		if (gcdisplay.GetToggle('AUTO') == true) then
			local haste = gData.GetBuffCount('Haste');
			local refresh = gData.GetBuffCount('Refresh');
			local aquaveil = gData.GetBuffCount('Aquaveil');

			if (haste == 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Haste II" <me>');
			elseif (refresh == 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Refresh III" <me>');
			elseif (aquaveil == 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aquaveil" <me>');
			end

			if (player.Status == 'Engaged') then
				local temper = gData.GetBuffCount('Multi Strikes');
				local phalanx = gData.GetBuffCount('Phalanx');

				if (temper == 0) then
					AshitaCore:GetChatManager():QueueCommand(1, '/ma "Temper II" <me>');
				elseif (phalanx == 0) then
					AshitaCore:GetChatManager():QueueCommand(1, '/ma "Phalanx II" <me>');
				end
			end
		end
	elseif (player.MainJob == 'BST') then
		if (player.Status == 'Engaged') and (pet.Status ~= 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Fight" <t>');
		elseif (gcauto.CheckAbilityRecast('Spur') <= 0) and (pet.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/pet "Spur" <me>');
		end
	elseif (player.MainJob == 'DRK') then
		local endark = gData.GetBuffCount('Endark');
		if (endark == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Endark" <me>');
		end
	end


	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		local berserk = gData.GetBuffCount('Berserk');
		local aggressor = gData.GetBuffCount('Aggressor');
		local defender = gData.GetBuffCount('Defender');
		local impetus = gData.GetBuffCount('Impetus');
		 
		if (player.MainJob == 'MNK') and (impetus >= 1) then return end

		if (defender <= 0) and (gcdisplay.GetToggle('DEF') == true) and (gcauto.CheckAbilityRecast('Defender') <= 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "defender" <me>');
		elseif (target == nil) then return;
		elseif (player.Status == 'Engaged') and (target.HPP < 99) and (target.HPP > 1) then
			if (berserk <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Berserk') <= 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "berserk" <me>');
			elseif (aggressor <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Aggressor') <= 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "aggressor" <me>');
			end
		end
	end
	if (player.SubJob == 'SAM') or (player.MainJob == 'SAM') then
		local hasso = gData.GetBuffCount('Hasso');
		local seigan = gData.GetBuffCount('Seigan');

		if (hasso <= 0) and (gcdisplay.GetToggle('HASSO') == true) and (gcauto.CheckAbilityRecast('Hasso') <= 0) then
			if (seigan >= 1) then
				gcdisplay.AdvanceToggle('HASSO');
				return;
			else
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "hasso" <me>');
			end
		end
	end
end

function gcauto.Welcome()
	print(chat.header('GCAUTO'):append(chat.message('gcauto file found!')));
	print(chat.header('GCAUTO'):append(chat.message('/gcauto for commands')));
end

function gcauto.Initialize()
	local player = gData.GetPlayer();
	gcauto.SetVariables();
	gcauto.SetAlias();
	--gcauto.Welcome();
	gcdisplay.Initialize();
	AshitaCore:GetChatManager():QueueCommand(1, '/sl blink');
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyle on');
end

function gcauto.Default()
	gcdisplay.Update();

	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');
	if (sleep+petrify+stun+terror+amnesia >= 1) then return end
	
	gcauto.AutoMeds();
	gcauto.DoJobStuff();
	gcauto.AutoWS();
end

return gcauto;