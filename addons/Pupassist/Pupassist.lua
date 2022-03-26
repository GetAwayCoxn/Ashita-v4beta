addon.name      = 'Pupassist';
addon.author    = 'name';
addon.version   = '1.00';
addon.desc      = 'Does things.';
addon.link      = 'http://www.google.com';

require('common');

local manDelay = 15;
local manTimer = 0;
local petDelay = 5;
local petTimer = 0;
local runDelay = 20;
local runTimer = 0;
local meleeFlag = false;

function do_pet()
	if (os.time() >= (petTimer + petDelay)) then
		petTimer = os.time();
		local player = GetPlayerEntity();
		local name = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
		if (player == nil) then
			return;
		elseif name == "Goits" and meleeFlag then
			AshitaCore:GetChatManager():QueueCommand(1, '/a <bt>'); 
		else
			local PetID = AshitaCore:GetMemoryManager():GetEntity():GetPetTargetIndex(AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0));
			if PetID == nil then
				local recastTimerActivate = CheckAbilityRecast('Activate');
				local recastTimerdeusex = CheckAbilityRecast('Deus Ex Automata');
				if recastTimerActivate == 0 then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja activate');
				elseif recastTimerdeusex == 0 then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Deus Ex Automata"');
				else
					return;
				end
			elseif (AshitaCore:GetMemoryManager():GetEntity():GetStatus(PetID) ~= 1) then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja deploy <bt>');
			elseif (AshitaCore:GetMemoryManager():GetEntity():GetStatus(PetID) == 1) and meleeFlag then
				AshitaCore:GetChatManager():QueueCommand(1, '/a <bt>');
			end
		end
	end
end

function CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);

			if ability ~= nil and ability.Name[1] ~= 'Unknown' and (ability.Name[1] == check) then
				RecastTime = timer;
			end
		end
	end
	return RecastTime;
end

ashita.events.register('d3d_present', 'present_cb', function ()

	local player = GetPlayerEntity();
	if (player == nil) or (player.MainJob ~= 18) then
		return;
	end


	do_pet();

end);