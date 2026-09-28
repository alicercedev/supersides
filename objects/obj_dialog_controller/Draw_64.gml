if (dialog_state != "HIDDEN"){
    draw_set_font(fnt_battle);
    
    draw_set_color(c_black);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, false);
    draw_set_color(c_white);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, true);
    
    var linha_atual = dialog_lines[dialog_index];
    
    if (linha_atual.nome != ""){
        draw_set_color(c_yellow);
        draw_text(caixa_x + 20, caixa_y + 15, linha_atual.nome);
        draw_set_color(c_white);
    }
    
    if (dialog_state == "TYPING" || dialog_state == "WAITING"){
        var texto_visivel = string_copy(linha_atual.texto, 1, floor(char_count));
        draw_text(caixa_x + 20, caixa_y + 45, texto_visivel);
        
        if (dialog_state == "WAITING"){
            draw_text(caixa_x + caixa_w - 30, caixa_y + caixa_h - 25, "▼");
        }
    }
    else if (dialog_state == "CHOOSING"){
        if (linha_atual.texto != ""){
            draw_text(caixa_x + 20, caixa_y + 45, linha_atual.texto);
        }
        
        var n_choices = array_length(linha_atual.choices);
        for (var i = 0; i < n_choices; i++){
            draw_set_color((i == choice_index) ? c_yellow : c_white);
            draw_text(caixa_x + 40, caixa_y + 30 + i*22, linha_atual.choices[i].texto);
        }
        draw_set_color(c_white);
    }
}