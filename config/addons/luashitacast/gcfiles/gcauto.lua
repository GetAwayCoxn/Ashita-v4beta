local gcauto = {};
local gcdisplay = gFunc.LoadFile('gcfiles/gcdisplay.lua');
wskill = 'unknown';

function gcauto.SetAlias()
	local player = gData.GetPlayer();
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meds /lac fwd meds');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd ws');
	if (player.MainJob == 'PLD') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /maj /lac fwd maj');
	end
end

function gcauto.SetVariables()
	local player = gData.GetPlayer();
	gcdisplay.CreateToggle('MEDS', false);
	gcdisplay.CreateToggle('AUTO', false);
	
	if (player.MainJob == 'PLD') then
		gcdisplay.CreateToggle('MAJ', false);
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
	
	if (player.MainJob == 'PLD') then
		if (args[1] == 'maj') then gcdisplay.AdvanceToggle('MAJ') end
	end
end

function gcauto.Warp()
	gFunc.Equip('Ring1', 'Warp Ring');
end

function gcauto.AutoWS()
	local target = gData.GetTarget();
	local player = gData.GetPlayer();

	if (gcdisplay.GetToggle('AUTO') == false) then return end
	if (wskill == 'unknown') then 
		print(chat.header('gcauto'):append(chat.message('You need to set a weapon skill by doing:')));
		print(chat.header('gcauto'):append(chat.message('/wskill weaponskillnamenospacesorquotes')));
		print(chat.header('gcauto'):append(chat.message('You need to have the shorthand plugin for this to work!')));
		wskill = 'none';
	elseif (wskill == 'none') then return
	elseif (player.Status == 'Engaged') and (player.TP > 999) and (target.HPP < 40) then
		AshitaCore:GetChatManager():QueueCommand(1, '//' .. wskill);
	end
end

function gcauto.DoJobStuff(job)
	if (job == 'PLD') then
		local cover = gData.GetBuffCount('Cover');
		local majesty = gData.GetBuffCount('Majesty');
		if (cover >= 1) then
			gFunc.EquipSet(sets.Fealty); -- same set as fealty
		end
		if (gcdisplay.GetToggle('MAJ') == true) then	
			if ((majesty == 0) and (AshitaCore:GetMemoryManager():GetPlayer():GetAbilityRecast(621) == 0)) then AshitaCore:GetChatManager():QueueCommand(1, '//majesty') end
		end
	end
end

function gcauto.Welcome()
	print(chat.header('gcauto'):append(chat.message('gcauto file found!')));
		print(chat.header('gcauto'):append(chat.message('/gcauto for commands')));
end

function gcauto.Initialize()
	gcauto.SetVariables();
	gcauto.SetAlias();
	gcauto.Welcome();
	gcdisplay.Initialize();
end

function gcauto.Unload()
	gcdisplay.Unload();
end

function gcauto.Default()
	local player = gData.GetPlayer();
	gcauto.AutoWS();
	gcdisplay.UpdateDef();
	gcauto.DoJobStuff(player.MainJob);
end

return gcauto;