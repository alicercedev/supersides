#region --controles do menu
if keyboard_check_pressed(vk_down)
{
	opcao++;
}

if keyboard_check_pressed(vk_up)
{
	opcao--;
}

opcao = clamp(opcao,0,5)
#endregion

#region --MENUS DA BRIGA

if state = BattleState.MENU {
if keyboard_check_pressed(ord("Z"))
{
	switch(opcao)
	{
		case 0:
		state = BattleState.SELECT_ENEMY
		break;
		
		case 1:
		state = BattleState.PLAYER_CHOICE
		break;
		
		case 5:
		room_goto(Room1)
		break;
	}
}
}

else if state = BattleState.SELECT_ENEMY {
	if keyboard_check_pressed(ord("Z"))
	{
		switch(opcao)
		{
			case 0:
			hpinimigo = hpinimigo - atk
			state = BattleState.MENU
			break;
			
		}
	}
}

if hpinimigo <= 0 {
	room_goto(Room1)
}
#endregion