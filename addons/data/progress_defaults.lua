progress_defaults = T{ --[[ Default Table and Array values, NO TOUCHY!!! ]]
    progress = {
        jobs = {0.0,0.0,0.0,0.0}, -- EXP completion, CP completion, Mastery completion, total JP holding for Oboro
        weapons ={
            relics = {0,0,0,0,0,0}, --bynes, bronze, shells, marrows, plutons, SAD crystals
            mythics = {0,0,0,0,0}, --alex,scoria,Beitetsu,HP bayld,crystals
            empyreans = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, --{chloris,glavoid,briareus,cara,fistule,kukulkan,iron plates,ulhuadshi,itzpapalotl,sobek,CC lantern,bukhis,sedna,colorless soul,dragua,orthus,apademak,isgebind,alfard,azdaja,HMP,dross,cinder,boulders,crystals}
            ambu = {
                {0,'H2H -- Karambit'},{0,'Dagger -- Tauret'},{0,'Sword -- Naegling'},{0,'GS -- Nandaka'},{0,'Axe -- Dolichenus'},
                {0,'GA -- Lycurgos'},{0,'Scythe -- Drepanum'},{0,'Polearm -- Shining One'},{0,'Katana -- Gokotai'},{0,'GK -- Hachimonji'},
                {0,'Club -- Maxentius'},{0,'Staff -- Xoanon'},{0,'Bow -- Ullr'},{0,'Grip -- Khonsu'},
            },
            ambuProgress = {0.0,},
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
                {--119+1,head > feet,{chapters,slot mat, tiger leather,gold thread,imp.silk cloth,karakul cloth,scarlet linen,gold sheet,DS sheet,Tama Hagane,}
                    {0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}},
                {},--119+2
                {},--119+3
            },
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
        },
    },
    
    prices = {
        dyna = {1200,1200,1200,1000000,2000}, --not implemented yet
    },
};
return progress_defaults;