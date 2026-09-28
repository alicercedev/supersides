function scr_itens_init() {
    if (!variable_global_exists("itens_nome")){
        global.itens_nome  = ["Poção",  "Elixir", "Poção de Fogo"];
        global.itens_tipo  = ["cura",   "cura",   "buff_fogo"];
        global.itens_valor = [20,       50,       1.5];
        global.itens_qtd   = [3,        1,        1];
        global.itens_desc  = ["Restaura 20 de HP.", "Restaura 50 de HP.", "Aumenta o dano de fogo até o fim da batalha."];
    }

    if (!variable_global_exists("nich_buff_fogo")){
        global.nich_buff_fogo = 1;
    }
}

function scr_itens_count() {
    return array_length(global.itens_nome);
}