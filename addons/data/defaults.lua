defaults = T{ --[[ Default Table and Array values, NO TOUCHY!!! ]]
    jobsabrv = {'WAR','MNK','WHM','BLM','RDM','THF','PLD','DRK','BST','BRD','RNG','SAM','NIN','DRG','SMN','BLU','COR','PUP','DNC','SCH','GEO','RUN'}; --for easier reference is all
    jobs = {
    },
    progress = {
        jobs = {0.0,0.0,0.0,0.0}, -- EXP completion, CP completion, Mastery completion, total JP holding for Oboro
        relics = {0,0,0,0,0,0}, --bynes, bronze, shells, marrows, plutons, SAD crystals
        mythics = {0,0,0,0,0}, --alex,scoria,Beitetsu,HP bayld,crystals
        empyreans = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, --{chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,CC lantern,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}

        gear = {
            ambu = {
               {{-1,'Sulevia\'s'},{-1,'S Head'},{-1,'S Body'},{-1,'S Hands'},{-1,'S Legs'},{-1,'S Feet'}},
               {{-1,'Hizamaru'},{-1,'H Head'},{-1,'H Body'},{-1,'H Hands'},{-1,'H Legs'},{-1,'H Feet'}},
               {{-1,'Inyanga'},{-1,'I Head'},{-1,'I Body'},{-1,'I Hands'},{-1,'I Legs'},{-1,'I Feet'}},
               {{-1,'Meghanada'},{-1,'Meg Head'},{-1,'Meg Body'},{-1,'Meg Hands'},{-1,'Meg Legs'},{-1,'Meg Feet'}},
               {{-1,'Jhakri'},{-1,'J Head'},{-1,'J Body'},{-1,'J Hands'},{-1,'J Legs'},{-1,'J Feet'}},
               {{-1,'Flamma'},{-1,'F Head'},{-1,'F Body'},{-1,'F Hands'},{-1,'F Legs'},{-1,'F Feet'}},
               {{-1,'Tali\'ah'},{-1,'T Head'},{-1,'T Body'},{-1,'T Hands'},{-1,'T Legs'},{-1,'T Feet'}},
               {{-1,'Mummu'},{-1,'Mu Head'},{-1,'Mu Body'},{-1,'Mu Hands'},{-1,'Mu Legs'},{-1,'Mu Feet'}},
               {{-1,'Ayanmo'},{-1,'A Head'},{-1,'A Body'},{-1,'A Hands'},{-1,'A Legs'},{-1,'A Feet'}},
               {{-1,'Mallquis'},{-1,'Mal Head'},{-1,'Mal Body'},{-1,'Mal Hands'},{-1,'Mal Legs'},{-1,'Mal Feet'}},
            },
        },
    },
    
    prices = {
        dyna = {1200,1200,1200,1000000,2000}, --not implemented yet
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
        mythics = {--{Name,Has,Alex,Scoria,Beitetsu,HP Bayld,Crystals}
            {{'Conqueror',false,0,0,0,0,0},{'Glanzfaust',false,0,0,0,0,0},{'Yagrush',false,0,0,0,0,0},{'Laevateinn',false,0,0,0,0,0},{'Murgleis',false,0,0,0,0,0},{'Vajra',false,0,0,0,0,0},{'Burtgang',false,0,0,0,0,0},{'Liberator',false,0,0,0,0,0},{'Aymur',false,0,0,0,0,0},{'Carnwenhan',false,0,0,0,0,0},{'Gastraphetes',false,0,0,0,0,0},{'Kogarasumaru',false,0,0,0,0,0},{'Nagi',false,0,0,0,0,0},{'Ryunohige',false,0,0,0,0,0},{'Nirvana',false,0,0,0,0,0},{'Tizona',false,0,0,0,0,0},{'Death Penalty',false,0,0,0,0,0},{'Kenkonken',false,0,0,0,0,0},{'Terpsichore',false,0,0,0,0,0},{'Tupsimati',false,0,0,0,0,0},{'Idris',false,0,0,0,0,0},{'Epeolatry',false,0,0,0,0,0},},

            {{18991,false,30000,0,0,0,0},{18992,false,30000,0,0,0,0},{18993,false,30000,0,0,0,0},{18994,false,30000,0,0,0,0},{18995,false,30000,0,0,0,0},{18996,false,30000,0,0,0,0},{18997,false,30000,0,0,0,0},{18998,false,30000,0,0,0,0},{18999,false,30000,0,0,0,0},{19000,false,30000,0,0,0,0},{19001,false,30000,0,0,0,0},{19002,false,30000,0,0,0,0},{19003,false,30000,0,0,0,0},{19004,false,30000,0,0,0,0},{19005,false,30000,0,0,0,0},{19006,false,30000,0,0,0,0},{19007,false,30000,0,0,0,0},{19008,false,30000,0,0,0,0},{18989,false,30000,0,0,0,0},{18990,false,30000,0,0,0,0},{'N/A',false,0,0,0,0,0},{'N/A',false,0,0,0,0,0},},

            {{19819,false,0,3,0,0,0},{19820,false,0,3,0,0,0},{19821,false,0,3,0,0,0},{19822,false,0,3,0,0,0},{19823,false,0,3,0,0,0},{19824,false,0,3,0,0,0},{19825,false,0,3,0,0,0},{19826,false,0,3,0,0,0},{19827,false,0,3,0,0,0},{19828,false,0,3,0,0,0},{19829,false,0,3,0,0,0},{19830,false,0,3,0,0,0},{19831,false,0,3,0,0,0},{19832,false,0,3,0,0,0},{19833,false,0,3,0,0,0},{19834,false,0,3,0,0,0},{19835,false,0,3,0,0,0},{19836,false,0,3,0,0,0},{19837,false,0,3,0,0,0},{19838,false,0,3,0,0,0},{'N/A',false,0,3,0,0,0},{'N/A',false,0,3,0,0,0},},

            {{20837,false,0,0,300,0,0},{20482,false,0,0,300,0,0},{21062,false,0,0,300,0,0},{21139,false,0,0,300,0,0},{20647,false,0,0,300,0,0},{20559,false,0,0,300,0,0},{20649,false,0,0,300,0,0},{20882,false,0,0,300,0,0},{20792,false,0,0,300,0,0},{20561,false,0,0,300,0,0},{21246,false,0,0,300,0,0},{21017,false,0,0,300,0,0},{20972,false,0,0,300,0,0},{20927,false,0,0,300,0,0},{21141,false,0,0,300,0,0},{20651,false,0,0,300,0,0},{21262,false,0,0,300,0,0},{20484,false,0,0,300,0,0},{20557,false,0,0,300,0,0},{21137,false,0,0,300,0,0},{21070,false,0,0,0,13099,0},{20753,false,0,0,0,13099,0},},

            {{21757,false,0,0,10000,0,0},{20510,false,0,0,10000,0,0},{21078,false,0,0,10000,0,0},{22062,false,0,0,10000,0,0},{20686,false,0,0,10000,0,0},{20585,false,0,0,10000,0,0},{20687,false,0,0,10000,0,0},{21809,false,0,0,10000,0,0},{21751,false,0,0,10000,0,0},{20586,false,0,0,10000,0,0},{21266,false,0,0,10000,0,0},{21955,false,0,0,10000,0,0},{21907,false,0,0,10000,0,0},{21858,false,0,0,10000,0,0},{22063,false,0,0,10000,0,0},{20688,false,0,0,10000,0,0},{21268,false,0,0,10000,0,0},{20551,false,0,0,10000,0,0},{20584,false,0,0,10000,0,0},{22061,false,0,0,10000,0,0},{21080,false,0,0,10000,0,0},{21685,false,0,0,10000,0,0},},

            {{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},{'TBD',false,0,0,0,0,0},},
        },
        empyreans = { --{Name,Has,chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,lanterns,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}
            {{'Verethragna',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Twashtar',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Almace',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Caladbolg',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Farsha',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Ukonvasara',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Redemption',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Rhongomiant',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Kannagi',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Masamune',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Gambanteinn',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Hvergelmir',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Gandiva',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Armageddon',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {'Daurdabla',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'Ochain',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

            {{19397,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19398,false,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19399,false,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19400,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19401,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19402,false,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19403,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19404,false,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19405,false,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19406,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19407,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19408,false,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19409,false,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19410,false,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{18573,false,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{16191,false,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

            {{19456,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19457,false,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19458,false,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19459,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19460,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19461,false,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19462,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19463,false,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19464,false,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19465,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{19466,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19467,false,0,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0},{19468,false,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0},{19469,false,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{18573,false,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0,0},{16191,false,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0,0},},

            {{19534,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19535,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0},{19536,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{19537,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{19538,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19539,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0},{19540,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19541,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0},{19542,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{19543,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{19544,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19545,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0},{19546,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0},{19547,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0},{18574,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0},{16192,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0},},

            {{19632,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19633,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19634,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19635,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19636,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19637,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19638,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19639,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19640,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19641,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19642,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19643,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19644,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{19645,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{18575,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},{16193,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1500,0,0,0,0},},

            {{19805,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19806,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19807,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19808,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19809,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19810,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19811,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19812,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19813,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19814,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19815,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19816,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{19817,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{19818,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},{18576,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0},{16194,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0},},

            {{20486,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20563,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20653,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20747,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20794,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20839,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20884,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20929,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{20974,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21019,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21064,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21143,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21212,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{21264,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0},{18571,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0},{11926,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0},},

            {{20512,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{20587,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{20689,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21684,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21752,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21758,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21810,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21859,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21908,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21956,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21079,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{22064,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{22116,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{21265,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0},{18839,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{16199,false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},

            {{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'TBD',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{'',false,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},
        },
        ambu = {},
    },
};
return defaults;