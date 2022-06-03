progress_defaults = T{ --[[ Default Table and Array values, NO TOUCHY!!! ]]
    progress = {
        jobs = {0.0,0.0,0.0}, -- EXP completion, CP completion, Mastery completion
        weapons ={
            relics = {--name,level pointer, augment rank
                {'Spharai',0,0},{'Mandau',0,0},{'Excalibur',0,0},{'Ragnarok',0,0},{'Guttler',0,0},{'Bravura',0,0},{'Apocalypse',0,0},{'Gungnir',0,0},{'Kikoku',0,0},{'Amanomurakumo',0,0},{'Mjollnir',0,0},{'Claustrum',0,0},{'Yoichinoyumi',0,0,},{'Annihilator',0,0},{'Gjallarhorn',0,0},{'Aegis',0,0},
            },
            relicsneeds = {0,0,0,0,0,0}, --bynes, bronze, shells, marrows, plutons, SAD crystals
            mythics = {--name,level pointer, augment rank
                {'Conqueror',0,0},
                {'Glanzfaust',0,0},
                {'Yagrush',0,0},
                {'Laevateinn',0,0},
                {'Murgleis',0,0},
                {'Vajra',0,0},
                {'Burtgang',0,0},
                {'Liberator',0,0},
                {'Aymur',0,0},
                {'Carnwenhan',0,0},
                {'Gastraphetes',0,0},
                {'Kogarasumaru',0,0},
                {'Nagi',0,0},
                {'Ryunohige',0,0},
                {'Nirvana',0,0},
                {'Tizona',0,0},
                {'Death Penalty',0,0},
                {'Kenkonken',0,0},
                {'Terpsichore',0,0},
                {'Tupsimati',0,0},
            },
            mythicsneeds = {0,0,0,0}, --alex,scoria,Beitetsu,crystals
            empyreans = {--name,level pointer, augment rank
                {'Verethragna',0,0},
                {'Twashtar',0,0},
                {'Almace',0,0},
                {'Caladbolg',0,0},
                {'Farsha',0,0},
                {'Ukonvasara',0,0},
                {'Redemption',0,0},
                {'Rhongomiant',0,0},
                {'Kannagi',0,0},
                {'Masamune',0,0},
                {'Gambanteinn',0,0},
                {'Hvergelmir',0,0},
                {'Gandiva',0,0},
                {'Armageddon',0,0},
                {'Daurdabla',0,0},
                {'Ochain',0,0},
            },
            empyreansneeds = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, --{chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,CC lantern,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}
            ambu = {
                {0,'H2H -- Karambit'},{0,'Dagger -- Tauret'},{0,'Sword -- Naegling'},{0,'GS -- Nandaka'},{0,'Axe -- Dolichenus'},
                {0,'GA -- Lycurgos'},{0,'Scythe -- Drepanum'},{0,'Polearm -- Shining One'},{0,'Katana -- Gokotai'},{0,'GK -- Hachimonji'},
                {0,'Club -- Maxentius'},{0,'Staff -- Xoanon'},{0,'Bow -- Ullr'},{0,'Grip -- Khonsu'},
            },
            ambuProgress = {0.0,},
            ambuWepItems = {0,0,0,0,0,0}, --voucher,nugget,gem,anima,matter,pulse,
            ergons = {
                {'Epeolatry',false,false,false,false,false,false,false,0},--Epeolatry{Name,broken rapier hilt, vial of crimson catalyst,fight, superlative runic ring of deluge, superlative runic ring of luster, superlative runic ring of vision,Epeolatry,Epeolatryafterglow,Epeolatryaumented}
                {'Idris',false,false,false,false,false,false,false,0},--Idris{Name,Rusted handbell, emblazoned handbell,fight, ripple prominence concretion,inferno concretion, cyclone concretion,Idris,Idrisafterglow,Idrisaugmented}
            },
            ergonNeeds = {26198,8600000,20000,1192},--{bayld,plasm,beitetsu,sad crystals}
        },
        gear = {
            af = {
               {{0,'WAR Head'},{0,'WAR Body'},{0,'WAR Hands'},{0,'WAR Legs'},{0,'WAR Feet'}},
               {{0,'MNK Head'},{0,'MNK Body'},{0,'MNK Hands'},{0,'MNK Legs'},{0,'MNK Feet'}},
               {{0,'WHM Head'},{0,'WHM Body'},{0,'WHM Hands'},{0,'WHM Legs'},{0,'WHM Feet'}},
               {{0,'BLM Head'},{0,'BLM Body'},{0,'BLM Hands'},{0,'BLM Legs'},{0,'BLM Feet'}},
               {{0,'RDM Head'},{0,'RDM Body'},{0,'RDM Hands'},{0,'RDM Legs'},{0,'RDM Feet'}},
               {{0,'THF Head'},{0,'THF Body'},{0,'THF Hands'},{0,'THF Legs'},{0,'THF Feet'}},
               {{0,'PLD Head'},{0,'PLD Body'},{0,'PLD Hands'},{0,'PLD Legs'},{0,'PLD Feet'}},
               {{0,'DRK Head'},{0,'DRK Body'},{0,'DRK Hands'},{0,'DRK Legs'},{0,'DRK Feet'}},
               {{0,'BST Head'},{0,'BST Body'},{0,'BST Hands'},{0,'BST Legs'},{0,'BST Feet'}},
               {{0,'BRD Head'},{0,'BRD Body'},{0,'BRD Hands'},{0,'BRD Legs'},{0,'BRD Feet'}},
               {{0,'RNG Head'},{0,'RNG Body'},{0,'RNG Hands'},{0,'RNG Legs'},{0,'RNG Feet'}},
               {{0,'SAM Head'},{0,'SAM Body'},{0,'SAM Hands'},{0,'SAM Legs'},{0,'SAM Feet'}},
               {{0,'NIN Head'},{0,'NIN Body'},{0,'NIN Hands'},{0,'NIN Legs'},{0,'NIN Feet'}},
               {{0,'DRG Head'},{0,'DRG Body'},{0,'DRG Hands'},{0,'DRG Legs'},{0,'DRG Feet'}},
               {{0,'SMN Head'},{0,'SMN Body'},{0,'SMN Hands'},{0,'SMN Legs'},{0,'SMN Feet'}},
               {{0,'BLU Head'},{0,'BLU Body'},{0,'BLU Hands'},{0,'BLU Legs'},{0,'BLU Feet'}},
               {{0,'COR Head'},{0,'COR Body'},{0,'COR Hands'},{0,'COR Legs'},{0,'COR Feet'}},
               {{0,'PUP Head'},{0,'PUP Body'},{0,'PUP Hands'},{0,'PUP Legs'},{0,'PUP Feet'}},
               {{0,'DNC Head'},{0,'DNC Body'},{0,'DNC Hands'},{0,'DNC Legs'},{0,'DNC Feet'}},
               {{0,'SCH Head'},{0,'SCH Body'},{0,'SCH Hands'},{0,'SCH Legs'},{0,'SCH Feet'}},
               {{0,'GEO Head'},{0,'GEO Body'},{0,'GEO Hands'},{0,'GEO Legs'},{0,'GEO Feet'}},
               {{0,'RUN Head'},{0,'RUN Body'},{0,'RUN Hands'},{0,'RUN Legs'},{0,'RUN Feet'}},
            },
            afneed = {
                {--109,head > feet,{chapters,slot mat, tiger leather,gold thread,imp.silk cloth,karakul cloth,scarlet linen,gold sheet,DS sheet,Tama Hagane,}
                    {0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
                {--119+1,head > feet,{chapters,slot mat, behe leather, plat silk thread, raxa, twill damask, siren's hair, ori sheet, durium sheet, dama. ingot}
                    {0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
                {--119+2,head > feet,{slot mat,S.Faulpie Leather,Cypress Log,Khoma Thread,Azure Leaf,Cyan Coral,Ruthenium Ore,Niobium Ore,}
                    {0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
                {--119+3,head > feet,{kin,kei,gin,fu,kyou,S.Faulpie Leather,Cypress Log,cypress Lbr,Khoma Thread,khoma cloth,Azure Cermet,Cyan Orb,Ruthenium Ingot,Niobium Ingot,Faulpie Leather}
                    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},
            },
            jobcards = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            afProgress = {0.0,},

            relic = {
               {{0,'WAR Head'},{0,'WAR Body'},{0,'WAR Hands'},{0,'WAR Legs'},{0,'WAR Feet'}},
               {{0,'MNK Head'},{0,'MNK Body'},{0,'MNK Hands'},{0,'MNK Legs'},{0,'MNK Feet'}},
               {{0,'WHM Head'},{0,'WHM Body'},{0,'WHM Hands'},{0,'WHM Legs'},{0,'WHM Feet'}},
               {{0,'BLM Head'},{0,'BLM Body'},{0,'BLM Hands'},{0,'BLM Legs'},{0,'BLM Feet'}},
               {{0,'RDM Head'},{0,'RDM Body'},{0,'RDM Hands'},{0,'RDM Legs'},{0,'RDM Feet'}},
               {{0,'THF Head'},{0,'THF Body'},{0,'THF Hands'},{0,'THF Legs'},{0,'THF Feet'}},
               {{0,'PLD Head'},{0,'PLD Body'},{0,'PLD Hands'},{0,'PLD Legs'},{0,'PLD Feet'}},
               {{0,'DRK Head'},{0,'DRK Body'},{0,'DRK Hands'},{0,'DRK Legs'},{0,'DRK Feet'}},
               {{0,'BST Head'},{0,'BST Body'},{0,'BST Hands'},{0,'BST Legs'},{0,'BST Feet'}},
               {{0,'BRD Head'},{0,'BRD Body'},{0,'BRD Hands'},{0,'BRD Legs'},{0,'BRD Feet'}},
               {{0,'RNG Head'},{0,'RNG Body'},{0,'RNG Hands'},{0,'RNG Legs'},{0,'RNG Feet'}},
               {{0,'SAM Head'},{0,'SAM Body'},{0,'SAM Hands'},{0,'SAM Legs'},{0,'SAM Feet'}},
               {{0,'NIN Head'},{0,'NIN Body'},{0,'NIN Hands'},{0,'NIN Legs'},{0,'NIN Feet'}},
               {{0,'DRG Head'},{0,'DRG Body'},{0,'DRG Hands'},{0,'DRG Legs'},{0,'DRG Feet'}},
               {{0,'SMN Head'},{0,'SMN Body'},{0,'SMN Hands'},{0,'SMN Legs'},{0,'SMN Feet'}},
               {{0,'BLU Head'},{0,'BLU Body'},{0,'BLU Hands'},{0,'BLU Legs'},{0,'BLU Feet'}},
               {{0,'COR Head'},{0,'COR Body'},{0,'COR Hands'},{0,'COR Legs'},{0,'COR Feet'}},
               {{0,'PUP Head'},{0,'PUP Body'},{0,'PUP Hands'},{0,'PUP Legs'},{0,'PUP Feet'}},
               {{0,'DNC Head'},{0,'DNC Body'},{0,'DNC Hands'},{0,'DNC Legs'},{0,'DNC Feet'}},
               {{0,'SCH Head'},{0,'SCH Body'},{0,'SCH Hands'},{0,'SCH Legs'},{0,'SCH Feet'}},
               {{0,'GEO Head'},{0,'GEO Body'},{0,'GEO Hands'},{0,'GEO Legs'},{0,'GEO Feet'}},
               {{0,'RUN Head'},{0,'RUN Body'},{0,'RUN Hands'},{0,'RUN Legs'},{0,'RUN Feet'}},
            },
            relicneed = {
                {0,0,0,0,0},-- nq + 2, {thoughts,hopes,touches,journey,steps}
                {--109,head > feet,{chapters,slot mat,wootze ore,griffon hide,sparkling stone,mammoth tusk,relic iron,lancewood log,}
                    {0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
                {--119+1,head > feet,{chapters,slot mat,voidwrought plate,kaggen's cuticle,akvan's pennon,pil's tuille,hahava's mail,celaeno's cloth'}
                        {0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
                {--119+2,head > feet,{slot mat,S.Faulpie Leather,Cypress Log,Khoma Thread,Azure Leaf,Cyan Coral,Ruthenium Ore,Niobium Ore,}
                    {0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},
                {--119+3,war > run,head > feet,{shard,void,slot}
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},
                    {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},},
            },
            relicProgress = {0.0,},

            empyrean = {
               {{0,'WAR Head'},{0,'WAR Body'},{0,'WAR Hands'},{0,'WAR Legs'},{0,'WAR Feet'}},
               {{0,'MNK Head'},{0,'MNK Body'},{0,'MNK Hands'},{0,'MNK Legs'},{0,'MNK Feet'}},
               {{0,'WHM Head'},{0,'WHM Body'},{0,'WHM Hands'},{0,'WHM Legs'},{0,'WHM Feet'}},
               {{0,'BLM Head'},{0,'BLM Body'},{0,'BLM Hands'},{0,'BLM Legs'},{0,'BLM Feet'}},
               {{0,'RDM Head'},{0,'RDM Body'},{0,'RDM Hands'},{0,'RDM Legs'},{0,'RDM Feet'}},
               {{0,'THF Head'},{0,'THF Body'},{0,'THF Hands'},{0,'THF Legs'},{0,'THF Feet'}},
               {{0,'PLD Head'},{0,'PLD Body'},{0,'PLD Hands'},{0,'PLD Legs'},{0,'PLD Feet'}},
               {{0,'DRK Head'},{0,'DRK Body'},{0,'DRK Hands'},{0,'DRK Legs'},{0,'DRK Feet'}},
               {{0,'BST Head'},{0,'BST Body'},{0,'BST Hands'},{0,'BST Legs'},{0,'BST Feet'}},
               {{0,'BRD Head'},{0,'BRD Body'},{0,'BRD Hands'},{0,'BRD Legs'},{0,'BRD Feet'}},
               {{0,'RNG Head'},{0,'RNG Body'},{0,'RNG Hands'},{0,'RNG Legs'},{0,'RNG Feet'}},
               {{0,'SAM Head'},{0,'SAM Body'},{0,'SAM Hands'},{0,'SAM Legs'},{0,'SAM Feet'}},
               {{0,'NIN Head'},{0,'NIN Body'},{0,'NIN Hands'},{0,'NIN Legs'},{0,'NIN Feet'}},
               {{0,'DRG Head'},{0,'DRG Body'},{0,'DRG Hands'},{0,'DRG Legs'},{0,'DRG Feet'}},
               {{0,'SMN Head'},{0,'SMN Body'},{0,'SMN Hands'},{0,'SMN Legs'},{0,'SMN Feet'}},
               {{0,'BLU Head'},{0,'BLU Body'},{0,'BLU Hands'},{0,'BLU Legs'},{0,'BLU Feet'}},
               {{0,'COR Head'},{0,'COR Body'},{0,'COR Hands'},{0,'COR Legs'},{0,'COR Feet'}},
               {{0,'PUP Head'},{0,'PUP Body'},{0,'PUP Hands'},{0,'PUP Legs'},{0,'PUP Feet'}},
               {{0,'DNC Head'},{0,'DNC Body'},{0,'DNC Hands'},{0,'DNC Legs'},{0,'DNC Feet'}},
               {{0,'SCH Head'},{0,'SCH Body'},{0,'SCH Hands'},{0,'SCH Legs'},{0,'SCH Feet'}},
               {{0,'GEO Head'},{0,'GEO Body'},{0,'GEO Hands'},{0,'GEO Legs'},{0,'GEO Feet'}},
               {{0,'RUN Head'},{0,'RUN Body'},{0,'RUN Hands'},{0,'RUN Legs'},{0,'RUN Feet'}},
            },
            empyneed = {
                {{0,0,0,0,},{0,0,0,0,},{0,0,0,0,},{0,0,0,0,},{0,0,0,0,}},-- +2 head > feet; {stone,jewel,coin,card}
                {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},-- 109 head > feet; {chapters,slot mat,briareus,itzpapalotl,orthus,glavoid,lanterns,alfard,kukulkan,cara,dragua,ulhuadshi,apademak,bukhis,azdaja,isgebind,sobek,chloris,sedna}
                {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}},-- 109 head > feet; {chapters,slot mat,etched memories}
            },
            empyProgress = {0.0,},

            ambu = {
               {{0,'S Head'},{0,'S Body'},{0,'S Hands'},{0,'S Legs'},{0,'S Feet'}},
               {{0,'H Head'},{0,'H Body'},{0,'H Hands'},{0,'H Legs'},{0,'H Feet'}},
               {{0,'I Head'},{0,'I Body'},{0,'I Hands'},{0,'I Legs'},{0,'I Feet'}},
               {{0,'Meg Head'},{0,'Meg Body'},{0,'Meg Hands'},{0,'Meg Legs'},{0,'Meg Feet'}},
               {{0,'J Head'},{0,'J Body'},{0,'J Hands'},{0,'J Legs'},{0,'J Feet'}},
               {{0,'F Head'},{0,'F Body'},{0,'F Hands'},{0,'F Legs'},{0,'F Feet'}},
               {{0,'T Head'},{0,'T Body'},{0,'T Hands'},{0,'T Legs'},{0,'T Feet'}},
               {{0,'Mu Head'},{0,'Mu Body'},{0,'Mu Hands'},{0,'Mu Legs'},{0,'Mu Feet'}},
               {{0,'A Head'},{0,'A Body'},{0,'A Hands'},{0,'A Legs'},{0,'A Feet'}},
               {{0,'Mal Head'},{0,'Mal Body'},{0,'Mal Hands'},{0,'Mal Legs'},{0,'Mal Feet'}},
            },
            ambuProgress = {0.0,},

            unm = {
                scale = {{'Buramgh',false,false,false,0,0,0},{'Emeici',false,false,false,0,0,0},{'Kunimune',false,false,false,0,0,0},{'Tancho',false,false,false,0,0,0},{'Pouwhenua',false,false,false,0,0,0},{'Mengado',false,false,false,0,0,0},{'Wingcutter',false,false,false,0,0,0},{'Evalach',false,false,false,0,0,0},{'Refined Grip',false,false,false,0,0,0},{'Imperial Wing Hairpin',false,false,false,0,0,0},{'Agony Jerkin',false,false,false,0,0,0},{'Lugra Cloak',false,false,false,0,0,0},{'Rosette Jaseran',false,false,false,0,0,0},{'Macabre Gauntlets',false,false,false,0,0,0},{'Shigure Tekko',false,false,false,0,0,0},{'Assiduity Pants',false,false,false,0,0,0},{'Augury Cuisses',false,false,false,0,0,0},{'Zoar Subligar',false,false,false,0,0,0},{'Hippomenes Socks',false,false,false,0,0,0},{'Regal Pumps',false,false,false,0,0,0},{'Acuity Belt',false,false,false,0,0,0},{'Apeile Ring',false,false,false,0,0,0},{'Arete del Luna',false,false,false,0,0,0},{'Canto Necklace',false,false,false,0,0,0},{'Gelatinous Ring',false,false,false,0,0,0},{'Handler\'s Earring',false,false,false,0,0,0},{'Lugra Earring',false,false,false,0,0,0},{'Metamorph Ring',false,false,false,0,0,0},{'Nourishing Earring',false,false,false,0,0,0},{'Sailfi Belt',false,false,false,0,0,0},{'Shinjutsu-no-Obi',false,false,false,0,0,0},{'Unmoving Collar',false,false,false,0,0,0},},--{Name,tracked,completed,HQhas,rank,needed mats, gil est}
                hide = {{'Hide',false,false,false,0,0,0},},
                wing = {{'Wing',false,false,false,0,0,0},},
            },
        },
    },
    
    prices = {
        dyna1 = {0,0,0}, -- Bynes, Bronze, Shells
        rocks = {0,0,0}, --Pluton, Boulders, Beitetsu
        misc1 = {0,0,0}, --Marrow, scoria, HMP
        rifts = {0,0}, --Cinders,Dross
        misc2 = {0,0}, --HP Bayld, Sad Crystals
    },

    points = {
        hallmarks = {
            nuggets = {false, 7500},
            gems = {false, 10000},
            animas = {false, 15000},
            matters = {false, 20000},
            threads = {false, 4000},
            dusts = {false, 4000},
            saps = {false, 4000},
            dyes = {false, 12000},
            resins = {false, 15000},
            bynes1 = {false, 3000},
            bynes2 = {false, 4000},
            bronze1 = {false, 3000},
            bronze2 = {false, 4000},
            shells1 = {false, 3000},
            shells2 = {false, 4000},
            marrows = {false, 60000},
            scorias = {false, 50000},
            drosses = {false, 4500},
            cinders = {false, 4500},
            plutons = {false, 25000},
            boulders = {false, 25000},
            beitetsu = {false, 25000},
            baylds = {false, 26250},
            hmp = {false, 20000},
            alex = {false, 26250},
        },
        gallantry = {
            nuggets = {false, 12500},
            gems = {false, 17500},
            animas = {false, 22500},
            matters = {false, 27500},
            threads = {false, 2000},
            dusts = {false, 2000},
            saps = {false, 2000},
            dyes = {false, 4000},
            resins = {false, 7500},
            needles = {false, 2000},
            bynes1 = {false, 1500},
            bynes2 = {false, 2000},
            bronze1 = {false, 1500},
            bronze2 = {false, 2000},
            shells1 = {false, 1500},
            shells2 = {false, 2000},
            marrows = {false, 30000},
            scorias = {false, 50000},
            drosses = {false, 3000},
            cinders = {false, 3000},
            plutons = {false, 12500},
            boulders = {false, 12500},
            beitetsu = {false, 12500},
            baylds = {false, 13125},
            hmp = {false, 10000},
            alex = {false, 13125},
            month = {0, 0},
        },
    },
};
return progress_defaults;