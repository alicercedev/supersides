var stats = scr_enemy_stats(tipo);

nome    = stats[0];
hp_max  = stats[1];
hp      = hp_max;
ataque  = stats[2];
defesa  = stats[3];
sprite_index = stats[4];
padroes = stats[5];

morto = false;
hp_anterior = hp;
dano_flash = 0;
death_timer = 0;