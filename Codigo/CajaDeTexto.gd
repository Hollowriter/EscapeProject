extends Label

signal terminoDeEscribir

export(float) var velocidadDelTexto = 0.1;

var texto = ""

onready var timer = $Timer

func _ready():
	timer.wait_time = velocidadDelTexto
	
func NuevoTexto(nuevoTexto):
	texto = nuevoTexto
	text = ""
	timer.start()

func TimerTimeout():
	text += texto[text.length()]
	if text != texto:
		timer.start()
