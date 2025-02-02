--[[
* Ashita - Copyright (c) 2014 - 2016 atom0s [atom0s@live.com]
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to
* Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
*
* By using Ashita, you agree to the above license and its terms.
*
*      Attribution - You must give appropriate credit, provide a link to the license and indicate if changes were
*                    made. You must do so in any reasonable manner, but not in any way that suggests the licensor
*                    endorses you or your use.
*
*   Non-Commercial - You may not use the material (Ashita) for commercial purposes.
*
*   No-Derivatives - If you remix, transform, or build upon the material (Ashita), you may not distribute the
*                    modified material. You are, however, allowed to submit the modified works back to the original
*                    Ashita project in attempt to have it added to the original project.
*
* You may not apply legal terms or technological measures that legally restrict others
* from doing anything the license permits.
*
* No warranties are given.
]]--

_addon.author   = 'towbes';
_addon.name     = 'Pupassist';
_addon.version  = '0.1';

---------------------------------
--DO NOT EDIT BELOW THIS LINE

require 'timer'
require 'common'
require 'ffxi.recast'
require 'logging'


manDelay        = 15 -- The delay to prevent spamming maneuvers , 3 seconds
manTimer        = 0;    -- The current time used for delaying packets.
petDelay = 5
petTimer = 0
runDelay = 20
runTimer = 0



meleeFlag = false


function do_pet()
	if (os.time() >= (petTimer + petDelay)) then
		petTimer = os.time();
		local player = GetPlayerEntity();
		local name = AshitaCore:GetDataManager():GetParty():GetMemberName(0)
		if (player == nil) then
			return;
		elseif name == "Goits" and meleeFlag then
			AshitaCore:GetChatManager():QueueCommand('/a <bt>', 1)
		else
			local pet 						= GetEntity(player.PetTargetIndex);
			if pet == nil then
				local recastTimerActivate   	= ashita.ffxi.recast.get_ability_recast_by_id(205);
				local recastTimerdeusex   		= ashita.ffxi.recast.get_ability_recast_by_id(115);
				if recastTimerActivate == 0 then
					AshitaCore:GetChatManager():QueueCommand('/ja activate', 1)	
				elseif recastTimerdeusex == 0 then
					AshitaCore:GetChatManager():QueueCommand('/ja "Deus Ex Automata"', 1)
				else
					return;
				end
			elseif pet.Status ~= 1 then
				AshitaCore:GetChatManager():QueueCommand('/ja deploy <bt>', 1)			
			elseif pet.Status == 1 and meleeFlag then
				AshitaCore:GetChatManager():QueueCommand('/a <bt>', 1)		
			end
		end
	end
end


----------------------------------------------------------------------------------------------------
-- func: render
-- desc: Event called when the addon is being rendered.
----------------------------------------------------------------------------------------------------


ashita.register_event('render', function()

	local player = GetPlayerEntity();
	if (player == nil) then
		return;
	end


	do_pet();

end);