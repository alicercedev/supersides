function scr_show_notification(texto) {
    if (!instance_exists(obj_notification_controller)){
        instance_create_layer(0, 0, "Instances", obj_notification_controller);
    }
    with (obj_notification_controller){
        notif_texto = texto;
        notif_timer = notif_duracao;
        notif_state = "SHOWING";
        notif_y_offset = -40;
    }
}