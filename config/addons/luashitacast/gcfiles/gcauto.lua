local gcauto = {};
local gcdisplay = gFunc.LoadFile('gcfiles/gcdisplay.lua');
wskill = 'Not Set';

function gcauto.SetAlias()
	local player = gData.GetPlayer();
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meds /lac fwd meds');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd ws');

	-- Special Main Job Stuffs
	if (player.MainJob == 'PLD') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /maj /lac fwd maj');
	elseif (player.MainJob == 'BLU') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /natmed /lac fwd natmed');
	end

	--Special Sub Job Stuffs
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /zerk /lac fwd zerk');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /def /lac fwd def');
	end
end

function gcauto.SetVariables()
	local player = gData.GetPlayer();
	gcdisplay.CreateToggle('MEDS', false);
	gcdisplay.CreateToggle('AUTO', false);
	
	-- Special Main Job Stuffs
	if (player.MainJob == 'PLD') then
		gcdisplay.CreateToggle('MAJ', false);
	elseif (player.MainJob == 'BLU') then
		gcdisplay.CreateToggle('NatMed', false);
	end

	--Special Sub Job Stuffs
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		gcdisplay.CreateToggle('ZERK', false);
		gcdisplay.CreateToggle('DEF', false);
	end
end

function gcauto.SetCommands(args)
	local player = gData.GetPlayer();
	if (args[1] == 'auto') then
		gcdisplay.AdvanceToggle('AUTO');
	elseif (args[1] == 'meds') then
		gcdisplay.AdvanceToggle('MEDS');
	elseif (args[1] == 'ws') then
		wskill = args[2];
    end
	
	-- Special Main Job Stuffs
	if (player.MainJob == 'PLD') then
		if (args[1] == 'maj') then gcdisplay.AdvanceToggle('MAJ')
	end
	elseif (player.MainJob == 'BLU') then
		if (args[1] == 'natmed') then gcdisplay.AdvanceToggle('NatMed') end
	end

	--Special Sub Job Stuffs
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
	local sleep = gData.GetBuffCount('sleep');
	local stun = gData.GetBuffCount('stun');
	local terror = gData.GetBuffCount('terror');
	local amnesia = gData.GetBuffCount('amnesia');

	if (sleep+stun+terror+amnesia >= 1) or (player.TP <= 999) then
		return false;
	else
		return true;
	end
end

function gcauto.AutoWS()
	local target = gData.GetTarget();
	local player = gData.GetPlayer();

	if target == nil then return end
	if (gcdisplay.GetToggle('AUTO') == true) then
		if (wskill == 'unknown') then 
			print(chat.header('GCAUTO'):append(chat.message('You need to set a weapon skill by doing:')));
			print(chat.header('GCAUTO'):append(chat.message('/wskill weaponskillnamenospacesorquotes')));
			print(chat.header('GCAUTO'):append(chat.message('You need to have the shorthand plugin for this to work!')));
			wskill = 'none';
		elseif (wskill == 'none') then return
		elseif (player.Status == 'Engaged') and (player.TP > 999) and (target.HPP < 97) and (target.HPP > 2) then
			AshitaCore:GetChatManager():QueueCommand(1, '//' .. wskill);
		end
	end
end

function gcauto.AutoMeds()
	local player = gData.GetPlayer();
end

function gcauto.DoJobStuff()
	local player = gData.GetPlayer();

	-- Main Job Stuffs
	if (player.MainJob == 'PLD') then
		local majesty = gData.GetBuffCount('Majesty');
		if (gcdisplay.GetToggle('MAJ') == true) then	
			if ((majesty == 0) and (AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(621) == 0)) and (player.Status == 'Engaged') then
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
	end

	-- Sub Job Stuffs
	if (player.SubJob == 'WAR') or (player.MainJob == 'WAR') then
		local berserk = gData.GetBuffCount('Berserk');
		local aggressor = gData.GetBuffCount('Aggressor');
		local defender = gData.GetBuffCount('Defender');

		if (berserk <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(1) <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "berserk" <me>');
		elseif (aggressor <= 0) and (gcdisplay.GetToggle('ZERK') == true) and (AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(4) <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "aggressor" <me>');
		end

		if (defender <= 0) and (gcdisplay.GetToggle('DEF') == true) and (AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(3) <= 0) and (player.Status == 'Engaged') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "defender" <me>');
		end
	end
end

function gcauto.Welcome()
	print(chat.header('GCAUTO'):append(chat.message('gcauto file found!')));
	print(chat.header('GCAUTO'):append(chat.message('/gcauto for commands')));
end

function gcauto.Initialize()
	gcauto.SetVariables();
	gcauto.SetAlias();
	gcauto.Welcome();
	gcdisplay.Initialize();
	AshitaCore:GetChatManager():QueueCommand(1, '/sl blink'); -- add addon load check here when you figure it out maybe
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyle on');
end

function gcauto.Unload()
	gcdisplay.Unload();
end

function gcauto.Default()
	local sleep = gData.GetBuffCount('sleep');
	local petrify = gData.GetBuffCount('petrification');
	local stun = gData.GetBuffCount('stun');
	local terror = gData.GetBuffCount('terror');
	local amnesia = gData.GetBuffCount('amnesia');

	if (sleep+petrify+stun+terror+amnesia >= 1) then
		return;
	end

	gcdisplay.UpdateDef();
	gcauto.AutoMeds();
	gcauto.DoJobStuff();
	gcauto.AutoWS();
end

return gcauto;