function criadialogo(mensagem){
	if (instance_exists(obj_dialogo)) return;
	
	var inst = instance_create_depth(0, 0, 0, obj_dialogo);
	inst.mensagem = mensagem
	inst.mensagematual = 0;
}