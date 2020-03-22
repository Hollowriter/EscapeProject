extends Label
extends MarginContainer

signal terminoDeEscribir

export(float) var velocidadDelTexto = 0.1;

var texto = ""

onready var timer = $Timer
onready var label = $Label
onready var audio = $Audio

func _ready():
	timer.wait_time = velocidadDelTexto
	
func NuevoTexto(nuevoTexto):
	texto = nuevoTexto
	label.text = ""
	timer.start()

func TimerTimeout():
	audio.play()
	audio.pitch_scale = rand_range(0.5,1)
	label.text += texto[label.text.length()]
	if label.text != texto:
		timer.start()
