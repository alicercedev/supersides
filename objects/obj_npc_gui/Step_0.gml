if (instance_exists(obj_nich) && !ja_conversou && !global.em_dialogo && global.dialogo_cooldown <= 0){
    var dist = point_distance(x, y, obj_nich.x, obj_nich.y);
    mostrar_dica = (dist <= distancia_interacao);
    
    if (mostrar_dica && keyboard_check_pressed(ord("Z"))){
        scr_dialog_start(scr_scene_gui(), function(resultado){
            if (resultado == "gui_entrou"){
                scr_add_party_member("Gui");
                instance_destroy();
            } else {
                ja_conversou = false;
            }
        });
    }
} else {
    mostrar_dica = false;
}