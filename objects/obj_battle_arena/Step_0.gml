tempo_restante--;
timer_ataque++;

switch (padrao){
    case 0: // chuva reta caindo do topo
        if (irandom(25) == 0){
            var p = instance_create_layer(x + irandom(largura), y, "Instances", obj_projetil_inimigo);
            p.hspd_p = 0;
            p.vspd_p = 1.5;
        }
        break;

    case 1: // chuva diagonal
        if (irandom(20) == 0){
            var vem_da_esquerda = choose(true, false);
            var p = instance_create_layer(vem_da_esquerda ? x : x + largura, y, "Instances", obj_projetil_inimigo);
            p.hspd_p = vem_da_esquerda ? 1 : -1;
            p.vspd_p = 1.5;
        }
        break;

    case 2: // varredura lateral, numa altura fixa (cuidado ao pular!)
        if (timer_ataque mod 50 == 0){
            var p = instance_create_layer(x, y + 60, "Instances", obj_projetil_inimigo);
            p.hspd_p = 2;
            p.vspd_p = 0;
        }
        break;
}

if (!instance_exists(obj_estrela_mana) && tempo_restante > 0){
    tempo_restante = 0;
}

if (tempo_restante <= 0){
    with (obj_projetil_inimigo) instance_destroy();
    with (obj_estrela_mana) instance_destroy();
    with (obj_plataforma_bloco) instance_destroy();
    if (instance_exists(obj_alma)) instance_destroy(obj_alma);
    global.nich_defendendo = false;
    obj_battle_controller.state = BattleState.MENU;
    instance_destroy();
}