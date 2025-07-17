extends Level


# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = $Player.position
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level5.tscn")
		Global.level = 4
		Global.save_game()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
