if (instance_exists(obj_nich)){
    var dist = point_distance(x, y, obj_nich.x, obj_nich.y);
    mostrar_dica = (dist <= distancia_interacao);
    
    if (mostrar_dica && keyboard_check_pressed(ord("Z"))){
        global.room_anterior = room;
        room_goto(rm_loja);
    }
}