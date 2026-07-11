global.inimigo_index_guide = 0

function character_data(hp) constructor{
    
}

#region enemy data

function enemy_data(_nome,_hp_max,_sprite,_defesa = 1) constructor{
    self.nome     = _nome
    self.hp_max = _hp_max
    self.hp = self.hp_max
    self.sprite     = _sprite
    self.defesa   = 1
}

global.data_of_enemys = []
global.data_of_enemys[0] = new enemy_data("coelho do mal", 10 ,spr_coelhomaligno)
global.data_of_enemys[1] = new enemy_data("pato do mal", 10 ,spr_patomalefico)
global.data_of_enemys[2] = new enemy_data("nich do mal", 10 ,spr_nichmaligno)

function get_enemy_data(index){
    return global.data_of_enemys[index]
}

#endregion