var mostrar = true;
if (dano_flash > 0){
    mostrar = (dano_flash div 4) mod 2 == 0;
}

if (mostrar) draw_self();

if (global.debug_mostrar_vida){
    var bar_w = 48;
    var bar_h = 6;
    var bx = x - bar_w/2;
    var by = bbox_top - 12;

    draw_rectangle_colour(bx, by, bx + bar_w, by + bar_h, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_colour(bx, by, bx + bar_w * (hp/hp_max), by + bar_h, c_red, c_red, c_lime, c_lime, false);
}