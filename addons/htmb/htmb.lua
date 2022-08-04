addon.name      = 'htmb';
addon.author    = 'towbes, ported to Ashita v4 by GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'htmb';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local chat = require('chat')
--require 'ffxi.recast'
--require 'logging'
--require 'timer'

local buyQueue = { };  -- Table to hold commands queued for sending
local objDelay        = 0.65; -- The delay to prevent spamming packets.
local objTimer        = 0;    -- The current time used for delaying packets.
local busy = false
local insideMenu = false
local pkt = {};
local __debug = true



local htmb_map = {
     [0] = {name = 'Shadow Lord phantom gem',      cost = 10},
     [1] = {name = 'Stellar Fulcrum phantom gem',  cost = 10},
     [2] = {name = 'Celestial Nexus phantom gem',  cost = 10},
     [3] = {name = 'Phantom gem of apathy',        cost = 15},
     [4] = {name = 'Phantom gem of arrogance',     cost = 15},
     [5] = {name = 'Phantom gem of envy',          cost = 15},
     [6] = {name = 'Phantom gem of cowardice',     cost = 15},
     [7] = {name = 'Phantom gem of rage',          cost = 15},
     [8] = {name = 'P. Perpetrator phantom gem',   cost = 20},
     [9] = {name = 'Savage\'s phantom gem',        cost = 10},
    [10] = {name = 'Warrior\'s Path phantom gem',  cost = 10},
    [11] = {name = 'Puppet in Peril phantom gem',  cost = 10},
    [12] = {name = 'Legacy phantom gem',           cost = 10},
    [13] = {name = 'Head wind phantom gem',        cost = 10},
    [14] = {name = 'Avatar phantom gem',           cost = 10},
    [15] = {name = 'Moonlit Path phantom gem',     cost = 10},
    -- page 2
    [16] = {name = 'Waking the Beast phantom gem', cost = 10},
    [17] = {name = 'Waking Dream phantom gem',     cost = 10},
    [18] = {name = 'Feared One phantom gem',       cost = 10},
    [19] = {name = 'Dawn phantom gem',             cost = 10},
    [20] = {name = 'Stygian Pact phantom gem',     cost = 10},
    [21] = {name = 'Champion phantom gem',         cost = 10},
    [22] = {name = 'Divine phantom gem',           cost = 10},
    [23] = {name = 'Maiden phantom gem',           cost = 10},
}

local valid_zones = {

	[231] = {npc="Trisvain", menu=892, Index =427}, -- Northern San d'Oria

	[236] = {npc="Raving Opossum", menu=429}, -- Port Bastok

	[240] = {npc="Mimble-Pimble", menu=895}, -- Port Windurst

}

local menu_options = 0
local merit_points = 34

----------------------------------------------------------------------------------------------------
-- func: print_help
-- desc: Displays a help block for proper command usage.
----------------------------------------------------------------------------------------------------
local function print_help(cmd, help)
    -- Print the invalid format header..
    Message('Invalid format for command: ' .. cmd); 

    -- Loop and print the help commands..
    for k, v in pairs(help) do
        Message('Syntax: ' .. v[1] .. ' ' .. v[2]);
    end
end

function has_bit (mask, offset)
	DebugMessage("Checking for bit")
    return math.floor(mask/2^offset)%2 == 1
end

function get_option_index(item)
	local option = item
	if htmb_map[option] and htmb_map[option].cost > merit_points then
		Message("You don't have enough merits");
		DebugMessage("Merit points: " .. merit_points)
		return false
	elseif htmb_map[option] and has_bit(menu_options, option) then
		DebugMessage("Found it! Option: " .. option)
		return option
	else
		DebugMessage("Could not find that KI")
		return false
	end
end	
	
ashita.events.register('command', 'command_cb', function (e)
	-- Get the command arguments..
    local args = e.command:args();

    if (args[1] ~= '/htmb') then
        return false;
    end

	e.blocked = true; 

	if (#args >=2 and args[1] == '/htmb') then

		local item = args[3]:lower();
		-- /htmb buy #    <--- the index number of desired item on htmb_map *0-23
		if args[2] == 'buy' and args[3] ~= nil then
			if not busy then
				pkt = validate(item)
				if pkt ~= nil then
					Message("Poking NPC");
					busy = true
					local pokeNpcPacket = struct.pack('I2I2I4I2I2', 0x0E1A, 0x0000, pkt['Target'], pkt['Target Index'], 0x0000):totable();
					table.insert(buyQueue, { 0x01A, pokeNpcPacket});
				end
				return true
			else
				Message("Stuck in a menu sorry");
				return true
			end;
		end
	end
	
    -- Prints the addon help..
    print_help('/htmb', {
		{'/htmb buy #', ' Buy index number of desired item on htmb_map *0-23 (Look in LUA file)'}
    });
	return false
end);

------------------------------------------------------------------------------------------------
-- desc: Getting pup information from packets for subsequent equipment changes.
----------------------------------------------------------------------------------------------------

ashita.events.register('packet_in', 'packet_in_callback1', function (e)
	-- Party Member's Status
	if (e.id == 0x034) and busy and pkt ~= nil then
		menu_options = struct.unpack('I4', e.data, 0x0C + 1)
		merit_points = struct.unpack('b', e.data, 0x10 + 1)
		insideMenu = true
		pkt['Option Index'] = get_option_index(pkt['MapId'])
		if pkt['Option Index'] then
			DebugMessage("Option index: " .. pkt['Option Index'])
			--Get from 034: Zone, Menu ID, 
			DebugMessage("Got 0x034 packet, Buying the KI")
			local startPacket = struct.pack('I2I2', 0x0416, 0x0000, AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0), 0):totable();		
			AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, startPacket)--HERE
			local buyPacket = struct.pack('I2I2I4bbI2I2bbI2I2', 0x0A5B, 0x0000, pkt['Target'], 0x02, pkt['Option Index'], 0x0000, pkt['Target Index'], 0x00, 0x00, pkt['Zone'], pkt['Menu ID']):totable();
			table.insert(buyQueue, { 0x05B, buyPacket});
		else
			Message("Not enough merits or already have KI");
			local closePacket = struct.pack('I2I2I4I2I2I2bbI2I2', 0x0A5B, 0x0000, pkt['Target'], 0x0000, 0x0000, pkt['Target Index'], 0x00, 0x00, pkt['Zone'], pkt['Menu ID']):totable();
			table.insert(buyQueue, { 0x05B, closePacket});
		end
		busy = false
		return true;

	end
	return false;
end);

----------------------------------------------------------------------------------------------------
-- func: render
-- desc: Event called when the addon is being rendered.
----------------------------------------------------------------------------------------------------

ashita.events.register('d3d_present', 'present_cb', function ()
    -- Process the objectives packet queue..
    process_queue();
end);

----------------------------------------------------------------------------------------------------
-- func: process_queue
-- desc: Processes the packet queue to be sent.
----------------------------------------------------------------------------------------------------

function process_queue()
    if  (os.time() >= (objTimer + objDelay)) then
        objTimer = os.time();

        -- Ensure the queue has something to process..
        if (#buyQueue > 0) then
            -- Obtain the first queue entry..
            local data = table.remove(/l2 , 1);
            -- Send the queued object..
            DebugMessage("Adding process_queue outgoing")
			AshitaCore:GetPacketManager():AddOutgoingPacket(data[1], data[2]);--HERE
		elseif busy and (#buyQueue < 1) then
			DebugMessage("Done buying, closing menu")
			--AshitaCore:GetChatManager():QueueCommand('/sendkey escape down', 1)
			--ashita.timer.once(0.1, escape_up)
			--busy = false
			--insideMenu = false
        end
    end
end

--[[function escape_up ()
	AshitaCore:GetChatManager():QueueCommand('/sendkey escape up', 1)	
end]]

function validate(item)
	local zone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0);
	local me,target_index,target_id,distance;
	local result = {};
	DebugMessage("Checking item #" .. item)
	if valid_zones[zone] then
		for x = 0, 2303 do
			local e = GetEntity(x);
			if (e ~= nil and e.WarpPointer ~= 0) then
				if (e.Name == GetPlayerEntity().Name) then
					DebugMessage("Found me")
					result['me'] = e;
				elseif e.TargetIndex == valid_zones[zone].Index then
					DebugMessage("Found the zone")
					target_index = e.TargetIndex;
					target_id = e.ServerId;
					result['Menu ID'] = valid_zones[zone].menu;	
					DebugMessage("Menu ID: " .. result['Menu ID'])
					npc_name = e.Name;--not used?
					distance = e.Distance;
				end;
			end
		end
	
		if math.sqrt(distance) < 15 then
			DebugMessage("NPC Found, searching for item")
			local ite = htmb_map[tonumber(item)]
			if ite then
			DebugMessage("Item is " .. ite.name)
			else
			DebugMessage("Item is NIL")
			end
			if ite then
				result['MapId'] = tonumber(item)
				result['Target'] = target_id;
				DebugMessage("Target ID: " .. result['Target'])
				--Do math for option index to get quantity of powders
				result['Option Index'] = 0
				DebugMessage("Option Index: " .. result['Option Index'])
				result['Target Index'] = target_index;
				DebugMessage("Target Index: " .. result['Target Index'])
				result['Zone'] = zone;
				DebugMessage("Zone: " .. result['Zone'])
			end;
		else
			Message("Too far from npc");
		end
	else
		Message("Not in a zone with a htmb npc");
	end;

	if result['Zone'] == nil then result = nil end;
	return result;
end

function Message(m)
	local str = tostring(m);
	print(chat.header(addon.name) .. chat.message(str));
end

function DebugMessage(message)
  if __debug then
    print("\31\200[\31\05HTMB\31\200]\31\207 " .. message)
  end
end
