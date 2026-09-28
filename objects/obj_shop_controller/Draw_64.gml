draw_set_font(fnt_battle);

var cursor_tamanho = 40;
var cursor_escala = cursor_tamanho / sprite_get_width(spr_curso);


draw_sprite_ext(spr_vendedor, 0, 320, 339, 4.9, 5, 0, c_white, 1);


if (balao_state != BalaoState.HIDDEN){
    var char_count = floor(fala_char_count);
    var texto_visivel = string_copy(fala_atual, 1, char_count);
    
    var w = max(string_width(texto_visivel) + balao_padding*2, balao_min_size);
    var h = string_height(texto_visivel) + balao_padding;
    
    var x1 = balao_anchor_x;
    var y1 = balao_anchor_y;
    var x2 = x1 + w;
    var y2 = y1 + h;
    
    var raio = h * 0.5;
    
    draw_set_color(c_white);

    draw_rectangle(x1 + raio, y1, x2 - raio, y2, false);

    draw_circle(x1 + raio, y1 + raio, raio, false);

    draw_circle(x2 - raio, y1 + raio, raio, false);
    
    draw_set_color(c_black);
    draw_text(x1 + balao_padding, y1 + balao_padding*0.5, texto_visivel);
    draw_set_color(c_white);
}
   

var menu_caixa_x = 550;
var menu_caixa_y = 400;
var menu_caixa_w = 240;
var menu_caixa_h = array_length(opcoes_menu) * 50 + 20;

draw_set_color(c_black);
draw_rectangle(menu_caixa_x, menu_caixa_y, menu_caixa_x + menu_caixa_w, menu_caixa_y + menu_caixa_h, false);
draw_set_color(c_white);
draw_rectangle(menu_caixa_x, menu_caixa_y, menu_caixa_x + menu_caixa_w, menu_caixa_y + menu_caixa_h, true);
draw_set_color(c_white);


var cursor_x = 560;
var texto_x = 600;
var cursor_y = 0;
var linha_h = 50;

for (var i = 0; i < array_length(opcoes_menu); i++){
    var y_pos = 420 + i*linha_h;
    var cor_ativa;
    if (state == ShopState.MENU && i == opcao) {
        cor_ativa = c_yellow;
    } else if (state != ShopState.MENU) {
        cor_ativa = c_gray;
    } else {
        cor_ativa = c_white;
    }
    draw_set_color(cor_ativa);
    draw_text_transformed(texto_x, y_pos, opcoes_menu[i], 1.1, 1.1, 0);
    if (state == ShopState.MENU && i == opcao) cursor_y = y_pos;
}
draw_set_color(c_white);

if (state == ShopState.MENU){
    draw_sprite_ext(spr_curso, 0, cursor_x, cursor_y + 8, cursor_escala, cursor_escala, 0, c_white, 1);
}


if (state == ShopState.COMPRAR){
    var caixa_x = 560;
    var caixa_w = 220;
    var caixa_h = array_length(itens_loja) * 36 + 20;
    var caixa_y = menu_caixa_y - caixa_h - 10;
    
    draw_set_color(c_black);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, false);
    draw_set_color(c_white);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, true);
    
    for (var i = 0; i < array_length(itens_loja); i++){
        draw_set_color((i == opcao_item) ? c_yellow : c_white);
        draw_text(caixa_x + 15, caixa_y + 15 + i*36, itens_loja[i] + " - " + string(precos_loja[i]) + "G");
    }
    draw_set_color(c_white);
    
    draw_sprite_ext(spr_curso, 0, caixa_x - 20, caixa_y + 15 + opcao_item*36 + 8, cursor_escala, cursor_escala, 0, c_white, 1);
}

if (state == ShopState.VENDER){
    draw_set_color(c_black);
    draw_rectangle(560, 280, 780, 460, false);
    draw_set_color(c_white);
    draw_rectangle(560, 280, 780, 460, true);
    draw_text(580, 300, "Sistema de vender - em breve");
}

if (state == ShopState.CONVERSAR){
    draw_set_color(c_black);
    draw_rectangle(560, 280, 780, 460, false);
    draw_set_color(c_white);
    draw_rectangle(560, 280, 780, 460, true);
    draw_text(580, 300, "Nada de novo por aqui...");
}