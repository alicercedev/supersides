randomize();
scr_itens_init();
global.nich_en = 0;

enum BattleState { MENU, SELECT_ENEMY, SELECT_HABILIDADE, SELECT_ITEM, ATACANDO, MENSAGEM, ENEMY_TURN, VITORIA, DERROTA }

state = BattleState.MENU;
opcao = 0;
opcoes_menu = ["Atacar", "Habilidade", "Especial", "Defender", "Item", "Sair"];
opcoes_icon = [spr_espada_hud, spr_combo_hud, spr_especial_hud, spr_escudo_hud, spr_item_hud, noone];

modo_ataque = "atacar";
habilidade_escolhida = 0;
proximo_estado = BattleState.MENU;
timer_acao = 0;
usar_mensagem = false;

mensagem_batalha = "";
letras_mostradas = 0;

global.nich_defendendo = false;
global.nich_atacando = false;
global.nich_conjurando = false;
global.nich_usando_item = false;
global.debug_mostrar_vida = true;

inimigos = [];
atacante = noone;

var tipo_criado;
if (variable_global_exists("battle_tipo_forcado")){
    tipo_criado = global.battle_tipo_forcado;
} else {
    tipo_criado = irandom(2);
}

var e = instance_create_layer(260, 290, "Instances", obj_enemy_battle, {tipo: tipo_criado});
array_push(inimigos, e);

if (variable_global_exists("battle_tipo_forcado")){
    global.battle_tipo_forcado = undefined;
}