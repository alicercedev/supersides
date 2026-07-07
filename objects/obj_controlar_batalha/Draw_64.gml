if state == BattleState.MENU {
draw_text(40,420,"Atacar");
draw_text(40,460,"Habilidades");
draw_text(40,500,"Especial");
draw_text(40,540,"Defender");
draw_text(40,580,"Item");
draw_text(40,620,"Sair");
draw_sprite(spr_cursor,0,10,420+opcao*40);
draw_text(40, 360, obj_filho.id_inimigo);
}



if state = BattleState.SELECT_ENEMY {
draw_text(40,420,obj_filho.nome);
draw_sprite(spr_cursor,0,10,440+opcao*40);
}

