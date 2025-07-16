extends Level

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level2.tscn")
		Global.level = 2
	pass


func _ready():
	start_pos = $Player.position
	door_x = 717
	door_y = 34
	pass
