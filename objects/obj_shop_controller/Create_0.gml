
enum ShopState { MENU, COMPRAR, VENDER, CONVERSAR, SAIR }
enum BalaoState { HIDDEN, GROWING, SHOWING, SHRINKING }

state = ShopState.MENU;


opcao = 0;
opcoes_menu = ["Comprar", "Vender", "Conversar", "Sair"];

opcao_item = 0;
itens_loja = ["Pocao", "Bandagem", "Doce"];
precos_loja = [20, 15, 10];


fala_bemvindo = "Seja bem-vindo!";
fala_atras_do_que = "Ta atras de que hoje?";
fala_comprar = "otima escolha!";
fala_vender = "Pra que vai usar isso, hein?";
fala_despedida = "Ate a próxima!";

fala_atual = fala_bemvindo;


balao_state = BalaoState.HIDDEN;

balao_anchor_x = 60; 
balao_anchor_y = 30;
balao_padding = 14;
balao_max_width = 180;
balao_min_size = 26;
balao_rabo_tam = 14;

fala_duracao = 120;
fala_timer = 0;

fala_char_count = 0;
fala_char_speed = 0.5;  

balao_anchor_x = 380;       
balao_anchor_y_bottom = 160;
balao_padding = 20;        
balao_rabo_tam = 20;       
scr_vendedor(fala_bemvindo);