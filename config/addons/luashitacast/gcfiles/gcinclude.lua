local gcinclude = {};
local player = gData.GetPlayer();

--Default sets that should be over written by any sets in your JOB lua, im trying to avoid main/sub/range/ammo here
gcinclude.sets = {
	Dt = {
		Head = 'Nyame Helm', -- DT7% all jobs
		Neck = 'Loricate Torque +1', -- DT6% all jobs
		Ear2 = 'Etiolation Earring', -- MT3% all jobs
        Feet = 'Nyame Sollerets', -- DT7% all jobs
		Ring1 = 'Defending Ring', -- DT10% all jobs
		Ring2 = 'Gelatinous Ring +1', -- PT7% all jobs
    },

	Tp_Default = {

	};
	Tp_Hybrid = Tp_Default;
	Tp_Acc = {
		Ring1 = 'Defending Ring',
    },
	Precast = {
		Head = 'Haruspex Hat', -- 8%
		Neck = 'Baetyl Pendant', -- 4% all jobs
		Ear1 = 'Etiolation Earring', -- 1% all jobs
		Ear2 = 'Loquac. Earring', -- 2% all jobs
		Body = 'Agwu\'s Robe', -- 8%
		Hands = 'Gende. Gages +1', -- 7%
		Ring1 = 'Kishar Ring', -- 4%
		Ring2 = 'Prolix Ring', -- 2% all jobs
		Back = 'Swith Cape +1', --4%
		Waist = 'Embla Sash', -- 5%
		Legs = 'Enif Cosciales', -- 8%
		Feet = 'Volte Gaiters', -- 6%
    },

	Ws_Default = {
		Neck = 'Fotia Gorget',
		Waist = 'Fotia Belt',
    },
	Ws_Hybrid = Ws_Default;
	Ws_Acc = Ws_Hybrid;

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
};

--Tables for table type stuff
Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library'};
LockingRings = T{'Echad Ring', 'Trizek Ring', 'Endorsement Ring', 'Warp Ring','Facility Ring','Dim. Ring (Dem)','Dim. Ring (Mea)','Dim. Ring (Holla)'};
BstPetAttack = T{'Foot Kick','Whirl Claws','Big Scissors','Tail Blow','Blockhead','Sensilla Blades','Tegmina Buffet','Lamb Chop','Sheep Charge','Pentapeck','Recoil Dive','Frogkick','Queasyshroom','Numbshroom','Shakeshroom','Nimble Snap','Cyclotail','Somersault','Tickling Tendrils','Sweeping Gouge','Grapple','Double Claw','Spinning Top','Suction','Tortoise Stomp','Power Attack','Rhino Attack','Razor Fang','Claw Cyclone','Crossthrash','Scythe Tail','Ripper Fang','Chomp Rush','Pecking Flurry','Sickle Slash','Mandibular Bite','Wing Slap','Beak Lunge','Head Butt','Wild Oats','Needle Shot','Disembowel','Extirpating Salvo','Mega Scissors','Back Heel','Hoof Volley','Fluid Toss','Fluid Spread'};
BstPetMagicAttack = T{'Gloom Spray','Fireball','Acid Spray','Molting Plumage','Cursed Sphere','Nectarous Deluge','Charged Whisker','Nepenthic Plunge'};
BstPetMagicAccuracy = T{'Toxic Spit','Acid Spray','Leaf Dagger','Venom Spray','Venom','Dark Spore','Sandblast','Dust Cloud','Stink Bomb','Slug Family','Intimidate','Gloeosuccus','Spider Web','Filamented Hold','Choke Breath','Blaster','Snow Cloud','Roar','Palsy Pollen','Spore','Brain Crush','Choke Breath','Silence Gas','Chaotic Eye','Sheep Song','Soporific','Predatory Glare','Sudden Lunge','Numbing Noise','Jettatura','Bubble Shower','Spoil','Scream','Noisome Powder','Acid Mist','Rhinowrecker','Swooping Frenzy','Venom Shower','Corrosive Ooze','Spiral Spin','Infrasonics','Hi-Freq Field','Purulent Ooze','Foul Waters','Sandpit','Infected Leech','Pestilent Plume'};
BluMagPhys = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'};
BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar'};
BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral'};
BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'};
BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'};
BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'};

gcinclude.SetAlias = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /dt /lac fwd dt');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /kite /lac fwd kite');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /set /lac fwd set');
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /set /lac fwd nuke');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /burst /lac fwd burst');
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /weapon /lac fwd weapon');
	end
end

gcinclude.SetVariables = function()
	varhelper.CreateToggle('DTset', false);
	varhelper.CreateToggle('Kite', false);
	varhelper.CreateCycle('Set', {[1] = 'Default', [2] = 'Hybrid', [3] = 'Acc'});
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		varhelper.CreateCycle('NukeSet', {[1] = 'Power', [2] = 'Macc'});
		varhelper.CreateToggle('Burst', false);
		varhelper.CreateCycle('Weapon', {[1] = 'Club', [2] = 'Staff'});
	end
end

gcinclude.SetCommands = function(args)
	if (args[1] == 'dt') then
		varhelper.AdvanceToggle('DTset');
    elseif (args[1] == 'set') then
		varhelper.AdvanceCycle('Set');
	elseif (args[1] == 'kite') then
		varhelper.AdvanceToggle('Kite');
    end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
		if (args[1] == 'nuke') then
			varhelper.AdvanceCycle('NukeSet');
		elseif (args[1] == 'burst') then
			varhelper.AdvanceToggle('Burst');
		elseif (args[1] == 'weapon') then
			varhelper.AdvanceCycle('Weapon');
		end
	end
end

gcinclude.CheckCommonDebuffs = function()
	local weakened = gData.GetBuffCount(1);
	local sleep = gData.GetBuffCount(2);
	local doom = (gData.GetBuffCount(15))+(gData.GetBuffCount(30));

	if (sleep ~= 0) then
		gFunc.EquipSet(gcinclude.sets.Sleeping);
	end
	if (doom ~= 0) then
		gFunc.EquipSet(gcinclude.sets.Doomed);
	end
	if (weakened ~= 0) then
		gFunc.EquipSet(gcinclude.sets.Reraise);
	end
end

gcinclude.CheckLockingRings = function()
	local rings = gData.GetEquipment();
	if (rings.Ring1 ~= nil) and (LockingRings:contains(rings.Ring1.Name)) then
		local tempRing1 = rings.Ring1.Name;
		gFunc.Equip('Ring1', tempRing1);
	end
	if (rings.Ring2 ~= nil) and (LockingRings:contains(rings.Ring2.Name)) then
		local tempRing2 = rings.Ring2.Name;
		gFunc.Equip('Ring2', tempRing2);
	end
end

gcinclude.Initialize = function()
	varhelper.Initialize();
	gcinclude.SetVariables();
	gcinclude.SetAlias();
end

return gcinclude;