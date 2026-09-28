switch (state){
    case ShopState.MENU:
        if (keyboard_check_pressed(vk_down)) opcao++;
        if (keyboard_check_pressed(vk_up)) opcao--;
        opcao = clamp(opcao, 0, array_length(opcoes_menu) - 1);
        
        if (keyboard_check_pressed(ord("Z"))){
            switch (opcao){
                case 0: // Comprar
                    state = ShopState.COMPRAR;
                    scr_vendedor(fala_atras_do_que);
                    break;
                case 1: // Vender
                    state = ShopState.VENDER;
                    scr_vendedor(fala_vender);
                    break;
                case 2: // Conversar
                    state = ShopState.CONVERSAR;
                    break;
                case 3: // Sair
                    scr_vendedor(fala_despedida);
                    if (variable_global_exists("room_anterior")){
                        room_goto(global.room_anterior);
                    } else {
                        room_goto(Room1);
                    }
                    break;
            }
        }
        break;
        
    case ShopState.COMPRAR:
        if (keyboard_check_pressed(vk_down)) opcao_item++;
        if (keyboard_check_pressed(vk_up)) opcao_item--;
        opcao_item = clamp(opcao_item, 0, array_length(itens_loja) - 1);
        
        if (keyboard_check_pressed(ord("Z"))){
            scr_vendedor(fala_comprar);
        }
        
        if (keyboard_check_pressed(vk_backspace)){
            state = ShopState.MENU;
            opcao_item = 0;
        }
        break;
        
    case ShopState.VENDER:
        if (keyboard_check_pressed(vk_backspace)){
            state = ShopState.MENU;
        }
        break;
        
    case ShopState.CONVERSAR:
        if (keyboard_check_pressed(vk_backspace)){
            state = ShopState.MENU;
        }
        break;
}


switch (balao_state){
    case BalaoState.GROWING:
    fala_char_count += fala_char_speed;
    if (fala_char_count >= string_length(fala_atual)){
        fala_char_count = string_length(fala_atual);
        balao_state = BalaoState.SHOWING;
        fala_timer = fala_duracao;
    }
    break;
        
    case BalaoState.SHOWING:
        fala_timer--;
        if (fala_timer <= 0){
            balao_state = BalaoState.SHRINKING;
        }
        break;
        
    case BalaoState.SHRINKING:
        fala_char_count -= fala_char_speed;
        if (fala_char_count <= 0){
            fala_char_count = 0;
            balao_state = BalaoState.HIDDEN;
        }
        break;
}