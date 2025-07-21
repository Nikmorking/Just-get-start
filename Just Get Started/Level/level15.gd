extends Level

signal _stop_boss

func _ready():
	AudioPlayer.stream = load("res://musicx/electric-symphony-20240527-202414.mp3")
	AudioPlayer.play()
	$Camera2D.start_shake(0.3, 5.0)
	Global.dashKd = true
	Global.canCreep = true
	start_pos = $Player.position
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://menu/Menu.tscn")
		Global.level = 15
	if Input.is_action_pressed("ui_down"):
		$StaticBody2D3/CollisionShape2D.disabled = true
		$StaticBody2D3/CollisionShape2D2.disabled = true
	elif Input.is_action_just_released("ui_down"):
		$StaticBody2D3/CollisionShape2D.disabled = false
		$StaticBody2D3/CollisionShape2D2.disabled = false
	pass

func _final():
	$AnimationPlayer.play("final")
	$Timer.start(5)


func _on_timer_timeout():
	Global.number = 1
	get_tree().change_scene_to_file("res://cutscen/cutscen.tscn")


func stop_boss():
	_stop_boss.emit()
	pass

func load_bar(heals):
	$TextureProgressBar.value = heals
	pass
	



func _on_timer_7_timeout():
	_final()
	pass # Replace with function body.
