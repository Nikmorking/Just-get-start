extends Level

func _ready():
	door_x = 717
	door_y = 34
	start_pos = $Player.position
	pass

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level3.tscn")
	pass
