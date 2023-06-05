require('common');

local settings = T{ };
settings["menu_holders"] = T{ };
settings["is_open"] = T{ };
settings["size"] = T{ };
settings["text_color"] = T{ };
settings["stopOnLucky"] = T{ };
settings["menu_holders"][1] = -1;
settings["menu_holders"][2] = -1;
settings["is_open"][1] = false;
settings["size"][1] = 400;
settings["size"][2] = 200;
settings["text_color"][1] = 1;
settings["text_color"][2] = 0.75;
settings["text_color"][3] = 0.25;
settings["text_color"][4] = 1;
settings["enabled"] = "Disabled";
settings["stopOnLucky"][1] = true;

return settings;
