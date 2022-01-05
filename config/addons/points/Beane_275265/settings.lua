require('common');

local settings = T{ };
settings["bg_color"] = T{ };
settings["bg_border_color"] = T{ };
settings["compact"] = T{ };
settings["compact"]["font"] = T{ };
settings["font_scale"] = 1;
settings["use_compact"] = false;
settings["num_separator"] = "";
settings["bg_color"][1] = 0.080000000000000002;
settings["bg_color"][2] = 0.080000000000000002;
settings["bg_color"][3] = 0.080000000000000002;
settings["bg_color"][4] = 0.80000000000000004;
settings["token_order_voidwatch"] = "[VWRed] [VWBlue] [VWGreen] [VWYellow] [VWWhite]";
settings["theme"] = "default";
settings["rate_reset_timer"] = 600;
settings["bg_border_color"][1] = 0.68999999999999995;
settings["bg_border_color"][2] = 0.68000000000000005;
settings["bg_border_color"][3] = 0.78000000000000003;
settings["bg_border_color"][4] = 1;
settings["token_order_abyssea"] = "[Pearl] [Azure] [Ruby] [Amber] [Gold] [Silver] [Ebon] [DIV] [EventTimer]";
settings["bar_x"] = 130;
settings["token_order_nyzul"] = "[NyzulFloor] [DIV] [NyzulObjective] [DIV] [EventTimer]";
settings["compact_divider"] = "|";
settings["token_order_default"] = "[XP] [Merits] [XPHour] [XPChain] [DIV] [CP] [JP] [JPHour] [CPChain] [DIV] [Sparks] [DIV] [Accolades]";
settings["token_order_mastered"] = "[EP] [EPHour] [EPChain] [DIV] [CP] [JP] [JPHour] [CPChain] [DIV] [Sparks] [DIV] [Accolades]";
settings["bar_divider"] = "";
settings["bar_y"] = 15;
settings["decimal"] = ".";
settings["compact"]["hPadding"] = 8;
settings["compact"]["x"] = 0;
settings["compact"]["font"]["visible"] = true;
settings["compact"]["font"]["font_family"] = "Tahoma";
settings["compact"]["font"]["font_height"] = 11;
settings["compact"]["font"]["color"] = 4294967295;
settings["compact"]["y"] = -17;
settings["token_order_assault"] = "[AssaultObjective] [DIV] [EventTimer]";
settings["token_order_dynamis"] = "[DynamisKI] [DIV] [EventTimer]";

return settings;
