


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


state = BattleState.MENU;
atk = 1
opcao = 0;
alvo = 0;
qtalvos = irandom_range(1,4);
hpinimigo = obj_filho.hp

