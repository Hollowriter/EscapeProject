extends CanvasLayer

const ESCENAPRINCIPAL = "res://Escenas/EscenaPrincipal.tscn"

func BotonReintentar():
	get_tree().change_scene(ESCENAPRINCIPAL)
