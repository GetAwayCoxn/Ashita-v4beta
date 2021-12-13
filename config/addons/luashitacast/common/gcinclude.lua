local gcinclude = {};
gcauto = gFunc.LoadFile('common\\gcauto.lua');

if (not gcauto) then
	print(chat.header('GCinclude'):append(chat.message('You dont have access to the GCauto file, I have not made this public.')));
	print(chat.header('GCinclude'):append(chat.message('Everything else will work fine. Check the readme.md  file or my github for')));
	print(chat.header('GCinclude'):append(chat.message('more information on functions/uses for these luashitacast profiles.')));
end

--[[
--Universal sets here for things like doomed or asleep; avoid main/sub/range/ammo here
--]]
gcinclude.sets = {
	Doomed = {
		Ring1 = 'Purity Ring',
		Waist = 'Gishdubar Sash',
    },
	Holy_Water = {
		Ring1 = 'Purity Ring',
		Ring2 = 'Blenmot\'s Ring',
    },
	Sleeping = {
    },
	Reraise = {
		Head = 'Twilight Helm',
		Body = 'Twilight Mail',
    },
	Utsu_Precast = {
		Neck = 'Magoraga Beads',
	},
};

gcinclude.deathswitch = false;


--[[
--Tables for table type stuffs, best to leave this alone
--]]
gcinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};
gcinclude.LockingRings = T{'Echad Ring', 'Trizek Ring', 'Endorsement Ring', 'Warp Ring','Facility Ring','Dim. Ring (Dem)','Dim. Ring (Mea)','Dim. Ring (Holla)'};
gcinclude.BstPetAttack = T{'Foot Kick','Whirl Claws','Big Scissors','Tail Blow','Blockhead','Sensilla Blades','Tegmina Buffet','Lamb Chop','Sheep Charge','Pentapeck','Recoil Dive','Frogkick','Queasyshroom','Numbshroom','Shakeshroom','Nimble Snap','Cyclotail','Somersault','Tickling Tendrils','Sweeping Gouge','Grapple','Double Claw','Spinning Top','Suction','Tortoise Stomp','Power Attack','Rhino Attack','Razor Fang','Claw Cyclone','Crossthrash','Scythe Tail','Ripper Fang','Chomp Rush','Pecking Flurry','Sickle Slash','Mandibular Bite','Wing Slap','Beak Lunge','Head Butt','Wild Oats','Needle Shot','Disembowel','Extirpating Salvo','Mega Scissors','Back Heel','Hoof Volley','Fluid Toss','Fluid Spread'};
gcinclude.BstPetMagicAttack = T{'Gloom Spray','Fireball','Acid Spray','Molting Plumage','Cursed Sphere','Nectarous Deluge','Charged Whisker','Nepenthic Plunge'};
gcinclude.BstPetMagicAccuracy = T{'Toxic Spit','Acid Spray','Leaf Dagger','Venom Spray','Venom','Dark Spore','Sandblast','Dust Cloud','Stink Bomb','Slug Family','Intimidate','Gloeosuccus','Spider Web','Filamented Hold','Choke Breath','Blaster','Snow Cloud','Roar','Palsy Pollen','Spore','Brain Crush','Choke Breath','Silence Gas','Chaotic Eye','Sheep Song','Soporific','Predatory Glare','Sudden Lunge','Numbing Noise','Jettatura','Bubble Shower','Spoil','Scream','Noisome Powder','Acid Mist','Rhinowrecker','Swooping Frenzy','Venom Shower','Corrosive Ooze','Spiral Spin','Infrasonics','Hi-Freq Field','Purulent Ooze','Foul Waters','Sandpit','Infected Leech','Pestilent Plume'};
gcinclude.BluMagPhys = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'};
gcinclude.BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar'};
gcinclude.BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
gcinclude.BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
gcinclude.BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'};
gcinclude.BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
gcinclude.BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'};
gcinclude.BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'};
gcinclude.Elements = T{'Thunder', 'Blizzard', 'Fire', 'Stone', 'Aero', 'Water', 'Light', 'Dark'};
gcinclude.HelixSpells = T{'Ionohelix', 'Cryohelix', 'Pyrohelix', 'Geohelix', 'Anemohelix', 'Hydrohelix', 'Luminohelix', 'Noctohelix'};
gcinclude.StormSpells = T{'Thunderstorm', 'Hailstorm', 'Firestorm', 'Sandstorm', 'Windstorm', 'Rainstorm', 'Aurorastorm', 'Voidstorm'};



--[[
--functions for functiony stuffs, definitely leave this stuff alone
--]]
function gcinclude.SetAlias()
	local player = gData.GetPlayer();
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dt /lac fwd dt');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /kite /lac fwd kite');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /set /lac fwd set');
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /nukeset /lac fwd nukeset');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /burst /lac fwd burst');
		if (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
			AshitaCore:GetChatManager():QueueCommand(-1, '/alias /weapon /lac fwd weapon');
			AshitaCore:GetChatManager():QueueCommand(-1, '/alias /elecycle /lac fwd elecycle');
			AshitaCore:GetChatManager():QueueCommand(-1, '/alias /helix /lac fwd helix');
			AshitaCore:GetChatManager():QueueCommand(-1, '/alias /weather /lac fwd weather');
			AshitaCore:GetChatManager():QueueCommand(-1, '/alias /nuke /lac fwd nuke');
			if (player.MainJob == 'BLM') then
				AshitaCore:GetChatManager():QueueCommand(-1, '/alias /death /lac fwd death');
			end
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fight /lac fwd fight');
	end
	if (player.MainJob == 'THF') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /th /lac fwd th');
	end
end

function gcinclude.SetVariables() --De-clutter this mess
	local player = gData.GetPlayer();
	varhelper.CreateToggle('DTset', false);
	varhelper.CreateToggle('Kite', false);
	varhelper.CreateCycle('Set', {[1] = 'Default', [2] = 'Hybrid', [3] = 'Acc'});
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		varhelper.CreateToggle('Burst', false);
		varhelper.CreateCycle('NukeSet', {[1] = 'Power', [2] = 'Macc',});
		if (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
			varhelper.CreateCycle('Weapon', {[1] = 'Club', [2] = 'Staff'});
			varhelper.CreateCycle('Element', {[1] = 'Thunder', [2] = 'Blizzard', [3] = 'Fire', [4] = 'Stone', [5] = 'Aero', [6] = 'Water', [7] = 'Light', [8] = 'Dark'});
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') then
		varhelper.CreateToggle('Fight', false);
	end
	if (player.MainJob == 'THF') then
		varhelper.CreateToggle('TH', true);
	end
end

function gcinclude.SetCommands(args)
	local player = gData.GetPlayer();
	if (args[1] == 'dt') then
		varhelper.AdvanceToggle('DTset');
    elseif (args[1] == 'set') then
		varhelper.AdvanceCycle('Set');
	elseif (args[1] == 'kite') then
		varhelper.AdvanceToggle('Kite');
    end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		if (args[1] == 'nukeset') then
			varhelper.AdvanceCycle('NukeSet');
		elseif (args[1] == 'burst') then
			varhelper.AdvanceToggle('Burst');
		end
		if (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
			if (args[1] == 'weapon') then
				varhelper.AdvanceCycle('Weapon');
			elseif (args[1] == 'elecycle') then
				varhelper.AdvanceCycle('Element');
			elseif (args[1] == 'helix') then
				gcinclude.DoSCHspells('helix');
			elseif (args[1] == 'weather') then
				gcinclude.DoSCHspells('weather');
			elseif (args[1] == 'nuke') then
				gcinclude.DoNukes(args[2]);
			end
			if (player.MainJob == 'BLM') then
				if (args[1] == 'death') then
					if (gcinclude.deathswitch) then
						gcinclude.deathswitch = false;
					else
						gcinclude.deathswitch = true;
					end
				gcinclude.LockDeathSet(gcinclude.deathswitch);
				end
			end
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') then
		if (args[1] == 'fight') then
			if (varhelper.GetToggle('Fight') == false) then
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range');
				varhelper.AdvanceToggle('Fight');
			else
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range');
				varhelper.AdvanceToggle('Fight');
			end
		end
	end
	if (player.MainJob == 'THF') then
		if (args[1] == 'th') then
			varhelper.AdvanceToggle('TH');
		end
	end
	if (gcauto ~= nil) then gcauto.SetCommands(args) end
end

function gcinclude.CheckCommonDebuffs()
	local weakened = gData.GetBuffCount('Weakened');
	local sleep = gData.GetBuffCount('Sleep');
	local doom = (gData.GetBuffCount('Doom'))+(gData.GetBuffCount('Bane'));
	local cover = gData.GetBuffCount('Cover');

	if (sleep >= 1) then gFunc.EquipSet(gcinclude.sets.Sleeping) end
	if (doom >= 1) then	gFunc.EquipSet(gcinclude.sets.Doomed) end
	if (weakened >= 1) then gFunc.EquipSet(gcinclude.sets.Reraise) end
end

function gcinclude.CheckLockingRings()
	local rings = gData.GetEquipment();
	if (rings.Ring1 ~= nil) and (gcinclude.LockingRings:contains(rings.Ring1.Name)) then
		local tempRing1 = rings.Ring1.Name;
		gFunc.Equip('Ring1', tempRing1);
	end
	if (rings.Ring2 ~= nil) and (gcinclude.LockingRings:contains(rings.Ring2.Name)) then
		local tempRing2 = rings.Ring2.Name;
		gFunc.Equip('Ring2', tempRing2);
	end
end

function gcinclude.SetTownGear()
	local zone = gData.GetEnvironment();
	if (zone.Area ~= nil) and (gcinclude.Towns:contains(zone.Area)) then gFunc.EquipSet(sets.Town) end
end

function gcinclude.SetRegenRefreshGear()
	local pet = gData.GetPet();
	local player = gData.GetPlayer();
	if (player.Status == 'Idle') then
		if (player.HPP < 80 ) then
			gFunc.EquipSet(sets.Idle_Regen);
		end
		if (player.MPP < 50 ) then
			gFunc.EquipSet(sets.Idle_Refresh);
		end
		if (player.HPP < 50) then
			gFunc.EquipSet(sets.Dt);
		end
	end
	if pet ~= nil then
		if (pet.HPP < 75) then
			gFunc.EquipSet(sets.Pet_Dt);
		end
	end
end

function gcinclude.CheckBailout()
	local player = gData.GetPlayer();
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');

	if (sleep+petrify+stun+terror+amnesia >= 1) or (player.TP <= 999) then
		return false;
	else
		return true;
	end
end

function gcinclude.DoNukes(tier)
	local cast = varhelper.GetCycle('Element');
	AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. ' ' .. tier .. '" <t>');
end

function gcinclude.LockDeathSet(toggle)
	if (toggle) then
		AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable all');
	else
		AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable all');
	end
end

function gcinclude.DoSCHspells(spell)
	local player = gData.GetPlayer();
	local e = varhelper.GetCycle('Element');
	local key = 0;
	local cast = 'cast';
	local type = {};
	local target = 'me';

	if (spell == 'helix') then 
		type = gcinclude.HelixSpells;
		target = '<t>';
	elseif (spell == 'weather') then
		type = gcinclude.StormSpells;
		target = '<me>'
	end

	if (player.MainJob == "BLM") then
		if (player.SubJob == "SCH") then
			for k, v in pairs(gcinclude.Elements) do
				if (v == e) then
					key = k;
				end
			end
			for a, b in pairs(type) do
				if (a == key) then
					cast = b;
				end
			end
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. '" ' .. target);
		end
	elseif (player.MainJob == "SCH") then
		for k, v in pairs(gcinclude.Elements) do
			if (v == e) then
				key = k;
			end
		end
		for a, b in pairs(type) do
			if (a == key) then
				cast = b;
			end
		end
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. ' II" ' .. target);
	end
end

function gcinclude.CheckCancels()
	local action = gData.GetAction();
	local sneak = gData.GetBuffCount('Sneak');
	local stoneskin = gData.GetBuffCount('Stoneskin');

	local function do_jig()
		AshitaCore:GetChatManager():QueueCommand(1, '/ja "Spectral Jig" <me>');
	end
	local function do_sneak()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <me>');
	end
	local function do_ss()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stoneskin" <me>');
	end

	if (action.Name == 'Spectral Jig' and sneak ~=0) then
		gFunc.CancelAction();
		AshitaCore:GetChatManager():QueueCommand(1, '/cancel Sneak');
		do_jig:once(1);
	elseif (action.Name == 'Sneak' and sneak ~= 0) then
		gFunc.CancelAction();
		AshitaCore:GetChatManager():QueueCommand(1, '/cancel Sneak');
		do_sneak:once(1);
	elseif (action.Name == 'Stoneskin' and stoneskin ~= 0) then
		gFunc.CancelAction();
		AshitaCore:GetChatManager():QueueCommand(1, '/cancel Stoneskin');
		do_ss:once(1);
	end
end

function gcinclude.CheckDefault()
	if (gcauto ~= nil) then gcauto.Default() end

	gcinclude.SetRegenRefreshGear();
	gcinclude.SetTownGear();
    gcinclude.CheckCommonDebuffs();
	gcinclude.CheckLockingRings();
end

function gcinclude.Unload()
	varhelper.Destroy();
	if (gcauto ~= nil) then gcauto.Unload() end
end

function gcinclude.Initialize()
	varhelper.Initialize();
	gcinclude.SetVariables();
	gcinclude.SetAlias();
	if (gcauto ~= nil) then gcauto.Initialize() end
end

return gcinclude;