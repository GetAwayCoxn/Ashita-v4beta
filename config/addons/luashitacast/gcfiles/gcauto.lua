local gcauto = {};
local ws;

function gcauto.SetAlias()
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meds /lac fwd meds');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd ws');
end

function gcauto.SetVariables()
	varhelper.CreateToggle('AUTO', false);
	varhelper.CreateToggle('MEDS', false);
	--varhelper.CreateCycle('Set', {[1] = 'Default', [2] = 'Hybrid', [3] = 'Acc'});
end

function gcauto.SetCommands(args)
	if (args[1] == 'auto') then
		varhelper.AdvanceToggle('AUTO');
	elseif (args[1] == 'meds') then
		varhelper.AdvanceToggle('MEDS');
	elseif (args[1] == 'ws') then
		ws = args[2];
		AshitaCore:GetChatManager():QueueCommand(1, '/echo ' .. ws);
    end
end

function gcauto.Warp()
	gFunc.Equip('Ring1', 'Warp Ring');
end

function gcauto.AutoWS()
	local player = gData.GetPlayer();

	if (varhelper.GetToggle('AUTO') == false) then gFunc.CancelAction() return end
	if (ws == nil) then 
		print(chat.header('gcauto'):append(chat.message('You need to set a weapon skill by doing:')));
		print(chat.header('gcauto'):append(chat.message('/wskill weaponskillnamenospacesorquotes')));
		print(chat.header('gcauto'):append(chat.message('Disengaging gcauto ... use /auto again when ready.')));
		varhelper.AdvanceToggle('AUTO');
	elseif (player.Status == 'Engaged') and (player.TP > 999) then
		AshitaCore:GetChatManager():QueueCommand(1, '//' .. ws);
	end
end

function gcauto.Welcome()
	print(chat.header('gcauto'):append(chat.message('gcauto found!')));
		print(chat.header('gcauto'):append(chat.message('/gcauto for commands')));
end

function gcauto.Initialize()
	gcauto.SetVariables();
	gcauto.SetAlias();
	gcauto.Welcome();
end

return gcauto;