extends Node

var res_bomba
var res_moeda
var res_queijo

var pontuacao = 0
var vida = 10

onready var controlSample = get_node("SamplePlayer2D")
onready var controlAudioBG = get_node("BG")

func _ready():

	res_bomba = load("res://Cenas/Bomba.tscn")
	res_moeda = load("res://Cenas/Moeda.tscn")
	res_queijo = load("res://Cenas/Queijo.tscn")
	
	controlAudioBG.play("AudioBG")

func _on_BombaTimer_timeout():
	var bomba = res_bomba.instance()
	add_child(bomba)

func _on_MoedaTimer_timeout():
	var moeda = res_moeda.instance()
	add_child(moeda)
	
func _on_QueijoTimer_timeout():
	var queijo = res_queijo.instance()
	add_child(queijo)
	
func _pontuar(pontos):
	pontuacao = pontuacao + pontos
	var pontos_label = get_node("Pontos")
	pontos_label.set_text(str(pontuacao))
	controlSample.play("Moeda")

func _atualiza_vida(valor):
	vida = vida + valor
	var vida_bar = get_node("Vida")
	vida_bar.set_value(vida)
	if (vida > 100):
		vida = 100
	print (vida)
	if (valor>0):
		controlSample.play("Vida")
	elif (valor<0):
		controlSample.play("Bomba")
	_verifica_fim()
	
func _verifica_fim():
	if (vida <= 0):
		var pop = get_node("FimPop")
		pop.popup_centered()
		get_tree().set_pause(true)
		controlAudioBG.stop_all()
		controlSample.play("Fail")


func _on_Restart_pressed():
	get_tree().set_pause(false)
	yield(get_tree(), "idle_frame")
	get_tree().reload_current_scene()
