extends Node2D

func _ready():
	pass 

var door_x = 717
var door_y = 34

func _process(delta):
	pass

func door_state(state):
	if state == false:
		$closeDoor.visible = true
		$openDoor.visible = false
	else:
		$closeDoor.visible = false
		$openDoor.visible = true
	pass





func _on_area_2d_body_entered(body):
	door_state(true)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	door_state(false)
	pass # Replace with function body.
