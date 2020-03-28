extends TextureButton

signal seleccionado
signal agarrado
signal darPista

export(bool) var agarrable = false
var necesitaA = ["MedicinaNervios","Disparador"]
export(String) var texto = ""
export(String) var pista = "123"
export var dondeDejarRecibo = Vector2()

onready var animationPlayer = $AnimationPlayer
onready var audio = $Sonido
onready var audioPista = $SonidoPista
onready var audioAgarrado = $SonidoAgarrado
onready var escenaPrincipal = get_parent().get_parent().get_parent()

var faltaNecesitaA = true

func _ready():
	if texto == "":
		texto = name

func Seleccionado():
	print(necesitaA)
	print(escenaPrincipal.itemSeleccionado)
	animationPlayer.play("seleccionado")
	var a = []
	if necesitaA.has(escenaPrincipal.itemSeleccionado) or faltaNecesitaA == false:
		audio.play()
		if necesitaA != []:
			animationPlayer.play("agarrado")
			if necesitaA.size() == 2:
				if escenaPrincipal.itemSeleccionado == "MedicinaNervios":
					necesitaA = ["Disparador"]
				else:
					necesitaA = ["MedicinaNervios"]
			else:
				if escenaPrincipal.itemSeleccionado == necesitaA[0]:
					necesitaA = []
			escenaPrincipal.SoltarItem(escenaPrincipal.itemSeleccionado)
			if necesitaA == []:
				faltaNecesitaA = false
				var recibo = load("res://Escenas/Recibo.tscn").instance()
				get_parent().add_child(recibo)
				recibo.rect_position = rect_position + dondeDejarRecibo
				recibo.connect("agarrado",escenaPrincipal,"AgarrarItemClickeado",[recibo])
				recibo.emit_signal("agarrado")
	else:
		emit_signal("darPista")
		audioPista.play()

func Deseleccionar():
	animationPlayer.play("normal")
