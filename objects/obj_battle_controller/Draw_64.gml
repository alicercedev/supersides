draw_set_font(fnt_battle);
draw_set_color(c_white);
draw_text(20, 20, "Nich HP: " + string(global.nich_hp) + "/" + string(global.nich_mhp));
draw_text(20, 60, "Mana: " + string(global.nich_en) + "/" + string(global.nich_men));

var bar_w = 150;
var bar_h = 12;
draw_rectangle_colour(20, 40, 20 + bar_w, 40 + bar_h, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_rectangle_colour(20, 40, 20 + bar_w * (global.nich_hp / global.nich_mhp), 40 + bar_h, c_red, c_red, c_lime, c_lime, false);

var menu_x = 30;
var menu_y = 330;
var menu_w = 260;
var menu_h = 260;

var submenu_x = menu_x + menu_w + 20;
var submenu_y = menu_y;
var submenu_w = 260;
var submenu_h = 260;

var icon_size   = 40;
var cursor_size = 40;
var cursor_x    = menu_x + 25;
var icon_x      = menu_x + 70;
var texto_x     = menu_x + 95;
var y_start     = menu_y + 25;
var linha_h     = 44;
var cursor_y    = y_start;

var tem_submenu = (state == BattleState.SELECT_HABILIDADE || state == BattleState.SELECT_ENEMY || state == BattleState.SELECT_ITEM);
var mostrar_menu_hud = (state == BattleState.MENU || state == BattleState.SELECT_ENEMY || state == BattleState.SELECT_HABILIDADE || state == BattleState.SELECT_ITEM);

if (mostrar_menu_hud){
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(menu_x, menu_y, menu_x + menu_w, menu_y + menu_h, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(menu_x, menu_y, menu_x + menu_w, menu_y + menu_h, true);

    if (tem_submenu){
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_rectangle(submenu_x, submenu_y, submenu_x + submenu_w, submenu_y + submenu_h, false);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_rectangle(submenu_x, submenu_y, submenu_x + submenu_w, submenu_y + submenu_h, true);
    }

    switch (state){

        case BattleState.MENU:
            for (var i = 0; i < array_length(opcoes_menu); i++){
                var y_pos = y_start + i*linha_h;
                draw_set_color((i == opcao) ? c_yellow : c_white);

                if (opcoes_icon[i] != noone){
                    var spr = opcoes_icon[i];
                    var escala_x = icon_size / sprite_get_width(spr);
                    var escala_y = icon_size / sprite_get_height(spr);
                    draw_sprite_ext(spr, 0, icon_x, y_pos, escala_x, escala_y, 0, c_white, 1);
                }
                draw_text(texto_x, y_pos - 14, opcoes_menu[i]);

                if (i == opcao) cursor_y = y_pos;
            }

            draw_set_color(c_white);
            var balanco = sin(current_time / 150) * 4;
            var escala_cursor = cursor_size / sprite_get_width(spr_curso);
            draw_sprite_ext(spr_curso, 0, cursor_x + balanco, cursor_y, escala_cursor, escala_cursor, 0, c_white, 1);
            break;

        case BattleState.SELECT_ENEMY:
            for (var i = 0; i < array_length(opcoes_menu); i++){
                var y_pos = y_start + i*linha_h;
                draw_set_color(c_gray);
                if (opcoes_icon[i] != noone){
                    var spr = opcoes_icon[i];
                    var escala_x = icon_size / sprite_get_width(spr);
                    var escala_y = icon_size / sprite_get_height(spr);
                    draw_sprite_ext(spr, 0, icon_x, y_pos, escala_x, escala_y, 0, c_gray, 1);
                }
                draw_text(texto_x, y_pos - 14, opcoes_menu[i]);
            }

            draw_set_color(c_white);
            draw_text(submenu_x + 20, submenu_y + 15, "Escolha o alvo:");
            for (var i = 0; i < array_length(inimigos); i++){
                draw_set_color((i == opcao) ? c_yellow : c_white);
                draw_text(submenu_x + 30, submenu_y + 50 + i*36, inimigos[i].nome);
            }
            break;

        case BattleState.SELECT_HABILIDADE:
            for (var i = 0; i < array_length(opcoes_menu); i++){
                var y_pos = y_start + i*linha_h;
                draw_set_color(c_gray);
                if (opcoes_icon[i] != noone){
                    var spr = opcoes_icon[i];
                    var escala_x = icon_size / sprite_get_width(spr);
                    var escala_y = icon_size / sprite_get_height(spr);
                    draw_sprite_ext(spr, 0, icon_x, y_pos, escala_x, escala_y, 0, c_gray, 1);
                }
                draw_text(texto_x, y_pos - 14, opcoes_menu[i]);
            }

            var total_hab = scr_habilidades_count();
            draw_set_color(c_white);
            draw_text(submenu_x + 20, submenu_y + 15, "Habilidades:");
            for (var i = 0; i < total_hab; i++){
                var hab = scr_habilidades(i);
                draw_set_color((i == opcao) ? c_yellow : c_white);
                draw_text(submenu_x + 30, submenu_y + 50 + i*36, hab[0] + " (Mana: " + string(hab[1]) + ")");
            }
            break;

        case BattleState.SELECT_ITEM:
            for (var i = 0; i < array_length(opcoes_menu); i++){
                var y_pos = y_start + i*linha_h;
                draw_set_color(c_gray);
                if (opcoes_icon[i] != noone){
                    var spr = opcoes_icon[i];
                    var escala_x = icon_size / sprite_get_width(spr);
                    var escala_y = icon_size / sprite_get_height(spr);
                    draw_sprite_ext(spr, 0, icon_x, y_pos, escala_x, escala_y, 0, c_gray, 1);
                }
                draw_text(texto_x, y_pos - 14, opcoes_menu[i]);
            }

            var total_itens = scr_itens_count();
            draw_set_color(c_white);
            draw_text(submenu_x + 20, submenu_y + 15, "Itens:");
            for (var i = 0; i < total_itens; i++){
                draw_set_color((i == opcao) ? c_yellow : c_white);
                draw_text(submenu_x + 30, submenu_y + 50 + i*36, global.itens_nome[i] + " x" + string(global.itens_qtd[i]) + " (Cura: " + string(global.itens_cura[i]) + ")");
            }
            break;
    }
}

if (state == BattleState.MENSAGEM){
    var msg_x = 30;
    var msg_y = 480;
    var msg_w = 700;
    var msg_h = 110;

    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(msg_x, msg_y, msg_x + msg_w, msg_y + msg_h, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(msg_x, msg_y, msg_x + msg_w, msg_y + msg_h, true);

    var texto_visivel = string_copy(mensagem_batalha, 1, floor(letras_mostradas));
    draw_text(msg_x + 20, msg_y + 20, texto_visivel);
}

switch (state){
    case BattleState.VITORIA:
        draw_set_color(c_white);
        draw_text(room_width/2 - 40, room_height/2, "Vitória! (Z pra continuar)");
        break;

    case BattleState.DERROTA:
        draw_set_color(c_white);
        draw_text(room_width/2 - 40, room_height/2, "Derrota...");
        break;
}
draw_set_color(c_white);