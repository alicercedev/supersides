#region --controles do menu
opcao += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)

opcao = clamp(opcao,0,array_length(atu_texto)-1)
#endregion

#region --MENUS DA BRIGA

switch (state) {
	case BattleState.MENU : {
        atu_texto = textos_menu1
        if keyboard_check_pressed(ord("Z")){
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
        break
    }
    case BattleState.SELECT_ENEMY : {
        var names = []
        with obj_filho{
            array_push(names,string(self.index) + " " + self.data.nome)
        }
        atu_texto = names
        
        if keyboard_check_pressed(ord("Z")){
            inimigos[opcao].dano(5)
            state = BattleState.ENEMY_TURN
            opcao = 0
        }
    }    
}

if BattleState.MENU != state and BattleState.ENEMY_TURN != state and keyboard_check_pressed(ord("X")){
    state = BattleState.MENU
}

if state = BattleState.SELECT_ENEMY {
opcao = clamp(opcao,0,qtalvos)
}
if !instance_exists(obj_filho) {
	room_goto(Room1)
}
#endregion