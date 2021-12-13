require('common');

local settings = T{ };
settings["ids"] = T{ };
settings["ids"]["weapons"] = T{ };
settings["ids"]["weapons"]["mythic"] = T{ };
settings["ids"]["weapons"]["relic"] = T{ };
settings["ids"]["weapons"]["dynastage4"] = T{ };
settings["ids"]["weapons"]["dynastage2"] = T{ };
settings["ids"]["weapons"]["dynastage3"] = T{ };
settings["ids"]["weapons"]["aeonic"] = T{ };
settings["ids"]["weapons"]["empyrean"] = T{ };
settings["gear"] = T{ };
settings["gear"]["relic"] = T{ };
settings["gear"]["af"] = T{ };
settings["gear"]["empyrean"] = T{ };
settings["progress"] = T{ };
settings["progress"]["jobs"] = T{ };
settings["jobs"] = T{ };
settings["jobs"]["rng"] = T{ };
settings["jobs"]["rng"]["points"] = T{ };
settings["jobs"]["brd"] = T{ };
settings["jobs"]["brd"]["points"] = T{ };
settings["jobs"]["war"] = T{ };
settings["jobs"]["war"]["points"] = T{ };
settings["jobs"]["pld"] = T{ };
settings["jobs"]["pld"]["points"] = T{ };
settings["jobs"]["mnk"] = T{ };
settings["jobs"]["mnk"]["points"] = T{ };
settings["jobs"]["bst"] = T{ };
settings["jobs"]["bst"]["points"] = T{ };
settings["jobs"]["blm"] = T{ };
settings["jobs"]["blm"]["points"] = T{ };
settings["jobs"]["blu"] = T{ };
settings["jobs"]["blu"]["points"] = T{ };
settings["jobs"]["drg"] = T{ };
settings["jobs"]["drg"]["points"] = T{ };
settings["jobs"]["drk"] = T{ };
settings["jobs"]["drk"]["points"] = T{ };
settings["jobs"]["dnc"] = T{ };
settings["jobs"]["dnc"]["points"] = T{ };
settings["jobs"]["sam"] = T{ };
settings["jobs"]["sam"]["points"] = T{ };
settings["jobs"]["rdm"] = T{ };
settings["jobs"]["rdm"]["points"] = T{ };
settings["jobs"]["nin"] = T{ };
settings["jobs"]["nin"]["points"] = T{ };
settings["jobs"]["cor"] = T{ };
settings["jobs"]["cor"]["points"] = T{ };
settings["jobs"]["smn"] = T{ };
settings["jobs"]["smn"]["points"] = T{ };
settings["jobs"]["thf"] = T{ };
settings["jobs"]["thf"]["points"] = T{ };
settings["jobs"]["whm"] = T{ };
settings["jobs"]["whm"]["points"] = T{ };
settings["jobs"]["pup"] = T{ };
settings["jobs"]["pup"]["points"] = T{ };
settings["jobs"]["sch"] = T{ };
settings["jobs"]["sch"]["points"] = T{ };
settings["jobs"]["geo"] = T{ };
settings["jobs"]["geo"]["points"] = T{ };
settings["jobs"]["run"] = T{ };
settings["jobs"]["run"]["points"] = T{ };
settings["weapons"] = T{ };
settings["weapons"]["mythic"] = T{ };
settings["weapons"]["relic"] = T{ };
settings["weapons"]["aeonic"] = T{ };
settings["weapons"]["empyrean"] = T{ };
settings["weapons"]["empyrean"]["Twashtar"] = T{ };
settings["weapons"]["empyrean"]["Daurdabla"] = T{ };
settings["weapons"]["empyrean"]["Farsha"] = T{ };
settings["weapons"]["empyrean"]["Caladbolg"] = T{ };
settings["weapons"]["empyrean"]["Gandiva"] = T{ };
settings["weapons"]["empyrean"]["Ochain"] = T{ };
settings["weapons"]["empyrean"]["Rhongomiant"] = T{ };
settings["weapons"]["empyrean"]["Almace"] = T{ };
settings["weapons"]["empyrean"]["Ukonvasara"] = T{ };
settings["weapons"]["empyrean"]["Gambanteinn"] = T{ };
settings["weapons"]["empyrean"]["Redemption"] = T{ };
settings["weapons"]["empyrean"]["Masamune"] = T{ };
settings["weapons"]["empyrean"]["Armageddon"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["stage3"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["boulders"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["hmp"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["stage1"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["stage2"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["crystals"] = T{ };
settings["weapons"]["empyrean"]["Verethragna"]["rift"] = T{ };
settings["weapons"]["empyrean"]["Hvergelmir"] = T{ };
settings["weapons"]["empyrean"]["Kannagi"] = T{ };
settings["test_bool"] = T{ };
settings["progress"]["jobs"][1] = 0;
settings["progress"]["jobs"][2] = 0;
settings["progress"]["jobs"][3] = 0;
settings["progress"]["jobs"][4] = 0;
settings["jobs"]["rng"]["points"][1] = 0;
settings["jobs"]["rng"]["points"][2] = 0;
settings["jobs"]["rng"]["points"][3] = 0;
settings["jobs"]["rng"]["points"][4] = 0;
settings["jobs"]["brd"]["points"][1] = 0;
settings["jobs"]["brd"]["points"][2] = 0;
settings["jobs"]["brd"]["points"][3] = 0;
settings["jobs"]["brd"]["points"][4] = 0;
settings["jobs"]["war"]["points"][1] = 0;
settings["jobs"]["war"]["points"][2] = 0;
settings["jobs"]["war"]["points"][3] = 0;
settings["jobs"]["war"]["points"][4] = 0;
settings["jobs"]["war"]["level"] = 0;
settings["jobs"]["pld"]["points"][1] = 0;
settings["jobs"]["pld"]["points"][2] = 0;
settings["jobs"]["pld"]["points"][3] = 0;
settings["jobs"]["pld"]["points"][4] = 0;
settings["jobs"]["mnk"]["points"][1] = 0;
settings["jobs"]["mnk"]["points"][2] = 0;
settings["jobs"]["mnk"]["points"][3] = 0;
settings["jobs"]["mnk"]["points"][4] = 0;
settings["jobs"]["bst"]["points"][1] = 0;
settings["jobs"]["bst"]["points"][2] = 0;
settings["jobs"]["bst"]["points"][3] = 0;
settings["jobs"]["bst"]["points"][4] = 0;
settings["jobs"]["blm"]["points"][1] = 0;
settings["jobs"]["blm"]["points"][2] = 0;
settings["jobs"]["blm"]["points"][3] = 0;
settings["jobs"]["blm"]["points"][4] = 0;
settings["jobs"]["blu"]["points"][1] = 0;
settings["jobs"]["blu"]["points"][2] = 0;
settings["jobs"]["blu"]["points"][3] = 0;
settings["jobs"]["blu"]["points"][4] = 0;
settings["jobs"]["drg"]["points"][1] = 0;
settings["jobs"]["drg"]["points"][2] = 0;
settings["jobs"]["drg"]["points"][3] = 0;
settings["jobs"]["drg"]["points"][4] = 0;
settings["jobs"]["drk"]["points"][1] = 0;
settings["jobs"]["drk"]["points"][2] = 0;
settings["jobs"]["drk"]["points"][3] = 0;
settings["jobs"]["drk"]["points"][4] = 0;
settings["jobs"]["dnc"]["points"][1] = 0;
settings["jobs"]["dnc"]["points"][2] = 0;
settings["jobs"]["dnc"]["points"][3] = 0;
settings["jobs"]["dnc"]["points"][4] = 0;
settings["jobs"]["sam"]["points"][1] = 0;
settings["jobs"]["sam"]["points"][2] = 0;
settings["jobs"]["sam"]["points"][3] = 0;
settings["jobs"]["sam"]["points"][4] = 0;
settings["jobs"]["rdm"]["points"][1] = 0;
settings["jobs"]["rdm"]["points"][2] = 0;
settings["jobs"]["rdm"]["points"][3] = 0;
settings["jobs"]["rdm"]["points"][4] = 0;
settings["jobs"]["nin"]["points"][1] = 0;
settings["jobs"]["nin"]["points"][2] = 0;
settings["jobs"]["nin"]["points"][3] = 0;
settings["jobs"]["nin"]["points"][4] = 0;
settings["jobs"]["cor"]["points"][1] = 0;
settings["jobs"]["cor"]["points"][2] = 0;
settings["jobs"]["cor"]["points"][3] = 0;
settings["jobs"]["cor"]["points"][4] = 0;
settings["jobs"]["smn"]["points"][1] = 0;
settings["jobs"]["smn"]["points"][2] = 0;
settings["jobs"]["smn"]["points"][3] = 0;
settings["jobs"]["smn"]["points"][4] = 0;
settings["jobs"]["thf"]["points"][1] = 0;
settings["jobs"]["thf"]["points"][2] = 0;
settings["jobs"]["thf"]["points"][3] = 0;
settings["jobs"]["thf"]["points"][4] = 0;
settings["jobs"]["whm"]["points"][1] = 0;
settings["jobs"]["whm"]["points"][2] = 0;
settings["jobs"]["whm"]["points"][3] = 0;
settings["jobs"]["whm"]["points"][4] = 0;
settings["jobs"]["pup"]["points"][1] = 0;
settings["jobs"]["pup"]["points"][2] = 0;
settings["jobs"]["pup"]["points"][3] = 0;
settings["jobs"]["pup"]["points"][4] = 0;
settings["jobs"]["sch"]["points"][1] = 0;
settings["jobs"]["sch"]["points"][2] = 0;
settings["jobs"]["sch"]["points"][3] = 0;
settings["jobs"]["sch"]["points"][4] = 0;
settings["jobs"]["geo"]["points"][1] = 0;
settings["jobs"]["geo"]["points"][2] = 0;
settings["jobs"]["geo"]["points"][3] = 0;
settings["jobs"]["geo"]["points"][4] = 0;
settings["jobs"]["run"]["points"][1] = 0;
settings["jobs"]["run"]["points"][2] = 0;
settings["jobs"]["run"]["points"][3] = 0;
settings["jobs"]["run"]["points"][4] = 0;
settings["weapons"]["empyrean"]["Twashtar"][1] = false;
settings["weapons"]["empyrean"]["Daurdabla"][1] = false;
settings["weapons"]["empyrean"]["Farsha"][1] = false;
settings["weapons"]["empyrean"]["Caladbolg"][1] = false;
settings["weapons"]["empyrean"]["Gandiva"][1] = false;
settings["weapons"]["empyrean"]["Ochain"][1] = false;
settings["weapons"]["empyrean"]["Rhongomiant"][1] = false;
settings["weapons"]["empyrean"]["Almace"][1] = false;
settings["weapons"]["empyrean"]["Ukonvasara"][1] = false;
settings["weapons"]["empyrean"]["Gambanteinn"][1] = false;
settings["weapons"]["empyrean"]["Redemption"][1] = false;
settings["weapons"]["empyrean"]["Masamune"][1] = false;
settings["weapons"]["empyrean"]["Armageddon"][1] = false;
settings["weapons"]["empyrean"]["Verethragna"]["stage3"][1] = 75;
settings["weapons"]["empyrean"]["Verethragna"]["boulders"][1] = 10000;
settings["weapons"]["empyrean"]["Verethragna"]["hmp"][1] = false;
settings["weapons"]["empyrean"]["Verethragna"]["stage1"][1] = 50;
settings["weapons"]["empyrean"]["Verethragna"]["stage2"][1] = 50;
settings["weapons"]["empyrean"]["Verethragna"]["crystals"][1] = 600;
settings["weapons"]["empyrean"]["Verethragna"]["rift"][1] = 60;
settings["weapons"]["empyrean"]["Hvergelmir"][1] = false;
settings["weapons"]["empyrean"]["Kannagi"][1] = false;
settings["test_bool"][1] = true;

return settings;
