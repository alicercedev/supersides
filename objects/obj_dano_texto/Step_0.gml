x += hspd_txt;
y += vspd_txt;
vspd_txt += gravidade;

if (y >= y_chao){
    y = y_chao;

    if (abs(vspd_txt) > 1){
        vspd_txt = -vspd_txt * amortecimento;
        hspd_txt *= amortecimento;
    } else {
        vspd_txt = 0;
        hspd_txt = 0;
    }
}

vida--;
if (vida < 15){
    alpha_txt = vida / 15;
}

if (vida <= 0){
    instance_destroy();
}