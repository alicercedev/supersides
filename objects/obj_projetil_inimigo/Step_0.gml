x += hspd_p;
y += vspd_p;

image_angle += giro_spd;

var margem = 20;
if (x < obj_battle_arena.x - margem || x > obj_battle_arena.x + obj_battle_arena.largura + margem
 || y < obj_battle_arena.y - margem || y > obj_battle_arena.y + obj_battle_arena.altura + margem){
    instance_destroy();
}