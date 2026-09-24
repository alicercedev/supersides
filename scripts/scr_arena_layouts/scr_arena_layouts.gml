function scr_arena_layouts(x_arena, y_arena, largura, altura) {
	
show_debug_message("Sorteando layout...");

	var layouts = [];

    // Layout 0: duas plataformas, escada crescente
    layouts[0] = {
        plataformas: [
            [x_arena + 60,  y_arena + altura - 100, 90, 16],
            [x_arena + 230, y_arena + altura - 170, 90, 16]
        ],
        estrelas: [
            [x_arena + 90,  y_arena + altura - 130],
            [x_arena + 260, y_arena + altura - 200],
            [x_arena + largura - 60, y_arena + altura - 60],
            [x_arena + largura/2,    y_arena + altura - 60]
        ]
    };

    // Layout 1: três plataformas em zigue-zague
    layouts[1] = {
        plataformas: [
            [x_arena + 40,  y_arena + altura - 90,  70, 16],
            [x_arena + 180, y_arena + altura - 150, 70, 16],
            [x_arena + 300, y_arena + altura - 90,  70, 16]
        ],
        estrelas: [
            [x_arena + 65,  y_arena + altura - 120],
            [x_arena + 205, y_arena + altura - 180],
            [x_arena + 325, y_arena + altura - 120],
            [x_arena + largura/2, y_arena + altura - 60]
        ]
    };

    // Layout 2: plataforma central única, mais larga
    layouts[2] = {
        plataformas: [
            [x_arena + largura/2 - 60, y_arena + altura - 130, 120, 16]
        ],
        estrelas: [
            [x_arena + largura/2 - 40, y_arena + altura - 160],
            [x_arena + largura/2 + 30, y_arena + altura - 160],
            [x_arena + 50, y_arena + altura - 60],
            [x_arena + largura - 50, y_arena + altura - 60]
        ]
    };

    var escolhido = irandom(array_length(layouts) - 1);
show_debug_message("Layout escolhido: " + string(escolhido));
return layouts[escolhido];
}