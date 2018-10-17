extends "res://scripts/itemBehaviour.gd"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Moeda_body_enter( body ):
	var pai = get_parent()
	pai._pontuar(50)
	self.queue_free()
