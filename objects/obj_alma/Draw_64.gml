var mostrar = true;
if (invuln > 0){
    mostrar = (invuln div 4) mod 2 == 0;
}
if (mostrar) draw_self();