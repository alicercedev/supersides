dx = 0;
dy = gui_h * 0.7;
boxw = gui_w;
boxh = gui_h - dy;

draw_sprite_stretched(spr_inimigo, 0, dx, dy, boxw, boxh);

dx += 16;
dy += 16;

if (mensagematual < 0 || mensagematual >= array_length(mensagem)) exit;


var name = mensagem[mensagematual].name;
draw_text(dx, dy, name);


dy += 40;
draw_text_ext(dx, dy, draw_message, -1, boxw - dx * 2);

