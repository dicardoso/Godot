extends "res://scripts/itemBehaviour.gd"

func _ready():
	
	pass



func _on_Bomba_body_enter( body ):
	var pai = get_parent()
	pai._atualiza_vida(-25)
	self.queue_free()