if (global.dialogo_cooldown > 0){
    global.dialogo_cooldown--;
}

if (dialog_state == "TYPING"){
    var linha_atual = dialog_lines[dialog_index];
    
    if (linha_atual.texto == "" && variable_struct_exists(linha_atual, "choices")){
        dialog_state = "CHOOSING";
        choice_index = 0;
    } else {
        char_count += char_speed;
        if (char_count >= string_length(linha_atual.texto)){
            char_count = string_length(linha_atual.texto);
            dialog_state = "WAITING";
        }
        
        if (keyboard_check_pressed(ord("Z"))){
            char_count = string_length(linha_atual.texto);
            dialog_state = "WAITING";
        }
    }
}
else if (dialog_state == "WAITING"){
    if (keyboard_check_pressed(ord("Z"))){
        var linha_atual = dialog_lines[dialog_index];
        
        if (variable_struct_exists(linha_atual, "choices")){
            dialog_state = "CHOOSING";
            choice_index = 0;
        } else {
            avancar_dialogo();
        }
    }
}
else if (dialog_state == "CHOOSING"){
    var linha_atual = dialog_lines[dialog_index];
    
    if (!variable_struct_exists(linha_atual, "choices")){
        avancar_dialogo();
        exit;
    }
    
    var n_choices = array_length(linha_atual.choices);
    
    if (keyboard_check_pressed(vk_down)) choice_index++;
    if (keyboard_check_pressed(vk_up)) choice_index--;
    choice_index = clamp(choice_index, 0, n_choices - 1);
    
    if (keyboard_check_pressed(ord("Z"))){
        var escolha = linha_atual.choices[choice_index];
        
        if (variable_struct_exists(escolha, "resultado")){
            dialog_resultado = escolha.resultado;
        }
        
        if (variable_struct_exists(escolha, "next_lines")){
            dialog_lines = escolha.next_lines;
            dialog_index = 0;
            char_count = 0;
            dialog_state = "TYPING";
        } else {
            encerrar_dialogo();
        }
    }
}

function avancar_dialogo(){
    dialog_index++;
    if (dialog_index >= array_length(dialog_lines)){
        encerrar_dialogo();
    } else {
        char_count = 0;
        dialog_state = "TYPING";
    }
}

function encerrar_dialogo(){
    dialog_state = "HIDDEN";
    global.em_dialogo = false;
    global.dialogo_cooldown = 10;
    var resultado_final = dialog_resultado;
    dialog_resultado = undefined;
    if (on_finish_callback != undefined){
        on_finish_callback(resultado_final);
    }
}