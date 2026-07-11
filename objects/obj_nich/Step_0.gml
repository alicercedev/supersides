#region --coisa básica
leftkey = keyboard_check(vk_left)
downkey = keyboard_check(vk_down)
rightkey = keyboard_check(vk_right)
upkey = keyboard_check(vk_up)

if keyboard_check(vk_shift) {
	mspd = 4 
	image_speed = 1.5
	}
	
else
	{
		image_speed = 1
		mspd = 2
	}

hspd = (rightkey - leftkey) * mspd
vspd = (downkey - upkey) * mspd

if place_meeting(x+hspd, y, obj_colisao) == true{
	hspd = 0
}
if place_meeting(x, y+vspd, obj_colisao) == true{
	vspd = 0
}

if place_meeting(x,y,obj_inimigo) == true{
    global.inimigo_index_guide = 0
	room_goto(Room2)
}




x += hspd
y += vspd
#endregion

#region --sprites e movimentação
if (vspd > 0)
{
	sprite_index = spr_walkdown
	image_xscale = 1
	ld = dir.down
}

else if vspd < 0
{
	sprite_index = spr_upwalk
	image_xscale = 1
	ld = dir.up
}

else if hspd > 0
{
	sprite_index = spr_walkside
	image_xscale = 1
	ld = dir.right
	
}

else if hspd < 0
{
	sprite_index = spr_walkside
	image_xscale = -1
	ld = dir.left
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
	break;
}
	
}





#endregion

#region --caminho do npc
if (hspd !=0 || vspd != 0)
{
	array_push(caminho, [x,y, ld]);
	
	if (array_length(caminho) > 300)
	{
		array_delete(caminho,0,1);
	}
}

if (array_length(caminho) > 300)
{
	array_delete(caminho,0,1)
}
#endregion
