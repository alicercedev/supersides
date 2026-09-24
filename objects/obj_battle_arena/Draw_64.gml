draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

draw_set_color(c_black);
draw_rectangle(x, y, x + largura, y + altura, false);
draw_set_color(c_red);
draw_rectangle(x, y, x + largura, y + altura, true);