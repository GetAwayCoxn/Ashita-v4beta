require('common');

local settings = T{ };
settings["move"] = T{ };
settings["move"]["dragging"] = false;
settings["move"]["drag_x"] = 196;
settings["move"]["shift_down"] = false;
settings["move"]["drag_y"] = 15;
settings["scale"] = 1;
settings["padding"] = 1;
settings["party_buffs"] = false;
settings["locked"] = false;
settings["opacity"] = 1;

return settings;
