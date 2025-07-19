extends Level

func _ready():
	Global.load_game()
	start_pos = $Player.position
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level7.tscn")
		Global.level = 7
		Global.save_game()
	pass
