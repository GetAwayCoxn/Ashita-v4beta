local filters = T{
	alliance = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		items = false,
		melee = true,
		readies = false,
		damage = false,
		misses = true,
		casting = false,
	},
	monsters = {
		alliance = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		monsters = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		enemies = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		me = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		my_pet = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		others = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		other_pets = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		party = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		my_fellow = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
	},
	enemies = {
		alliance = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    items = false,
		    melee = true,
		    readies = false,
		    damage = false,
		    misses = true,
		    casting = false,
		},
		monsters = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		enemies = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    items = false,
		    melee = true,
		    readies = false,
		    damage = false,
		    misses = true,
		    casting = false,
		},
		me = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    items = false,
		    melee = true,
		    readies = false,
		    damage = false,
		    misses = true,
		    casting = false,
		},
		my_pet = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		others = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		other_pets = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
		party = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    items = false,
		    melee = true,
		    readies = false,
		    damage = false,
		    misses = true,
		    casting = false,
		},
		my_fellow = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    items = false,
		    melee = false,
		    readies = false,
		    damage = false,
		    misses = false,
		    casting = false,
		},
	},
	me = {
		ranged = false,
		uses = false,
		all = false,
		items = false,
		healing = false,
		readies = false,
		melee = true,
		casting = false,
		damage = false,
		misses = true,
		target = false,
	},
	my_pet = {
		ranged = false,
		uses = false,
		all = true,
		healing = false,
		items = false,
		melee = false,
		readies = false,
		damage = false,
		misses = false,
		casting = false,
	},
	others = {
		ranged = false,
		uses = false,
		all = true,
		healing = false,
		items = false,
		melee = false,
		readies = false,
		damage = false,
		misses = false,
		casting = false,
	},
	other_pets = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		items = false,
		melee = true,
		readies = false,
		damage = false,
		misses = true,
		casting = false,
	},
	party = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		items = false,
		melee = true,
		readies = false,
		damage = false,
		misses = true,
		casting = false,
	},
	my_fellow = {
		ranged = false,
		uses = false,
		all = true,
		healing = false,
		items = false,
		melee = false,
		readies = false,
		damage = false,
		misses = false,
		casting = false,
	},
};

return filters;