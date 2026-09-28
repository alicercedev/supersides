function scr_habilidades(index) {
    switch (index) {
        case 0: return ["Bola de Fogo", 15, 2];
        case 1: return ["Chamuscar",    10, 0];
    }
    return ["Erro", 0, 1];
}

function scr_habilidades_count() {
    return 2;
}