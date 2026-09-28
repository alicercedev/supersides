sprite_index = spr_mini_nich;
image_xscale = 4.5;
image_yscale = 4.5;
depth = -100;

hspd = 0;
acel = 0.4;
atrito = 0.25;
spd_max = 2.5;

grav = 0.3;
vspd = 0;
pulo_forca = -8.5;
no_chao = false;
invuln = 0;

while (!place_meeting(x, y + 1, obj_plataforma_bloco) && y < room_height){
    y += 1;
}
no_chao = true;
vspd = 0;