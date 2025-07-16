extends Control



func _ready():
	$AnimationPlayer.play("appearance")
	Global.load_game()
	pass



func _process(delta):
	pass




func _on_settings():
	$G_menu.hide()
	$Settings.show()
	pass


func _on_quit():
	get_tree().quit()
	pass


func _on_start_pressed():
	if !Global.menuStart:
		$start.play("start")
		$Timer.start(10)
	else:
		if Global.level == 1:
			get_tree().change_scene_to_file("res://Level/level1.tscn")
		if Global.level == 2:
			get_tree().change_scene_to_file("res://Level/level2.tscn")


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Level/level1.tscn")
	pass


func _on_back():
	$G_menu.show()
	$Settings.hide()
	pass
