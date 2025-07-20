extends Level

signal _stop_boss

func _ready():
	$Camera2D.start_shake(0.3, 5.0)
	Global.dashKd = true
	start_pos = $Player.position
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://menu/Menu.tscn")
		Global.level = 15
	pass

func _final():
	$AnimationPlayer.play("final")
	$Timer.start(5)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://cutscen/cutscen.tscn")


func stop_boss():
	_stop_boss.emit()
	pass
