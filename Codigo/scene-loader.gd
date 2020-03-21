extends Node

var scenes_loaded={}
var last_scene

func _ready():
	load_scene("Cocina")
	load_scene("Dormitorio")
	#load_scene("Calle")
	yield( get_tree().create_timer(0.5), "timeout")
	change_scene_to("Cocina")

func load_scene(scene_name):
	var SCN=load("res://Escenas/Lugares/"+scene_name+".tscn")
	scenes_loaded[scene_name]=SCN.instance()

func change_scene_to(scene_name):
	if last_scene: remove_child(last_scene)
	add_child(scenes_loaded[scene_name])
	if scenes_loaded[scene_name].has_method("on_enter_scene"): scenes_loaded[scene_name].on_enter_scene()
	last_scene=scenes_loaded[scene_name]
