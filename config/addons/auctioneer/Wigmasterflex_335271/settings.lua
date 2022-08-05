require('common');

local settings = T{ };
settings["background"] = T{ };
settings["auction_list"] = T{ };
settings["font_height"] = 12;
settings["font_family"] = "Futura";
<<<<<<< Updated upstream
settings["position_y"] = 700;
=======
settings["position_x"] = 700;
>>>>>>> Stashed changes
settings["color"] = 4294967295;
settings["visible"] = true;
settings["background"]["visible"] = true;
settings["background"]["color"] = 4278190080;
settings["auction_list"]["price"] = true;
settings["auction_list"]["visibility"] = false;
settings["auction_list"]["empty"] = false;
settings["auction_list"]["date"] = true;
settings["auction_list"]["timer"] = true;
settings["auction_list"]["slot"] = true;
settings["position_x"] = 700;

return settings;
