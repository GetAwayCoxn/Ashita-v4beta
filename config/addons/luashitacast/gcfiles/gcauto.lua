local gcauto = {};
local gcdisplay = gFunc.LoadFile('gcfiles/gcdisplay.lua');
wskill = 'unknown';

function gcauto.SetAlias()
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /auto /lac fwd auto');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meds /lac fwd meds');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wskill /lac fwd ws');
end

function gcauto.SetVariables()
	gcdisplay.CreateToggle('MEDS', false);
	gcdisplay.CreateToggle('AUTO', false);
	--gcdisplay.CreateCycle('Set', {[1] = 'Default', [2] = 'Hybrid', [3] = 'Acc'});
end

function gcauto.SetCommands(args)
	if (args[1] == 'auto') then
		gcdisplay.AdvanceToggle('AUTO');
	elseif (args[1] == 'meds') then
		gcdisplay.AdvanceToggle('MEDS');
	elseif (args[1] == 'ws') then
		wskill = args[2];
		AshitaCore:GetChatManager():QueueCommand(1, '/echo ' .. wskill);
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
	elseif (player.Status == 'Engaged') and (player.TP > 999) and (target.HPP < 30 or target.HPP > 85) then
		AshitaCore:GetChatManager():QueueCommand(1, '//' .. wskill);
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
	gcauto.AutoWS();
	gcdisplay.UpdateDef();
end

return gcauto;