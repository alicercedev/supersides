if (notif_state == "SHOWING"){
    notif_timer--;
    
    if (notif_timer > notif_duracao - 15){
        notif_y_offset = lerp(notif_y_offset, 0, 0.3);
    } else if (notif_timer < 15){
        notif_y_offset = lerp(notif_y_offset, -40, 0.3);
    }
    
    if (notif_timer <= 0){
        notif_state = "HIDDEN";
        notif_y_offset = -40;
    }
}