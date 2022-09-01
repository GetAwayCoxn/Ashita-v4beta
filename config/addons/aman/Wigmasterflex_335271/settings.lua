require('common');

local settings = T{ };
settings["zones"] = T{ };
settings["background"] = T{ };
settings["chests"] = T{ };
settings["chests"]["Chest O'Plenty"] = T{ };
settings["chests"]["Coffer O'Plenty"] = T{ };
settings["font_height"] = 12;
settings["font_family"] = "Arial";
settings["color"] = 4294967295;
settings["zones"][1] = "Horlais Peak";
settings["zones"][2] = "Waughroon Shrine";
settings["zones"][3] = "Balga's Dais";
settings["background"]["visible"] = true;
settings["background"]["color"] = 4278190080;
settings["position_x"] = 500;
settings["position_y"] = 500;
settings["visible"] = true;

return settings;
