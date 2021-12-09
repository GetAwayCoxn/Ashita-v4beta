require('common');

local settings = T{ };
settings["clocks"] = T{ };
settings["clocks"][1] = T{ };
settings["clocks"][2] = T{ };
settings["font"] = T{ };
settings["font"]["background"] = T{ };
settings["clocks"][1][1] = "CST";
settings["clocks"][1][2] = -6;
settings["clocks"][2][1] = "JST";
settings["clocks"][2][2] = 9;
settings["format"] = "[%I:%M:%S]";
settings["font"]["font_height"] = 12;
settings["font"]["font_family"] = "Arial";
settings["font"]["color"] = 4294967295;
settings["font"]["visible"] = true;
settings["font"]["background"]["visible"] = true;
settings["font"]["background"]["color"] = 2147483648;
settings["font"]["position_y"] = 1064;
settings["font"]["position_x"] = 1495;
settings["separator"] = " - ";

return settings;
