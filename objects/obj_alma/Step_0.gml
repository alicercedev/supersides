var h = keyboard_check(vk_right) - keyboard_check(vk_left);

if (h != 0){
    hspd += h * acel;
    hspd = clamp(hspd, -spd_max, spd_max);
} else {
   
    if (hspd > 0){
        hspd = max(0, hspd - atrito);
    } else if (hspd < 0){
        hspd = min(0, hspd + atrito);
    }
}

if (!place_meeting(x + hspd, y, obj_plataforma_bloco)){
    x += hspd;
} else {
    hspd = 0;
}
x = clamp(x, obj_battle_arena.x, obj_battle_arena.x + obj_battle_arena.largura);

vspd += grav;
if (place_meeting(x, y + vspd, obj_plataforma_bloco)){
    while (!place_meeting(x, y + sign(vspd), obj_plataforma_bloco)){
        y += sign(vspd);
    }
    no_chao = (vspd > 0);
    vspd = 0;
} else {
    y += vspd;
    no_chao = false;
}

if (no_chao && keyboard_check_pressed(vk_space)){
    vspd = pulo_forca;
    no_chao = false;
}

if (invuln > 0) invuln--;

with (obj_estrela_mana){
    if (point_distance(x, y, other.x, other.y) < 24){
        global.nich_en += valor_mana;
        global.nich_en = min(global.nich_en, global.nich_men);
        instance_destroy();
    }
}

if (invuln <= 0 && place_meeting(x, y, obj_projetil_inimigo)){
    var dano_bala = global.nich_defendendo ? 2 : 5;
    global.nich_hp -= dano_bala;
    global.nich_hp = max(global.nich_hp, 0);
    invuln = 45;
}