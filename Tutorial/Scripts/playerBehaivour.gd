extends KinematicBody2D

var speed = 150
var animacao 

func _ready():
	set_fixed_process(true)
	animacao = get_node("animacao")

func _fixed_process(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		move(Vector2(speed,0)*delta)
		set_scale(Vector2(1,1))
		animacao.play("Walk")
		
	elif Input.is_action_pressed("ui_left"):
		move(Vector2(-speed,0)*delta)
		set_scale(Vector2(-1,1))
		animacao.play("Walk")
	
	else:
		animacao.play("Idle")