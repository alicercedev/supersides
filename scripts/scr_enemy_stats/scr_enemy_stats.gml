/// scr_enemy_stats(tipo de batalha)
/// retorna [nome, hp_max, ataque, defesa, sprite, padrao de minigame q pode usar]

function scr_enemy_stats(tipo) {
	switch (tipo) {
		case 0: return ["Coelho do Mal", 20, 5, 2, spr_coelhomaligno, [0, 1]];
		case 1: return ["Pato maléfico", 15, 4, 1, spr_patomalefico, [0, 2]];
		case 2: return ["Nich do Mal", 25, 6, 3, spr_nichmaligno, [1, 2, ]];
	}
	return ["Erro", 1, 1, 0, spr_coelhomaligno];
}