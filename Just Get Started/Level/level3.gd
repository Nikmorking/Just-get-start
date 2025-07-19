extends Level

var back = false

func _ready():
	door_x = 717
	door_y = 34
	start_pos = $Player.position
	if Global.canCreep:
		$Label.hide()
		$"Стрелка".show()
	$Player.SPEED = 250
	pass

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level4.tscn")
		Global.level = 4
	pass



func _on_lock(body):
	if body == $Player:
		$Camera2D/AnimationPlayer.play("lock")
		$Player.JUMP_VELOCITY = -500
	back = !back
	pass # Replace with function body.


func _on_shift(body):
	if body == $Player and Global.canCreep:
		get_tree().change_scene_to_file("res://Level/level8.tscn")
		Global.level = 8
	pass # Replace with function body.
