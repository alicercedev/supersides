


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
opcao = 0;
alvo = 0;
qtalvos = irandom_range(1,4);
hpinimigo = obj_filho.hp

