extends Node2D

var door_action = false

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

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level2.tscn")
		Global.level = 2
	pass



func _on_area_2d_body_entered(body):
	door_action = true
	door_state(true)
	pass


func _on_area_2d_body_exited(body):
	door_action = false
	door_state(false)
	pass
