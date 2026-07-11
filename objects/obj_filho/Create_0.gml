randomise()
id_inimigo = irandom(2)
image_index = spr_coelhomaligno
index = global.inimigo_index_guide++

data = get_enemy_data(id_inimigo) // hp, nome, sprite, etc
sprite_index = data.sprite

function dano(_quantidade){
    var damage = _quantidade / data.defesa
    data.hp -= damage
    show_message(string(damage) + " de dano foi infringido a " + data.nome)
}