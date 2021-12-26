defaults = T{
        jobs = {
        },
        progress = {
            jobs = {0.0,0.0,0.0,0.0}, -- EXP completion, CP completion, Mastery completion, total JP holding for Oboro
            relics = {0,0,0,0,0,0}, --bynes, bronze, shells, marrows, plutons, SAD crystals
            mythics = {},
            empyreans = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, --{chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,CC lantern,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}
        },
        gear = {
            relic = {},
            empyrean = {},
            af = {},
        },
        prices = {
            dyna = {1200,1200,1200,1000000,2000},
        },

        weapons = {
            relics = { --{name, has, bynes, bronze, shells} (first key should all be names and 0's)
                {{'Spharai',0,0,0,0},{'Mandau',0,0,0,0},{'Excalibur',0,0,0,0},{'Ragnarok',0,0,0,0},{'Guttler',0,0,0,0},{'Bravura',0,0,0,0},{'Apocalypse',0,0,0,0},{'Gungnir',0,0,0,0},{'Kikoku',0,0,0,0},{'Amanomurakumo',0,0,0,0},{'Mjollnir',0,0,0,0},{'Claustrum',0,0,0,0},{'Yoichinoyumi',0,0,0,0,},{'Annihilator',0,0,0,0},{'Gjallarhorn',0,0,0,0},{'Aegis',0,0,0,0},},
                {{18260,false,0,0,0},{18266,false,0,0,0},{18272,false,0,0,0},{18278,false,0,0,0},{18284,false,0,0,0},{18290,false,0,0,0},{18302,false,0,0,0},{18296,false,0,0,0},{18308,false,0,0,0},{18314,false,0,0,0},{18320,false,0,0,0},{18326,false,0,0,0},{18344,false,0,0,0},{18332,false,0,0,0},{18338,false,0,0,0},{15066,false,0,0,0},},
                {{18261,false,400,0,0},{18267,false,400,0,0},{18273,false,0,400,0},{18279,false,0,400,0},{18285,false,0,0,300},{18291,false,300,0,0},{18303,false,0,0,500},{18297,false,0,0,400},{18309,false,400,0,0},{18315,false,0,300,0},{18321,false,0,500,0},{18327,false,0,0,500},{18345,false,0,400,0},{18333,false,500,0,0},{18339,false,0,0,300},{15067,false,100,100,100},},
                {{18262,false,0,1400,0},{18268,false,0,1400,0},{18274,false,1400,0,0},{18280,false,0,0,1600},{18286,false,0,1400,0},{18292,false,0,0,1600},{18304,false,0,1600,0},{18298,false,1600,0,0},{18310,false,0,0,1600},{18316,false,0,0,1500},{18322,false,1600,0,0},{18328,false,1600,0,0},{18346,false,0,1500,0},{18334,false,0,0,1500},{18340,false,1400,0,0},{15068,false,400,400,400},},
                {{18263,false,0,0,6100},{18269,false,0,0,6100},{18275,false,0,0,6100},{18281,false,6100,0,0},{18287,false,6000,0,0},{18293,false,0,6000,0},{18305,false,6200,0,0},{18299,false,0,6100,0},{18311,false,0,6100,0},{18317,false,6000,0,0},{18323,false,0,0,6200},{18329,false,0,6200,0},{18347,false,0,0,6100},{18335,false,0,6200,0},{18341,false,0,6000,0},{15069,false,2000,2000,2000},},
                {{18651,false,10000,0,0},{18652,false,10000,0,0},{18653,false,0,10000,0},{18654,false,0,10000,0},{18655,false,0,0,10000},{18656,false,10000,0,0},{18658,false,0,0,10000},{18657,false,0,0,10000},{18659,false,10000,0,0},{18660,false,0,10000,0},{18661,false,0,10000,0},{18662,false,0,0,10000},{18664,false,0,10000,0},{18663,false,10000,0,0},{18342,false,0,0,10000},{15070,false,0,10000,0},},
                {{18665,false,0,0,0},{18666,false,0,0,0},{18667,false,0,0,0},{18668,false,0,0,0},{18669,false,0,0,0},{18670,false,0,0,0},{18672,false,0,0,0},{18671,false,0,0,0},{18673,false,0,0,0},{18674,false,0,0,0},{18675,false,0,0,0},{18676,false,0,0,0},{18678,false,0,0,0},{18677,false,0,0,0},{18577,false,0,0,0},{16195,false,0,0,0},},
                {{19746,false,5,0,0},{19747,false,5,0,0},{19748,false,5,0,0},{19749,false,5,0,0},{19750,false,5,0,0},{19751,false,5,0,0},{19753,false,5,0,0},{19752,false,5,0,0},{19754,false,5,0,0},{19755,false,5,0,0},{19756,false,5,0,0},{19757,false,5,0,0},{19759,false,5,0,0},{19758,false,5,0,0},{18578,false,0,0,0},{16196,false,0,0,0},},
                {{20480,false,0,0,300},{20555,false,0,0,300},{20645,false,0,0,300},{20745,false,0,0,300},{20790,false,0,0,300},{20835,false,0,0,300},{20880,false,0,0,300},{20925,false,0,0,300},{20970,false,0,0,300},{21015,false,0,0,300},{21060,false,0,0,300},{21135,false,0,0,300},{21210,false,0,0,300},{21260,false,0,0,300},{18579,false,0,0,0},{16197,false,0,0,0},},
                {{20509,false,0,0,10000},{20583,false,0,0,10000},{20685,false,0,0,10000},{21683,false,0,0,10000},{21750,false,0,0,10000},{21756,false,0,0,10000},{21808,false,0,0,10000},{21857,false,0,0,10000},{21906,false,0,0,10000},{21954,false,0,0,10000},{21077,false,0,0,10000},{22060,false,0,0,10000},{22115,false,0,0,10000},{21267,false,0,0,10000},{18580,false,0,0,0},{16198,false,0,0,0},},
                {{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{'TBD',false,0,0,0},{18572,false,5,0,0},{11927,false,5,0,0},},
            },
            mythics = {},
            empyreans = { --{chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,lanterns,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}
                {{'Verethragna',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Twashtar',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Almace',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Caladbolg',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Farsha',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Ukonvasara',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Redemption',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Rhongomiant',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Kannagi',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Masamune',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Gambanteinn',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Hvergelmir',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Gandiva',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Armageddon',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {'Daurdabla',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Ochain',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

                {{19397,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19398,false,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19399,false,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19400,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19401,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19402,false,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19403,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19404,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19405,false,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19406,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19407,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19408,false,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19409,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19410,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{18573,false,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{16191,false,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

                {{19456,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19457,false,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19458,false,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19459,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19460,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19461,false,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19462,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19463,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19464,false,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19465,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19466,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19467,false,0,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0},{19468,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19469,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{18573,false,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0,0},{16191,false,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0,0},},

                {{19534,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19535,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0},{19536,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{19537,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{19538,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19539,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0},{19540,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19541,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19542,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{19543,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{19544,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19545,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0},{19546,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19547,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{18574,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{16192,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0},},

                {{19632,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19633,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19634,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19635,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19636,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19637,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19638,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19639,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19640,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19641,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19642,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19643,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19644,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19645,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{18575,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{16193,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},},

                {{19805,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19806,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19807,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19808,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19809,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19810,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19811,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19812,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19813,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19814,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19815,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19816,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19817,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19818,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{18576,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{16194,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},},

                {{20486,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20563,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20653,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20747,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20794,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20839,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20884,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20929,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20974,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21019,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21064,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21143,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21212,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21264,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{18571,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0},{11926,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0},},

                {{20512,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{20587,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{20689,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21684,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21752,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21758,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21810,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21859,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21908,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21956,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21079,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{22064,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{22116,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21265,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{18839,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{16199,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

                {{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},
            },
            aeonics = {},
        },
    };
return defaults;