function scr_itens_init() {
    if (!variable_global_exists("itens_nome")){
        global.itens_nome = ["Poção", "Elixir"];
        global.itens_cura = [20, 50];
        global.itens_qtd  = [3, 1];
        global.itens_desc = ["Restaura 20 de HP.", "Restaura 50 de HP."];
    }
}

function scr_itens_count() {
    return array_length(global.itens_nome);
}