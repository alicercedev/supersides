function scr_dialog_start(lines, callback) {
    if (!instance_exists(obj_dialog_controller)){
        instance_create_layer(0, 0, "Instances", obj_dialog_controller);
    }
    with (obj_dialog_controller){
        dialog_lines = lines;
        dialog_index = 0;
        char_count = 0;
        dialog_state = "TYPING";
        on_finish_callback = callback;
    }
    global.em_dialogo = true;
}