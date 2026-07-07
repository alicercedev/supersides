if (array_length(alvo.caminho) > indice)
{
	var p = alvo.caminho[max(0, array_length(alvo.caminho) - indice - 1)];
	
	x = p[0];
	y = p[1];
	ld = p[2];
}

var dx = x - x_ant;
var dy = y - y_ant;

if (dx != 0 || dy != 0)
{


switch(ld)
{
	case dir.down:
	sprite_index = spr_walkdown;
	break;
	
	case dir.up:
	sprite_index = spr_upwalk;
	break;
	
	case dir.left:
	sprite_index = spr_walkside;
	image_xscale = -1
	break;
	
	case dir.right:
	sprite_index = spr_walkside;
	image_xscale = 1
	break;
}
}
else
{
switch(ld)
{
	case dir.down:
	sprite_index = spr_nichdown;
	break;
	
	case dir.up:
	sprite_index = spr_nichup;
	break;
	
	case dir.left:
	sprite_index = spr_nichsides;
	image_xscale = -1
	break;
	
	case dir.right:
	sprite_index = spr_nichsides;
	image_xscale = 1
	break;

}
	

}
	
x_ant = x;
y_ant = y;