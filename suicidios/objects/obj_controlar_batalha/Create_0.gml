
textos_menu1 = ["Atacar","Habilidade","Especial","Defender","Item","Sair"]

enum BattleState
{
	MENU,
	PLAYER_CHOICE,
	PLAYER_ATTACK,
	SELECT_ENEMY,
	ACTION,
	ENEMY_TURN,
	END
}

atu_texto = textos_menu1


function battlemenu() {
	if keyboard_check_pressed(ord("Z"))
	{
		switch(opcao)
		{
			case menu.atk:
				alvo = 0
				state = BattleState.SELECT_ENEMY;
				break;
	}
}
}

state = BattleState.MENU;
atk = 10
opcao = 0;   // index do botao escolhido
alvo = 0;
qtalvos = irandom_range(1,4);
inimigos = []


function  list_enemys(){
    var new_inimigos = []
    with obj_filho{
        array_push(new_inimigos,self.id)
    }
    inimigos = new_inimigos
}

list_enemys()