extends Node2D
class_name Level

var door_action = false
var start_pos

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
	door_action = true
	door_state(true)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	door_action = false
	door_state(false)
	pass # Replace with function body.

func _on_out(body):
	$Player.position = start_pos
	$Player/AnimatedSprite2D.flip_h = false
	if get_node(""):
		$Camera2D/AnimationPlayer.play("RESET")
	pass # Replace with function body.d

