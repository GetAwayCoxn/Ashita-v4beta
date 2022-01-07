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
            af = {
               {{-1,'Pummeler\'s'},{-1,'WAR Head'},{-1,'WAR Body'},{-1,'WAR Hands'},{-1,'WAR Legs'},{-1,'WAR Feet'}},
               {{-1,'Anchorite\'s'},{-1,'MNK Head'},{-1,'MNK Body'},{-1,'MNK Hands'},{-1,'MNK Legs'},{-1,'MNK Feet'}},
               {{-1,'Theophany'},{-1,'WHM Head'},{-1,'WHM Body'},{-1,'WHM Hands'},{-1,'WHM Legs'},{-1,'WHM Feet'}},
               {{-1,'Spaekona\'s'},{-1,'BLM Head'},{-1,'BLM Body'},{-1,'BLM Hands'},{-1,'BLM Legs'},{-1,'BLM Feet'}},
               {{-1,'Atrophy'},{-1,'RDM Head'},{-1,'RDM Body'},{-1,'RDM Hands'},{-1,'RDM Legs'},{-1,'RDM Feet'}},
               {{-1,'Pillager\'s'},{-1,'THF Head'},{-1,'THF Body'},{-1,'THF Hands'},{-1,'THF Legs'},{-1,'THF Feet'}},
               {{-1,'Reverence'},{-1,'PLD Head'},{-1,'PLD Body'},{-1,'PLD Hands'},{-1,'PLD Legs'},{-1,'PLD Feet'}},
               {{-1,'Ignominy'},{-1,'DRK Head'},{-1,'DRK Body'},{-1,'DRK Hands'},{-1,'DRK Legs'},{-1,'DRK Feet'}},
               {{-1,'Totemic'},{-1,'BST Head'},{-1,'BST Body'},{-1,'BST Hands'},{-1,'BST Legs'},{-1,'BST Feet'}},
               {{-1,'Brioso'},{-1,'BRD Head'},{-1,'BRD Body'},{-1,'BRD Hands'},{-1,'BRD Legs'},{-1,'BRD Feet'}},
               {{-1,'Orion'},{-1,'RNG Head'},{-1,'RNG Body'},{-1,'RNG Hands'},{-1,'RNG Legs'},{-1,'RNG Feet'}},
               {{-1,'Wakido'},{-1,'SAM Head'},{-1,'SAM Body'},{-1,'SAM Hands'},{-1,'SAM Legs'},{-1,'SAM Feet'}},
               {{-1,'Hachiya'},{-1,'NIN Head'},{-1,'NIN Body'},{-1,'NIN Hands'},{-1,'NIN Legs'},{-1,'NIN Feet'}},
               {{-1,'Vishap'},{-1,'DRG Head'},{-1,'DRG Body'},{-1,'DRG Hands'},{-1,'DRG Legs'},{-1,'DRG Feet'}},
               {{-1,'Convoker\'s'},{-1,'SMN Head'},{-1,'SMN Body'},{-1,'SMN Hands'},{-1,'SMN Legs'},{-1,'SMN Feet'}},
               {{-1,'Assimilator\'s'},{-1,'BLU Head'},{-1,'BLU Body'},{-1,'BLU Hands'},{-1,'BLU Legs'},{-1,'BLU Feet'}},
               {{-1,'Laksamana\'s'},{-1,'COR Head'},{-1,'COR Body'},{-1,'COR Hands'},{-1,'COR Legs'},{-1,'COR Feet'}},
               {{-1,'Foire'},{-1,'PUP Head'},{-1,'PUP Body'},{-1,'PUP Hands'},{-1,'PUP Legs'},{-1,'PUP Feet'}},
               {{-1,'Maxixi'},{-1,'DNC Head'},{-1,'DNC Body'},{-1,'DNC Hands'},{-1,'DNC Legs'},{-1,'DNC Feet'}},
               {{-1,'Academic\'s'},{-1,'SCH Head'},{-1,'SCH Body'},{-1,'SCH Hands'},{-1,'SCH Legs'},{-1,'SCH Feet'}},
               {{-1,'Geomancy'},{-1,'GEO Head'},{-1,'GEO Body'},{-1,'GEO Hands'},{-1,'GEO Legs'},{-1,'GEO Feet'}},
               {{-1,'Runeist\'s'},{-1,'RUN Head'},{-1,'RUN Body'},{-1,'RUN Hands'},{-1,'RUN Legs'},{-1,'RUN Feet'}},
            },

            relic = {
               {{-1,'Agoge'},{-1,'WAR Head'},{-1,'WAR Body'},{-1,'WAR Hands'},{-1,'WAR Legs'},{-1,'WAR Feet'}},
               {{-1,'Hesychast\'s'},{-1,'MNK Head'},{-1,'MNK Body'},{-1,'MNK Hands'},{-1,'MNK Legs'},{-1,'MNK Feet'}},
               {{-1,'Piety'},{-1,'WHM Head'},{-1,'WHM Body'},{-1,'WHM Hands'},{-1,'WHM Legs'},{-1,'WHM Feet'}},
               {{-1,'Archmage\'s'},{-1,'BLM Head'},{-1,'BLM Body'},{-1,'BLM Hands'},{-1,'BLM Legs'},{-1,'BLM Feet'}},
               {{-1,'Vitiation'},{-1,'RDM Head'},{-1,'RDM Body'},{-1,'RDM Hands'},{-1,'RDM Legs'},{-1,'RDM Feet'}},
               {{-1,'Plunderer\'s'},{-1,'THF Head'},{-1,'THF Body'},{-1,'THF Hands'},{-1,'THF Legs'},{-1,'THF Feet'}},
               {{-1,'Caballarius'},{-1,'PLD Head'},{-1,'PLD Body'},{-1,'PLD Hands'},{-1,'PLD Legs'},{-1,'PLD Feet'}},
               {{-1,'Fallen\'s'},{-1,'DRK Head'},{-1,'DRK Body'},{-1,'DRK Hands'},{-1,'DRK Legs'},{-1,'DRK Feet'}},
               {{-1,'Ankusa'},{-1,'BST Head'},{-1,'BST Body'},{-1,'BST Hands'},{-1,'BST Legs'},{-1,'BST Feet'}},
               {{-1,'Bihu'},{-1,'BRD Head'},{-1,'BRD Body'},{-1,'BRD Hands'},{-1,'BRD Legs'},{-1,'BRD Feet'}},
               {{-1,'Arcadian'},{-1,'RNG Head'},{-1,'RNG Body'},{-1,'RNG Hands'},{-1,'RNG Legs'},{-1,'RNG Feet'}},
               {{-1,'Sakonji'},{-1,'SAM Head'},{-1,'SAM Body'},{-1,'SAM Hands'},{-1,'SAM Legs'},{-1,'SAM Feet'}},
               {{-1,'Mochizuki'},{-1,'NIN Head'},{-1,'NIN Body'},{-1,'NIN Hands'},{-1,'NIN Legs'},{-1,'NIN Feet'}},
               {{-1,'Pteroslaver'},{-1,'DRG Head'},{-1,'DRG Body'},{-1,'DRG Hands'},{-1,'DRG Legs'},{-1,'DRG Feet'}},
               {{-1,'Glyphic'},{-1,'SMN Head'},{-1,'SMN Body'},{-1,'SMN Hands'},{-1,'SMN Legs'},{-1,'SMN Feet'}},
               {{-1,'Luhlaza'},{-1,'BLU Head'},{-1,'BLU Body'},{-1,'BLU Hands'},{-1,'BLU Legs'},{-1,'BLU Feet'}},
               {{-1,'Lanun'},{-1,'COR Head'},{-1,'COR Body'},{-1,'COR Hands'},{-1,'COR Legs'},{-1,'COR Feet'}},
               {{-1,'Pitre'},{-1,'PUP Head'},{-1,'PUP Body'},{-1,'PUP Hands'},{-1,'PUP Legs'},{-1,'PUP Feet'}},
               {{-1,'Horos'},{-1,'DNC Head'},{-1,'DNC Body'},{-1,'DNC Hands'},{-1,'DNC Legs'},{-1,'DNC Feet'}},
               {{-1,'Pedagogy'},{-1,'SCH Head'},{-1,'SCH Body'},{-1,'SCH Hands'},{-1,'SCH Legs'},{-1,'SCH Feet'}},
               {{-1,'Bagua'},{-1,'GEO Head'},{-1,'GEO Body'},{-1,'GEO Hands'},{-1,'GEO Legs'},{-1,'GEO Feet'}},
               {{-1,'Futhark'},{-1,'RUN Head'},{-1,'RUN Body'},{-1,'RUN Hands'},{-1,'RUN Legs'},{-1,'RUN Feet'}},
            },

            empyrean = {
               {{-1,'Boii'},{-1,'WAR Head'},{-1,'WAR Body'},{-1,'WAR Hands'},{-1,'WAR Legs'},{-1,'WAR Feet'}},
               {{-1,'Bhikku'},{-1,'MNK Head'},{-1,'MNK Body'},{-1,'MNK Hands'},{-1,'MNK Legs'},{-1,'MNK Feet'}},
               {{-1,'Ebers'},{-1,'WHM Head'},{-1,'WHM Body'},{-1,'WHM Hands'},{-1,'WHM Legs'},{-1,'WHM Feet'}},
               {{-1,'Wicce'},{-1,'BLM Head'},{-1,'BLM Body'},{-1,'BLM Hands'},{-1,'BLM Legs'},{-1,'BLM Feet'}},
               {{-1,'Lethargy'},{-1,'RDM Head'},{-1,'RDM Body'},{-1,'RDM Hands'},{-1,'RDM Legs'},{-1,'RDM Feet'}},
               {{-1,'Sulker\'s'},{-1,'THF Head'},{-1,'THF Body'},{-1,'THF Hands'},{-1,'THF Legs'},{-1,'THF Feet'}},
               {{-1,'Chevalier\'s'},{-1,'PLD Head'},{-1,'PLD Body'},{-1,'PLD Hands'},{-1,'PLD Legs'},{-1,'PLD Feet'}},
               {{-1,'Heathen\'s'},{-1,'DRK Head'},{-1,'DRK Body'},{-1,'DRK Hands'},{-1,'DRK Legs'},{-1,'DRK Feet'}},
               {{-1,'Nukumi'},{-1,'BST Head'},{-1,'BST Body'},{-1,'BST Hands'},{-1,'BST Legs'},{-1,'BST Feet'}},
               {{-1,'Fili'},{-1,'BRD Head'},{-1,'BRD Body'},{-1,'BRD Hands'},{-1,'BRD Legs'},{-1,'BRD Feet'}},
               {{-1,'Amini'},{-1,'RNG Head'},{-1,'RNG Body'},{-1,'RNG Hands'},{-1,'RNG Legs'},{-1,'RNG Feet'}},
               {{-1,'Kasuga'},{-1,'SAM Head'},{-1,'SAM Body'},{-1,'SAM Hands'},{-1,'SAM Legs'},{-1,'SAM Feet'}},
               {{-1,'Hattori'},{-1,'NIN Head'},{-1,'NIN Body'},{-1,'NIN Hands'},{-1,'NIN Legs'},{-1,'NIN Feet'}},
               {{-1,'Peltast\'s'},{-1,'DRG Head'},{-1,'DRG Body'},{-1,'DRG Hands'},{-1,'DRG Legs'},{-1,'DRG Feet'}},
               {{-1,'Beckoner\'s'},{-1,'SMN Head'},{-1,'SMN Body'},{-1,'SMN Hands'},{-1,'SMN Legs'},{-1,'SMN Feet'}},
               {{-1,'Hashishin'},{-1,'BLU Head'},{-1,'BLU Body'},{-1,'BLU Hands'},{-1,'BLU Legs'},{-1,'BLU Feet'}},
               {{-1,'Chasseur\'s'},{-1,'COR Head'},{-1,'COR Body'},{-1,'COR Hands'},{-1,'COR Legs'},{-1,'COR Feet'}},
               {{-1,'Karagoz'},{-1,'PUP Head'},{-1,'PUP Body'},{-1,'PUP Hands'},{-1,'PUP Legs'},{-1,'PUP Feet'}},
               {{-1,'Maculele'},{-1,'DNC Head'},{-1,'DNC Body'},{-1,'DNC Hands'},{-1,'DNC Legs'},{-1,'DNC Feet'}},
               {{-1,'Arbatel'},{-1,'SCH Head'},{-1,'SCH Body'},{-1,'SCH Hands'},{-1,'SCH Legs'},{-1,'SCH Feet'}},
               {{-1,'Azimuth'},{-1,'GEO Head'},{-1,'GEO Body'},{-1,'GEO Hands'},{-1,'GEO Legs'},{-1,'GEO Feet'}},
               {{-1,'Erilaz'},{-1,'RUN Head'},{-1,'RUN Body'},{-1,'RUN Hands'},{-1,'RUN Legs'},{-1,'RUN Feet'}},
            },

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

    gear = {
        relic = {--war > run; head > feet; {+3,+2,+1,nq}
            {{23398,23063,26625,26624},{23465,23130,26801,26800},{23532,23197,26977,26976},{23599,23264,27153,27152},{23666,23331,27329,27328}},--war
            {{23399,23064,26627,26626},{23466,23131,26803,26802},{23533,23198,26979,26978},{23600,23265,27155,27154},{23667,23332,27331,27330}},--mnk
            {{23400,23065,26629,26628},{23467,23132,26805,26804},{23534,23199,26981,26980},{23601,23266,27157,27156},{23668,23333,27333,27332}},--whm
            {{23401,23066,26631,26630},{23468,23133,26807,26806},{23535,23200,26983,26982},{23602,23267,27159,27158},{23669,23334,27335,27334}},--blm
            {{23402,23067,26633,26632},{23469,23134,26809,26808},{23536,23201,26985,26984},{23603,23268,27161,27160},{23670,23335,27337,27336}},--rdm
            {{23403,23068,26635,26634},{23470,23135,26811,26810},{23537,23202,26987,26986},{23604,23269,27163,27162},{23671,23336,27339,27338}},--thf
            {{23404,23069,26637,26636},{23471,23136,26813,26812},{23538,23203,26989,26988},{23605,23270,27165,27164},{23672,23337,27341,27340}},--pld
            {{23405,23070,26639,26638},{23472,23137,26815,26814},{23539,23204,26991,26990},{23606,23271,27167,27166},{23673,23338,27343,27342}},--drk
            {{23406,23071,26641,26640},{23473,23138,26817,26816},{23540,23205,26993,26992},{23607,23272,27169,27168},{23674,23339,27345,27344}},--bst
            {{23407,23072,26643,26642},{23474,23139,26819,26818},{23541,23206,26995,26994},{23608,23273,27171,27170},{23675,23340,27347,27346}},--brd
            {{23408,23073,26645,26644},{23475,23140,26821,26820},{23542,23207,26997,26996},{23609,23274,27173,27172},{23676,23341,27349,27348}},--rng
            {{23409,23074,26647,26646},{23476,23141,26823,26822},{23543,23208,26999,26998},{23610,23275,27175,27174},{23677,23342,27351,27350}},--sam
            {{23410,23075,26649,26648},{23477,23142,26825,26824},{23544,23209,27001,27000},{23611,23276,27177,27176},{23678,23343,27353,27352}},--nin
            {{23411,23076,26651,26650},{23478,23143,26827,26826},{23545,23210,27003,27002},{23612,23277,27179,27178},{23679,23344,27355,27354}},--drg
            {{23412,23077,26653,26652},{23479,23144,26829,26828},{23546,23211,27005,27004},{23613,23278,27181,27180},{23680,23345,27357,27356}},--smn
            {{23413,23078,26655,26654},{23480,23145,26831,26830},{23547,23212,27007,27006},{23614,23279,27183,27182},{23681,23346,27359,27358}},--blu
            {{23414,23079,26657,26656},{23481,23146,26833,26832},{23548,23213,27009,27008},{23615,23280,27185,27184},{23682,23347,27361,27360}},--cor
            {{23415,23080,26659,26658},{23482,23147,26835,26834},{23549,23214,27011,27010},{23616,23281,27187,27186},{23683,23348,27363,27362}},--pup
            {{23416,23081,26661,26660},{23483,23148,26837,26836},{23550,23215,27013,27012},{23617,23282,27189,27188},{23684,23349,27365,27364}},--dnc
            {{23417,23082,26663,26662},{23484,23149,26839,26838},{23551,23216,27015,27014},{23618,23283,27191,27190},{23685,23350,27367,27366}},--sch
            {{23418,23083,26665,26664},{23485,23150,26841,26840},{23552,23217,27017,27016},{23619,23284,27193,27192},{23686,23351,27369,27368}},--geo
            {{23419,23084,26667,26666},{23486,23151,26843,26842},{23553,23218,27019,27018},{23620,23285,27195,27194},{23687,23352,27371,27370}},--run
        },

        ambu = {-- Sulevia's > Mallquis, Head > Feet, {hq2,hq1,nq}
            {{25574,25660,25659},{25790,25746,25745},{25828,25801,25800},{25879,25859,25858},{25946,25926,25925}},
            {{25576,25664,25663},{25792,25750,25749},{25830,25805,25804},{25881,25863,25862},{25948,25930,25929}},
            {{25577,25666,25665},{25793,25752,25751},{25831,25807,25806},{25882,25866,25865},{25949,25932,25931}},
            {{25575,25662,25661},{25791,25748,25747},{25829,25803,25802},{25880,25861,25860},{25947,25928,25927}},
            {{25578,25668,25667},{25794,25754,25753},{25832,25809,25808},{25883,25868,25867},{25950,25934,25933}},
            {{25569,25580,25579},{25797,25780,25779},{25835,25819,25818},{25886,25874,25873},{25953,25941,25940}},
            {{25573,25591,25590},{25796,25765,25764},{25834,25813,25812},{25885,25872,25871},{25952,25938,25937}},
            {{25570,25582,25581},{25798,25782,25781},{25836,25821,25820},{25887,25876,25875},{25954,25943,25942}},
            {{25572,25589,25588},{25795,25763,25762},{25833,25811,25810},{25884,25870,25869},{25951,25936,25935}},
            {{25571,25584,25583},{25799,25784,25783},{25837,25823,25822},{25888,25878,25877},{25955,25945,25944}},
        },
    },
};
return defaults;