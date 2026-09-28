dialog_state = "HIDDEN";
dialog_lines = [];
dialog_index = 0;

char_count = 0;
char_speed = 0.6;

choice_index = 0;
dialog_resultado = undefined;

if (!variable_global_exists("em_dialogo")){
    global.em_dialogo = false;
}
if (!variable_global_exists("dialogo_cooldown")){
    global.dialogo_cooldown = 0;
}

caixa_x = 40;
caixa_y = 460;
caixa_w = 736;
caixa_h = 140;

on_finish_callback = undefined;