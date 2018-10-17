extends Area2D

var animacao

var velocidade
var vel_max = 200
var vel_min = 100

var lim_esq 
var lim_dir

var largura = Globals.get("display/width")
var altura = Globals.get("display/height")

func _ready():
	set_fixed_process(true)
	randomize()
	velocidade = rand_range(vel_min,vel_max)
	animacao = get_node("animacao")
	
	lim_esq = _getLarguraFrame()/2
	lim_dir = largura - _getLarguraFrame()/2
	
	var x = rand_range(lim_esq,lim_dir)
	set_pos(Vector2(x,-32))

func _fixed_process(delta):
	animacao.play("default")
	translate(Vector2(0,velocidade)*delta)
	
	if ((get_pos().y - _getAlturaFrame()/2) > altura):
		self.queue_free()
	
func _getLarguraFrame():
	var sprite_frames = animacao.get_sprite_frames()
	var frame = sprite_frames.get_frame("default",0)
	return frame.get_width()
	
func _getAlturaFrame():
	var sprite_frames = animacao.get_sprite_frames()
	var frame = sprite_frames.get_frame("default",0)
	return frame.get_height()