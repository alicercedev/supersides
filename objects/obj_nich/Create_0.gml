spd = 3;

hspd = 0;
vspd = 0;

enum dir {
    down,
    up,
    left,
    right
}
direcao = dir.down;

// stats de combate
hp  = 80;
mhp = 80;
en  = 40;
men = 40;
atk = 6;
def = 5;
agl = 1;
cri = 20;

// se já existir HP salvo de uma batalha anterior, usa ele em vez do valor cheio :P
if (variable_global_exists("nich_hp")) hp = global.nich_hp;
if (variable_global_exists("nich_en")) en = global.nich_en;

sprite_index = spr_nichdown;