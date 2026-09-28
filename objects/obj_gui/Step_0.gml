depth = -y;

if (global.em_dialogo) exit;

if (variable_global_exists("em_batalha") && global.em_batalha){
    visible = false;
    exit;
} else {
    visible = true;
}

if (instance_exists(obj_nich)){
    // resto do código de seguir...
}

if (instance_exists(obj_nich)){
    var ultimo_x = historico_x[0];
    var ultimo_y = historico_y[0];
    
    // registra a posição do Nich toda vez que ele andar o suficiente
    if (point_distance(obj_nich.x, obj_nich.y, ultimo_x, ultimo_y) >= distancia_minima){
        for (var i = max_historico - 1; i > 0; i--){
            historico_x[i] = historico_x[i-1];
            historico_y[i] = historico_y[i-1];
        }
        historico_x[0] = obj_nich.x;
        historico_y[0] = obj_nich.y;
    }
    
    // vai direto pra posição histórica mais antiga (segue o caminho real, sem cortar)
    x = historico_x[max_historico - 1];
    y = historico_y[max_historico - 1];
}