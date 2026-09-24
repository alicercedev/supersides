
timer_troca_direcao--;
if (timer_troca_direcao <= 0){
    dir_movimento = irandom(3);
    timer_troca_direcao = irandom_range(60, 120);
}

var mx = 0, my = 0;
switch (dir_movimento){
    case 0: my =  1; break; // baixo
    case 1: my = -1; break; // cima
    case 2: mx = -1; break; // esquerda
    case 3: mx =  1; break; // direita
}


if (!place_meeting(x + mx*spd, y, obj_colisao)) x += mx*spd;
if (!place_meeting(x, y + my*spd, obj_colisao)) y += my*spd;
else timer_troca_direcao = 0;


if (mx > 0) image_xscale = 1;
if (mx < 0) image_xscale = -1;


if (place_meeting(x, y, obj_nich)){
    global.battle_tipo_forcado = tipo;
    global.nich_atk = obj_nich.atk;
    global.nich_def = obj_nich.def;
    global.nich_hp  = obj_nich.hp;
    global.nich_mhp = obj_nich.mhp;

    room_goto(rm3); // sua sala de batalha
}