if (place_meeting(x, y, obj_nich)){
    global.battle_tipo_forcado = tipo;

    global.nich_atk = obj_nich.atk;
    global.nich_def = obj_nich.def;
    global.nich_hp  = obj_nich.hp;
    global.nich_mhp = obj_nich.mhp;
    global.nich_en  = obj_nich.en;
    global.nich_men = obj_nich.men;

    room_goto(Room2);
}