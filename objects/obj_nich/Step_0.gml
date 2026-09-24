var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down)  - keyboard_check(vk_up);

hspd = h * spd;
vspd = v * spd;

if (!place_meeting(x + hspd, y, obj_colisao)){
    x += hspd;
} else {
    while (!place_meeting(x + sign(hspd), y, obj_colisao) && hspd != 0){
        x += sign(hspd);
    }
    hspd = 0;
}

if (!place_meeting(x, y + vspd, obj_colisao)){
    y += vspd;
} else {
    while (!place_meeting(x, y + sign(vspd), obj_colisao) && vspd != 0){
        y += sign(vspd);
    }
    vspd = 0;
}

var movendo = (h != 0 || v != 0);

if (v > 0) direcao = dir.down;
if (v < 0) direcao = dir.up;
if (h < 0) { direcao = dir.left;  image_xscale = -1; }
if (h > 0) { direcao = dir.right; image_xscale = 1;  }

switch (direcao){
    case dir.down:
        sprite_index = movendo ? spr_walkdown : spr_nichdown;
        break;
    case dir.up:
    sprite_index = movendo ? spr_upwalk : spr_nichup;
    break;
    case dir.left:
    case dir.right:
        sprite_index = movendo ? spr_walkside : spr_nichsides;
        break;
}

image_speed = movendo ? 1 : 0;
if (!movendo) image_index = 0;