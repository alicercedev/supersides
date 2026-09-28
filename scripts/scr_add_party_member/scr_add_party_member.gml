function scr_add_party_member(nome) {
    if (!variable_global_exists("party")){
        global.party = [];
    }
    
    if (!array_contains(global.party, nome)){
        array_push(global.party, nome);
        
        if (nome == "Gui" && instance_exists(obj_nich)){
            instance_create_layer(obj_nich.x, obj_nich.y, "Instances", obj_gui);
        }
        
        scr_show_notification(nome + " se juntou à equipe!");
    }
}