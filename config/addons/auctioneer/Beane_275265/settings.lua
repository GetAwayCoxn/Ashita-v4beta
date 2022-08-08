require('common');

local settings = T{ };
settings["background"] = T{ };
settings["auction_list"] = T{ };
settings["font_height"] = 12;
settings["font_family"] = "Arial";
settings["position_x"] = 695;
settings["color"] = 4294967295;
settings["visible"] = true;
settings["background"]["visible"] = true;
settings["background"]["color"] = 4278190080;
settings["auction_list"]["price"] = true;
settings["auction_list"]["visibility"] = true;
settings["auction_list"]["empty"] = false;
settings["auction_list"]["date"] = true;
settings["auction_list"]["slot"] = true;
settings["auction_list"]["timer"] = true;
settings["position_y"] = 633;

return settings;
