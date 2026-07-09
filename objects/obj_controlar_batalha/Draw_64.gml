if state == BattleState.MENU {
draw_text(40,420,"Atacar");
draw_text(40,460,"Habilidades");
draw_text(40,500,"Especial");
draw_text(40,540,"Defender");
draw_text(40,580,"Item");
draw_text(40,620,"Sair");
draw_sprite(spr_cursor,0,10,440+opcao*40);
draw_text(40, 360, obj_filho.id_inimigo);
draw_text(40, 380, obj_filho.nome);
draw_text(40, 400, obj_filho.hp);

}



if state = BattleState.SELECT_ENEMY {
	for (var i = 0; i < qtalvos; ++i) {
draw_text(40,420 + i * 40,obj_filho.nome);
	}
draw_sprite(spr_cursor,0,10,440+opcao*40);
draw_text(40, 360, obj_filho.id_inimigo);
draw_text(40, 380, obj_filho.nome);
draw_text(40, 400, obj_filho.hp);
}

