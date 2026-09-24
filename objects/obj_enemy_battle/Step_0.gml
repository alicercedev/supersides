if (hp < hp_anterior){
    dano_flash = 20;
}
hp_anterior = hp;

if (dano_flash > 0) dano_flash--;

if (hp <= 0 && !morto){
    morto = true;
    death_timer = 20;
}

if (morto){
    death_timer--;
    if (death_timer <= 0){
        instance_destroy();
    }
}