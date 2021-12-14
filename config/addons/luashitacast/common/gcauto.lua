local gcauto = {};
local gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
wskill = 'Not Set';
wstp = 1000;

local Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};

function gcauto.SetAlias()
	local player = gData.GetPlayer();
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meds /lac fwd meds');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd wskill');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wstp /lac fwd wstp');

	
	if (player.MainJob == 'PLD') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /maj /lac fwd maj');
	elseif (player.MainJob == 'BLU') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /natmed /lac fwd natmed');
	end

	
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /zerk /lac fwd zerk');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /def /lac fwd def');
	end
end

function gcauto.DisplayHelp()
	print(chat.header('GCAUTO'):append(chat.message('NEED TO SET THIS UP STILL')));
end

function gcauto.SetVariables()
	local player = gData.GetPlayer();
	sj = player.SubJob;
	gcdisplay.CreateToggle('MEDS', false);
	gcdisplay.CreateToggle('AUTO', false);
	

	if (player.MainJob == 'PLD') then
		gcdisplay.CreateToggle('MAJ', false);
	elseif (player.MainJob == 'BLU') then
		gcdisplay.CreateToggle('NatMed', false);
	end


	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		gcdisplay.CreateToggle('ZERK', false);
		gcdisplay.CreateToggle('DEF', false);
	end
end

function gcauto.SetCommands(args)
	local player = gData.GetPlayer();
	if (args[1] == 'gcauto') then
		gcauto.DisplayHelp();
	elseif (args[1] == 'auto') then
		gcdisplay.AdvanceToggle('AUTO');
	elseif (args[1] == 'meds') then
		gcdisplay.AdvanceToggle('MEDS');
	elseif (args[1] == 'wskill') then
		wskill = args[2];
	elseif (args[1] == 'wstp') then
		wstp = tonumber(args[2]);
    end
	

	if (player.MainJob == 'PLD') then
		if (args[1] == 'maj') then gcdisplay.AdvanceToggle('MAJ')
	end
	elseif (player.MainJob == 'BLU') then
		if (args[1] == 'natmed') then gcdisplay.AdvanceToggle('NatMed') end
	end

	
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		if (args[1] == 'zerk') then gcdisplay.AdvanceToggle('ZERK') end
		if (args[1] == 'def') then gcdisplay.AdvanceToggle('DEF') end
	end
end

function gcauto.Warp()
	gFunc.Equip('Ring1', 'Warp Ring');
end

function gcauto.CheckRemedy()
	local player = gData.GetPlayer();
	local blind = gData.GetBuffCount('Blind');
	local paralyze = gData.GetBuffCount('Paralyze');
	local poison = gData.GetBuffCount('Poison');
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

			if (ability.Name[1] == check and ability.Name ~= nil) then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end

function gcauto.AutoWS()
	if (gcdisplay.GetToggle('AUTO') ~= true) then return end

	local target = gData.GetTarget();
	local player = gData.GetPlayer();

	if target == nil then return end
	
	if (wskill == 'unknown') then 
		print(chat.header('GCAUTO'):append(chat.message('You need to set a weapon skill by doing:')));
		print(chat.header('GCAUTO'):append(chat.message('/wskill weaponskillnamenospacesorquotes')));
		print(chat.header('GCAUTO'):append(chat.message('You need to have the shorthand plugin for this to work!')));
		wskill = 'none';
	elseif (wskill == 'none') then return
	elseif (player.Status == 'Engaged') and (player.TP >= wstp) and (target.HPP < 99) and (target.HPP > 1) then
		AshitaCore:GetChatManager():QueueCommand(1, '//' .. wskill);
	end
end

function gcauto.AutoMeds()
	--local player = gData.GetPlayer();
	local remedy = gcauto.CheckRemedy();
end

function gcauto.DoJobStuff()
	local player = gData.GetPlayer();
	local zone = gData.GetEnvironment();
	if (zone.Area == nil) or (Towns:contains(zone.Area)) then return end
	
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
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Refresh II" <me>');
			elseif (aquaveil == 0) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aquaveil" <me>');
			end

			if (player.Status == 'Engaged') then
				local temper = gData.GetBuffCount('Multi Strikes');
				local phalanx = gData.GetBuffCount('Phalanx');

				if (temper == 0) then
					AshitaCore:GetChatManager():QueueCommand(1, '/ma "temper" <me>');
				elseif (phalanx == 0) then
					AshitaCore:GetChatManager():QueueCommand(1, '/ma "Phalanx II" <me>');
				end
			end
		end
	end

	
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		local berserk = gData.GetBuffCount('Berserk');
		local aggressor = gData.GetBuffCount('Aggressor');
		local defender = gData.GetBuffCount('Defender');

		if (berserk <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Berserk') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "berserk" <me>');
		elseif (aggressor <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (gcauto.CheckAbilityRecast('Aggressor') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "aggressor" <me>');
		elseif (defender <= 0) and (gcdisplay.GetToggle('DEF') == true) and (gcauto.CheckAbilityRecast('Defender') <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "defender" <me>');
		end
	end
end

function gcauto.Welcome()
	print(chat.header('GCAUTO'):append(chat.message('gcauto file found!')));
	print(chat.header('GCAUTO'):append(chat.message('/gcauto for commands')));
end

function gcauto.Initialize()
	local player = gData.GetPlayer();
	sj = player.SubJob;
	gcauto.SetVariables();
	gcauto.SetAlias();
	--gcauto.Welcome();
	gcdisplay.Initialize();
	AshitaCore:GetChatManager():QueueCommand(1, '/sl blink'); -- add plugin load check here when you figure it out maybe
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyle on');
end

function gcauto.Unload()
	gcdisplay.Unload();
end

function gcauto.Default()
	gcdisplay.Update();

	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');

	if (sleep+petrify+stun+terror+amnesia >= 1) then
		return;
	end

	
	gcauto.AutoMeds();
	gcauto.DoJobStuff();
	gcauto.AutoWS();
end

return gcauto;