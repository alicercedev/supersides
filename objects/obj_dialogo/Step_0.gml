if (mensagematual < 0 || mensagematual >= array_length(mensagem)) 
{
instance_destroy();
exit;
}

var _txt = mensagem[mensagematual].msg;
if (charatual < string_length(_txt))
{
	charatual += char_speed * (1 + keyboard_check(input));
	draw_message = string_copy(_txt, 0, charatual);	
}
else if (keyboard_check_pressed(input))
{
	mensagematual ++;
	if (mensagematual >= array_length(mensagem))
	{
		instance_destroy();
		exit;
	}
	else
	{
	 charatual = 0;
	}
}

