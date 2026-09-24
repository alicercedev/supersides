for (var i = array_length(inimigos) - 1; i >= 0; i--){
    if (!instance_exists(inimigos[i])){
        array_delete(inimigos, i, 1);
    }
}

if (global.nich_hp <= 0 && state != BattleState.DERROTA){
    state = BattleState.DERROTA;
    if (instance_exists(obj_battle_arena)) instance_destroy(obj_battle_arena);
    with (obj_alma) instance_destroy();
    with (obj_projetil_inimigo) instance_destroy();
}

switch (state){

    case BattleState.MENU:
        if (keyboard_check_pressed(vk_down)) opcao++;
        if (keyboard_check_pressed(vk_up))   opcao--;
        opcao = clamp(opcao, 0, array_length(opcoes_menu) - 1);

        if (keyboard_check_pressed(ord("Z"))){
            switch (opcao){
                case 0: // Atacar
                    modo_ataque = "atacar";
                    opcao = 0;
                    state = BattleState.SELECT_ENEMY;
                    break;

                case 1: // Habilidade
                    opcao = 0;
                    state = BattleState.SELECT_HABILIDADE;
                    break;

                case 3: // Defender
                    global.nich_defendendo = true;
                    atacante = inimigos[irandom(array_length(inimigos) - 1)];
                    state = BattleState.ENEMY_TURN;
                    break;

                case 4: // Item
                    opcao = 0;
                    state = BattleState.SELECT_ITEM;
                    break;

                case 5: // Sair
                    room_goto(Room1);
                    break;
            }
        }
        break;

    case BattleState.SELECT_HABILIDADE:
        var total_hab = scr_habilidades_count();
        if (keyboard_check_pressed(vk_down)) opcao++;
        if (keyboard_check_pressed(vk_up))   opcao--;
        opcao = clamp(opcao, 0, total_hab - 1);

        if (keyboard_check_pressed(ord("Z"))){
            var hab = scr_habilidades(opcao);
            if (global.nich_en >= hab[1]){
                habilidade_escolhida = opcao;
                modo_ataque = "habilidade";
                opcao = 0;
                state = BattleState.SELECT_ENEMY;
            }
        }

        if (keyboard_check_pressed(vk_backspace)) state = BattleState.MENU;
        break;

    case BattleState.SELECT_ITEM:
        var total_itens = scr_itens_count();
        if (keyboard_check_pressed(vk_down)) opcao++;
        if (keyboard_check_pressed(vk_up))   opcao--;
        opcao = clamp(opcao, 0, max(total_itens - 1, 0));

        if (keyboard_check_pressed(ord("Z")) && total_itens > 0 && global.itens_qtd[opcao] > 0){
            global.nich_hp += global.itens_cura[opcao];
            global.nich_hp = min(global.nich_hp, global.nich_mhp);
            global.itens_qtd[opcao] -= 1;

            mensagem_batalha = "Nich usou " + global.itens_nome[opcao] + "!#" + global.itens_desc[opcao];
            global.nich_usando_item = true;

            atacante = inimigos[irandom(array_length(inimigos) - 1)];
            proximo_estado = BattleState.ENEMY_TURN;
            usar_mensagem = true;
            timer_acao = 20;
            opcao = 0;
            state = BattleState.ATACANDO;
        }

        if (keyboard_check_pressed(vk_backspace)) state = BattleState.MENU;
        break;

    case BattleState.SELECT_ENEMY:
        if (keyboard_check_pressed(vk_down)) opcao++;
        if (keyboard_check_pressed(vk_up))   opcao--;
        opcao = clamp(opcao, 0, max(array_length(inimigos) - 1, 0));

        if (keyboard_check_pressed(ord("Z")) && array_length(inimigos) > 0){
            var alvo = inimigos[opcao];
            var dano;

            if (modo_ataque == "habilidade"){
                var hab = scr_habilidades(habilidade_escolhida);
                global.nich_en -= hab[1];
                dano = max(1, floor((global.nich_atk - alvo.defesa) * hab[2]));
                global.nich_conjurando = true;
            } else {
                dano = max(1, global.nich_atk - alvo.defesa);
                global.nich_atacando = true;

                instance_create_layer(alvo.x, alvo.y, "Instances", obj_slash_efeito);
            }

            alvo.hp -= dano;

            var txt = instance_create_layer(alvo.x, alvo.bbox_top - 10, "Instances", obj_dano_texto);
            txt.texto = string(dano);
            txt.cor = c_white;
            txt.y_chao = alvo.y + 20;

            atacante = inimigos[irandom(array_length(inimigos) - 1)];
            proximo_estado = (array_length(inimigos) <= 1 && alvo.hp <= 0) ? BattleState.VITORIA : BattleState.ENEMY_TURN;
            usar_mensagem = false;
            timer_acao = 20;

            opcao = 0;
            modo_ataque = "atacar";
            state = BattleState.ATACANDO;
        }

        if (keyboard_check_pressed(vk_backspace)) state = BattleState.MENU;
        break;

    case BattleState.ATACANDO:
        timer_acao--;
        if (timer_acao <= 0){
            if (usar_mensagem){
                letras_mostradas = 0;
                state = BattleState.MENSAGEM;
            } else {
                state = proximo_estado;
            }
        }
        break;

    case BattleState.MENSAGEM:
        letras_mostradas += 1.2;

        if (keyboard_check_pressed(ord("Z"))){
            if (letras_mostradas < string_length(mensagem_batalha)){
                letras_mostradas = string_length(mensagem_batalha);
            } else {
                state = proximo_estado;
            }
        }
        break;

    case BattleState.ENEMY_TURN:
        if (!instance_exists(obj_battle_arena)){
            instance_create_layer(0, 0, "Instances", obj_battle_arena);
        }
        break;

    case BattleState.VITORIA:
        if (keyboard_check_pressed(ord("Z"))){
            room_goto(Room1);
        }
        break;

    case BattleState.DERROTA:
        break;
}