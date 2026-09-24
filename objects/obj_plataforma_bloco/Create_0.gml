if (!variable_instance_exists(id, "larg")) larg = 32;
if (!variable_instance_exists(id, "alt"))  alt  = 16;

sprite_index = spr_pixel;
image_xscale = larg / sprite_get_width(spr_pixel);
image_yscale = alt / sprite_get_height(spr_pixel);
depth = -30;