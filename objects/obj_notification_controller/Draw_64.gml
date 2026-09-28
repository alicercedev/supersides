if (notif_state == "SHOWING"){
    draw_set_font(fnt_battle);
    
    var caixa_w = string_width(notif_texto) + 40;
    var caixa_h = 40;
    var caixa_x = (display_get_gui_width() - caixa_w) / 2;
    var caixa_y = 30 + notif_y_offset;
    
    draw_set_color(c_black);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, false);
    draw_set_color(c_yellow);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, true);
    
    draw_set_color(c_white);
    draw_text(caixa_x + 20, caixa_y + 12, notif_texto);
    draw_set_color(c_white);
}