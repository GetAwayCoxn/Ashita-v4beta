local filters = T{
	alliance = {
		ranged = true,
		uses = false,
		all = false,
		healing = false,
		casting = true,
		melee = true,
		misses = true,
		damage = true,
		readies = true,
		items = false,
	},
	monsters = {
		alliance = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		monsters = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		enemies = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		me = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		my_pet = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		others = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		other_pets = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		party = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		my_fellow = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
	},
	enemies = {
		alliance = {
		    ranged = true,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = true,
		    misses = true,
		    damage = false,
		    readies = false,
		    items = false,
		},
		monsters = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		enemies = {
		    ranged = false,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		me = {
		    ranged = true,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = true,
		    misses = true,
		    damage = false,
		    readies = false,
		    items = false,
		},
		my_pet = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		others = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		other_pets = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
		party = {
		    ranged = true,
		    uses = false,
		    all = false,
		    healing = false,
		    casting = false,
		    melee = true,
		    misses = true,
		    damage = false,
		    readies = false,
		    items = false,
		},
		my_fellow = {
		    ranged = false,
		    uses = false,
		    all = true,
		    healing = false,
		    casting = false,
		    melee = false,
		    misses = false,
		    damage = false,
		    readies = false,
		    items = false,
		},
	},
	me = {
		ranged = false,
		uses = false,
		all = false,
		target = false,
		healing = false,
		casting = false,
		melee = false,
		misses = false,
		damage = false,
		readies = false,
		items = false,
	},
	my_pet = {
		ranged = false,
		uses = false,
		all = true,
		healing = false,
		casting = false,
		melee = false,
		misses = false,
		damage = false,
		readies = false,
		items = false,
	},
	others = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		casting = false,
		melee = false,
		misses = false,
		damage = false,
		readies = false,
		items = false,
	},
	other_pets = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		casting = false,
		melee = false,
		misses = false,
		damage = false,
		readies = false,
		items = false,
	},
	party = {
		ranged = true,
		uses = false,
		all = false,
		healing = false,
		casting = true,
		melee = true,
		misses = true,
		damage = true,
		readies = true,
		items = false,
	},
	my_fellow = {
		ranged = false,
		uses = false,
		all = false,
		healing = false,
		casting = false,
		melee = false,
		misses = false,
		damage = false,
		readies = false,
		items = false,
	},
};

return filters;