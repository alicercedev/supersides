sprite_index = spr_nichmaligno;
image_xscale = 0.8;
image_yscale = 0.8;
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