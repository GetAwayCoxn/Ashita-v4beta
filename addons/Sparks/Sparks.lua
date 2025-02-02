addon.name = 'Sparks'

addon.author = 'Brax(orig) - Sammeh Modified - v 2.0.0.2 - Towbes modified v2.0.0.3 - Winter Solstice v4.0.0.0 for Ashita v4'

addon.version = '4.0.0.0'

-- 2.0.0.2  Added version for my plugin.  Added in //sparks reset  and cleaned up some output 

require('common')
--require('timer')
db = require('map')

npc_name = ""
pkt = {}
all_temp_items = {}
current_temp_items = {}

valid_zones = T{"Western Adoulin","Southern San d'Oria","Windurst Woods","Bastok Markets","Escha - Ru'Aun","Escha - Zi'Tah","Reisinjima"}

--unity npc reference
--Npcs.Values[17739961] = { id = 17739961, en = 'Igsli',            zone = 235 }
--Npcs.Values[17719646] = { id = 17719646, en = 'Urbiolaine',       zone = 230 }
--Npcs.Values[17764611] = { id = 17764611, en = 'Teldro-Kesdrodo',  zone = 241 }
--Npcs.Values[17764612] = { id = 17764612, en = 'Yonolala',         zone = 241 }
--Npcs.Values[17826181] = { id = 17826181, en = 'Nunaarl Bthtrogg', zone = 256 }


valid_zones = {

	[256] = {npc="Eternal Flame", menu=5081}, -- Western Adoulin

	[230] = {npc="Rolandienne", menu=995}, -- Southern San d'Oria

	[235] = {npc="Isakoth", menu=26}, -- Bastok Markets

	[241] = {npc="Fhelm Jobeizat", menu=850}, -- Windurst Woods
	
	[288] = {npc="Affi", menu=9701},  -- Escha Zitah
	
	[289] = {npc="Dremi", menu=9701},  -- Escha RuAun
	
	[291] = {npc="Shiftrix", menu=9701},  -- Reisinjima
	
	}

defaults = {}
settings = defaults
busy = false
receivedItem = true
currSparks = 0
freeslots = 0

local buyQueue = {}
local packetQueue = {}
local totalBuy = 0
local buyTimer = 0
local buyDelay = 1.5
local __lclock, __sendclock = 0,0
local __cycle = .65
insideMenu = false

local busyTimer = 0
local busyDelay = 1
ashita.events.register('command', 'command_cb', function (e)
	-- Get the command arguments..
    local args = e.command:args()
	local cmd = args[2]
	if #args == 0 or args[1] ~= '/sparks' then
		return
	end

	if #args >=2 then
		table.remove(args, 1)
		table.remove(args, 1)
		
		for i,v in pairs(args) do
			args[i] = AshitaCore:GetChatManager():ParseAutoTranslate(args[i], false)
		end

		local item = table.concat(args, " "):lower()

		ki = 0
		
		if cmd == 'buy' then
			if shouldAbort() then
				return
			end
			if not busy then
				pkt = validate(item)
				if pkt then
					busy = true
					print("\30\110[Sparks] Buying " .. item)
					poke_npc(pkt['Target'], pkt['Target Index'])
				else
					print("\30\68[Sparks] Can't find item in menu")
				end
			else
				print("\30\68[Sparks] Sparks is busy.")
			end
		elseif cmd:find('buyamt') then
			if shouldAbort() then
				return
			end

			if not busy then
				pkt = validate(item)
				if pkt then
					totalBuy = tonumber(string.sub(cmd, 7))
					for i=1, totalBuy do
						table.insert(buyQueue, item)
					end
				
					busy = true
					poke_npc(pkt['Target'], pkt['Target Index'])
				else
					print("\30\68[Sparks] Can't find item in menu")
				end
			else
				print("\30\68[Sparks] Sparks is busy.")
			end			
		elseif cmd == 'buyall' then

			local currentzone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
			
			if currentzone == 241 or currentzone == 230 or currentzone == 235 or currentzone == 256 then
				if shouldAbort() then
					return
				end

				--Send currency packet and set current sparks with incoming packet 0x113:
				local currpacket = struct.pack('bbbb', 0x0F, 0x03, 0x00, 0x00):totable()
				AshitaCore:GetPacketManager():AddOutgoingPacket(0x10F, currpacket)

				busy = true
				ashita.tasks.once(2,(function (_item)
					buy_all(_item)
				end):bindn(item))

			else
				print("\30\68[Sparks] You are not currently in a zone with a sparks NPC")
			end	
		elseif cmd == 'cancel' then
			-- Finished buying - cleanup	
			local packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 0, 16384, pkt['Target Index'], 0, 0, pkt['Zone'], pkt['Menu ID']):totable()
			AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
			packet = struct.pack('bbbbhh', 0x016, 0x02, 0x00, 0x00, GetPlayerEntity().TargetIndex, 0):totable()
			AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, packet)
			busy = false
			lastpkt = pkt
			pkt = {}
			insideMenu = false
		elseif cmd == 'buyki' then
			if not busy then
				ki = 1
				print("\30\110[Sparks] Buying KI: " .. item)
				pkt = validate(item)
				if pkt then
					busy = true
					poke_npc(pkt['Target'], pkt['Target Index'])
				else
					print("\30\68[Sparks] Can't find item in menu")
				end
			else
				print("\30\68[Sparks] Sparks is busy.")
			end
		elseif cmd == 'find' then
			table.vprint(fetch_db(item))
		elseif cmd == 'buyalltemps' then
			local currentzone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
			
			if currentzone == 291 or currentzone == 289 or currentzone == 288 then
				find_current_temp_items()
				find_missing_temp_items()
				number_of_missing_items = 0
				
				for countmissing, countitems in pairs(missing_temp_items) do
					number_of_missing_items = number_of_missing_items + 1
				end
				
				print("\30\110[Sparks] Number of missing items: " .. number_of_missing_items)
				if number_of_missing_items ~= 0 then
					for keya,itema in pairs(missing_temp_items) do
						for keyb,itemb in pairs(db) do
							if itemb.TempItem == 1 then
								if keyb == itema then
									local item = itemb.Name:lower()
									print("\30\110[Sparks] Buying temp item: " .. item)
									if not busy then
										pkt = validate(item)
										if pkt then
											busy = true
											poke_npc(pkt['Target'], pkt['Target Index'])
										else
											print("\30\68[Sparks] Can't find item in menu")
										end
									else
										print("\30\68[Sparks] Sparks is busy.")
									end
								end
							end
						end
					end
				end
			else				
				print("\30\68[Sparks] You are not currently in a Geas Fete area")
			end
		elseif cmd == 'listtemp' then
			local currentzone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
			if currentzone == 291 or currentzone == 289 or currentzone == 288 then
				find_current_temp_items()
				find_missing_temp_items()
				number_of_missing_items = 0
				for countmissing,countitems in pairs(missing_temp_items) do
					number_of_missing_items = number_of_missing_items  + 1
				end
				
				print("\30\110[Sparks] Number of missing items: " .. number_of_missing_items)
			else
				print("\30\68[Sparks] You are not currently in a Geas Fete area")
			end
		elseif cmd == 'listki' then
			find_missing_ki()
			
			if found_mollifier == 0 then 
				print('\30\68[Sparks] Mollifier: Missing')
			else
				print('\30\68[Sparks] Mollifier: Check')
			end
			if found_radialens == 0 then 
				print('\30\68[Sparks] Radialens: Missing')
			else
				print('\30\68[Sparks] Radialens: Check')
			end
			if found_tribulens == 0 then 
				print('\30\68[Sparks] Tribulens: Missing')
			else
				print('\30\68[Sparks] Tribulens: Check')
			end
		elseif cmd == 'buyallki' then
			local currentzone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
			if currentzone == 291 or currentzone == 289 or currentzone == 288 then 
				find_missing_ki()
				number_of_missing_items = 0
				for countmissing,countitems in pairs(missing_ki) do
					number_of_missing_items = number_of_missing_items +1
				end
				print('\30\68[Sparks] Number of Missing Items: '..number_of_missing_items)
				if number_of_missing_items ~= 0 then 
					for keya,itema in pairs(missing_ki) do
						for keyb,itemb in pairs(db) do
							if itemb.TempItem == 2 then
								if itemb.Name:lower() == itema:lower() then
									local item = itemb.Name:lower()
										print('\30\68[Sparks] Buying Temp Item:'..item)
									if not busy then
										pkt = validate(item)
											if pkt then
												busy = true
												poke_npc(pkt['Target'],pkt['Target Index'])
											else 
												print("\30\68[Sparks] find item in menu")
											end
									else
										print("\30\68[Sparks] Sparks is busy.")
									end
								end
							end
						end
					end
				end
			else 
				print('\30\68[Sparks] You are not in a Gaes Fete Area')
			end
		elseif cmd == 'reset' then
			reset_me()
		end
		
		return true
	end
	
	return false
end)

function buy_all(item)
	print("\30\110[Sparks] Buying as many " .. item .. " as possible")
	
	-- Change freeslots to match the number based on sparks possible to purchase
	local itemCost = fetch_db(item).Cost
	local totalPurchase = math.floor(currSparks / itemCost)

	if totalPurchase < freeslots then
		freeslots = totalPurchase
		print("\30\110[Sparks] You can purchase " .. freeslots .. " total items, buying " .. item)
	else
		print("\30\110[Sparks] Buying " .. item .. " until full")
	end
	
		
	pkt = validate(item)
	if pkt then						
		totalBuy = freeslots
		local currentloop = 0
		while currentloop < freeslots do
			currentloop = currentloop + 1
			-- Add to queue
			table.insert(buyQueue, item)
		end
		poke_npc(pkt['Target'], pkt['Target Index'])
	else
		print("\30\68[Sparks] Can't find item in menu")
	end
end

function processQueue(exitPacket)

	while (table.getn(buyQueue) > 0 and busy and pkt and insideMenu) do
		if (table.getn(buyQueue) > 1) then
			AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packetQueue[1])
			print("\30\110[Sparks] Buying item.")
		else
			AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packetQueue[1])
			print("\30\110[Sparks] Buying last item and closing out.")
		end
		table.remove(buyQueue, 1)
		table.remove(packetQueue, 1)

		coroutine.sleep(buyDelay + math.random(0.5) * 0.5) -- buyDelay + 0.0 through 0.5
	end
	AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, exitPacket)

	packet = struct.pack('bbbbhh', 0x016, 0x02, 0x00, 0x00, GetPlayerEntity().TargetIndex, 0):totable()
	AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, packet)
	
	busy = false
	lastpkt = pkt
	pkt = {}
	insideMenu = false
end
function validate(item)
	local zone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
	local me,target_index,target_id,distance
	local result = {}

	if valid_zones[zone] then
		for x = 0, 2303 do
			local e = GetEntity(x)
			if (e ~= nil and e.WarpPointer ~= 0) then
				if (e.Name == GetPlayerEntity().Name) then
					result['me'] = i
				elseif e.Name == valid_zones[zone].npc then
					target_index = e.TargetIndex
					target_id = e.ServerId
					npc_name = e.Name
					result['Menu ID'] = valid_zones[zone].menu				
					distance = e.Distance
				end
			end
		end
	
		if math.sqrt(distance) < 15 then
            local ite = fetch_db(item)
			if ite then
				result['Target'] = target_id
				result['Option Index'] = ite['Option']
				result['_unknown1'] = ite['Index']
				result['Target Index'] = target_index
				result['Zone'] = zone
			end
		else
			print("\30\68[Sparks] Too far from npc")
		end
	else
		print("\30\68[Sparks] Not in a zone with a sparks npc")
	end

	if result['Zone'] == nil then result = nil end
	return result
end




function fetch_db(item)
 for i,v in pairs(db) do
  if string.lower(v.Name) == string.lower(item) then
	return v
  end
 end
end

function find_all_tempitems()
	for i,v in pairs(db) do
		if v.TempItem == 1 then
			all_temp_items[#all_temp_items+1] = i
		end
	end
end


function find_current_temp_items()
	count = 0
	current_temp_items = {}
	tempitems = windower.ffxi.get_items().temporary
	for key,item in pairs(tempitems) do
		-- print(key,item)
		if key ~= 'max' and key ~= 'count'  and key ~= 'enabled' then
			for ida,itema in pairs(item) do
				if itema ~= 0 and ida == 'id' then 
					count = count + 1
					current_temp_items[#current_temp_items+1] = itema
				end
			end
		end
	end

end

function find_missing_temp_items()
	missing_temp_items = {}
	for key,item in pairs(all_temp_items) do
		itemmatch = 0
		for keya,itema in pairs(current_temp_items) do
			if item == itema then
				itemmatch = 1
			end
		end
		if itemmatch == 0 then
			missing_temp_items[#missing_temp_items+1] = item
			-- print(db[item].Name)
		end
	end
	--print(table.concat(missing_temp_items, ', '))
end

function find_missing_ki()
	missing_ki = {}
 	found_mollifier = 0
	found_radialens = 0
	found_tribulens = 0
	local me = AshitaCore:GetMemoryManager():GetPlayer()
        if (me == nil) then return; end
	if me:HasKeyItem(3032) then
		found_mollifier = 1
	end
	if me:HasKeyItem(3031) then
		found_radialens = 1
	end
	if me:HasKeyItem(2894) then
		found_tribulens = 1
	end

	if found_mollifier == 0 then
		missing_ki[#missing_ki+1] = "mollifier"
	end
	if found_tribulens == 0 then
		missing_ki[#missing_ki+1] = "tribulens"
	end
	if found_radialens == 0 then
		missing_ki[#missing_ki+1] = "radialens"
	end
	print(table.concat(missing_ki, ', '))
end

ashita.events.register('packet_in', 'packet_in_cb', function (e)
	local id = e.id
	local packet = e.data
	
	if id == 0x020 then
		local itemID = struct.unpack('H', packet, 0x0C + 1)
		if (itemID > 0) then
			local foundItem = AshitaCore:GetResourceManager():GetItemById(itemID)
			if (foundItem) then
				local itemName = foundItem.Name[0]
				receivedItem = true
			end
		end
	end

	if id == 0x032 or id == 0x034 then
		if busy == true and pkt then
			insideMenu = true
			if npc_name ~= 'Dremi' and npc_name ~= 'Affi' and npc_name ~= 'Shiftrix' then
				-- build packet
				local packet      = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], pkt['Option Index'], pkt['_unknown1'], pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable()
				local exit_packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 0, 16384, pkt['Target Index'], 0, 0, pkt['Zone'], pkt['Menu ID']):totable()
				if totalBuy > 0 then			
					for i = 1, totalBuy do
						table.insert(packetQueue, packet)
						totalBuy = totalBuy - 1
					end

					ashita.tasks.once(2,(function (exitPacket)
						processQueue(exitPacket)
					end):bindn(exit_packet))
				else
					-- Buy 1
					AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
				
					--exit menu 
					
					AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, exit_packet)
				end
			
			else  -- reisinjima does it different....
				-- build packet
				local packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], pkt['Option Index'], pkt['_unknown1'], pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable()
				AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
				
				if ki == 0 then
					packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 14, pkt['_unknown1'], pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable()
					AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
				elseif ki == 1 then 
					packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 3, pkt['_unknown1'], pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable()
					AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
				end
				
				-- send exit menu
				packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 0, pkt['_unknown1'], pkt['Target Index'], 0, 0, pkt['Zone'], pkt['Menu ID']):totable()
				AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
			end

			if (buyQueue and table.getn(buyQueue) <= 0) then
				local packet = struct.pack('bbbbhh', 0x016, 0x02, 0x00, 0x00, GetPlayerEntity().TargetIndex, 0):totable()
				AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, packet)
				busy = false
				lastpkt = pkt
				pkt = {}
				insideMenu = false
			end
			e.blocked = true
		end
	elseif id == 0x113 then
		--print("incoming currency")
		currSparks = struct.unpack('I',packet, 0x74 + 1)
	end
end)

function reset_me()
	if lastpkt then
		local packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, lastpkt['Target'], lastpkt['Option Index'], "16384", lastpkt['Target Index'], 0, 0, lastpkt['Zone'], lastpkt['Menu ID']):totable()
		AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet)
	end
end

function count_inv()
	local playerinv = AshitaCore:GetMemoryManager():GetInventory()
	local maxInventory = playerinv:GetContainerCountMax(0)
	local uinv = 0

	for i = 1, maxInventory do -- index 0 is Gil, all visible inventory slots do not count this. Start at index 1
		local item = playerinv:GetContainerItem(0, i)
		if (item ~= nil and item.Id ~= 0) then
			uinv = uinv + 1
		end
	end

	freeslots = maxInventory - uinv
end


function poke_npc(npc,target_index)

	if npc and target_index then
		local pokeNpcPacket = struct.pack('bbbbihhhhfff', 0x01A, 0x07, 0, 0, npc, target_index, 0, 0, 0, 0, 0, 0):totable();			
		AshitaCore:GetPacketManager():AddOutgoingPacket(0x01A, pokeNpcPacket)
	end

end

function shouldAbort()
	count_inv()
	if freeslots == 0 then
		print("\30\68[Sparks] Your inventory is full. Aborting.")
		return true
	end
	if busy then
		print("\30\68[Sparks] Sparks is busy. Aborting.")
	end
	return false
end

ashita.events.register('load', 'load_cb', function ()
	find_all_tempitems()
end)