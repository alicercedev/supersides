
if BattleState.ENEMY_TURN != state{ 
    for(var i = 0;i < array_length(atu_texto);i += 1){
        var xx = 90
        var yy = room_height/2 + 60 + 40*i
        
        var str = atu_texto[i]
        
        if i = opcao{
            draw_sprite_ext(spr_cursor,0,xx,yy + 20,2,2,0,c_white,1);
        }
        
        draw_text_transformed(xx,yy,str,2,2,0) 
    }
}