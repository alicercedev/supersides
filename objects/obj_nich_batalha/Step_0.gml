if (obj_battle_controller.state == BattleState.DERROTA && estado_anim != "morto"){
    estado_anim = "morto";
    sprite_index = spr_nich_morto;
    image_speed = 0;
    image_index = 0;
    visible = true;
}
else if (obj_battle_controller.state == BattleState.VITORIA && estado_anim != "vitoria" && estado_anim != "morto"){
    estado_anim = "vitoria";
    sprite_index = spr_nich_vitoria;
    image_speed = 0;
    image_index = 0;
    visible = true;
}
else {
    if (global.nich_hp < hp_anterior){
        piscando = 40;
    }

    switch (estado_anim){

        case "idle":
            if (variable_global_exists("nich_defendendo") && global.nich_defendendo){
                estado_anim = "defendendo";
                sprite_index = spr_nich_defesa;
                image_speed = 0;
                image_index = 0;
            }
            else if (variable_global_exists("nich_usando_item") && global.nich_usando_item){
                estado_anim = "item";
                sprite_index = spr_nich_item;
                image_speed = 1;
                image_index = 0;
            }
            else if (variable_global_exists("nich_conjurando") && global.nich_conjurando){
                estado_anim = "conjurando";
                sprite_index = spr_nich_fogo;
                image_speed = 1;
                image_index = 0;
            }
            else if (variable_global_exists("nich_atacando") && global.nich_atacando){
                estado_anim = "atacando";
                sprite_index = spr_nich_atk;
                image_speed = 1;
                image_index = 0;
            }
            else if (piscando > 0){
                estado_anim = "dano";
                sprite_index = spr_nich_dano;
                image_speed = 1;
                image_index = 0;
                vspd_nich = -4; // impulso do pulinho, só na entrada desse estado
            }
            break;

        case "defendendo":
            if (!global.nich_defendendo){
                estado_anim = "idle";
                sprite_index = spr_nich_idle;
                image_speed = 1;
                image_index = 0;
            }
            break;

        case "item":
            if (image_index >= image_number - 1){
                estado_anim = "idle";
                sprite_index = spr_nich_idle;
                image_speed = 1;
                image_index = 0;
                global.nich_usando_item = false;
            }
            break;

        case "atacando":
            if (image_index >= image_number - 1){
                estado_anim = "idle";
                sprite_index = spr_nich_idle;
                image_speed = 1;
                image_index = 0;
                global.nich_atacando = false;
            }
            break;

        case "conjurando":
            if (image_index >= image_number - 1){
                estado_anim = "idle";
                sprite_index = spr_nich_idle;
                image_speed = 1;
                image_index = 0;
                global.nich_conjurando = false;
            }
            break;

        case "dano":
            if (piscando <= 0){
                estado_anim = "idle";
                sprite_index = spr_nich_idle;
                image_speed = 1;
                image_index = 0;
            }
            break;
    }
}

if (y < y_base || vspd_nich != 0){
    y += vspd_nich;
    vspd_nich += gravidade_nich;

    if (y >= y_base){
        y = y_base;
        vspd_nich = 0;
    }
}

if (piscando > 0){
    piscando--;
    visible = (piscando div 4) mod 2 == 0;
} else {
    visible = true;
}

hp_anterior = global.nich_hp;