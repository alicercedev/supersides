largura = 380;
altura  = 260;
x = room_width/2  - largura/2;
y = room_height/2 - altura/2;
depth = 100;

tempo_restante = room_speed * 8;

var lista_padroes = obj_battle_controller.atacante.padroes;
padrao = lista_padroes[irandom(array_length(lista_padroes) - 1)];

timer_ataque = 0;

// chão
instance_create_layer(x, y + altura - 24, "Instances", obj_plataforma_bloco, {larg: largura, alt: 24});

// layout sorteado
var layout = scr_arena_layouts(x, y, largura, altura);

for (var i = 0; i < array_length(layout.plataformas); i++){
    var p = layout.plataformas[i];
    instance_create_layer(p[0], p[1], "Instances", obj_plataforma_bloco, {larg: p[2], alt: p[3]});
}

for (var i = 0; i < array_length(layout.estrelas); i++){
    var e = layout.estrelas[i];
    instance_create_layer(e[0], e[1], "Instances", obj_estrela_mana);
}
estrelas_total = array_length(layout.estrelas);

// jogador
instance_create_layer(x + 30, y + altura - 60, "Instances", obj_alma);