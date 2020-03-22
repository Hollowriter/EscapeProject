extends TextureButton

export var aDondeIr = ""

onready var sceneLoader = get_parent().get_parent().get_parent()

func Apretado():
	sceneLoader.change_scene_to(aDondeIr)
