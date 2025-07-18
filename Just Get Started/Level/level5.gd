extends Level



func _ready():
	$Player.visible = true
	start_pos = $Player.position
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level5.tscn")
		Global.level = 5
		Global.save_game()
	pass


func _on_kill_body_entered(body):
	$Player.visible = false
	Global.dashKd = true
	Global.level = 1
	Global.save_game()
	get_tree().change_scene_to_file("res://Level/level1.tscn")
	pass
