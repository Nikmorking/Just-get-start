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
	$Settings.set_value()
	Global.load_game()
	pass


func _on_quit():
	get_tree().quit()
	pass


func _on_start_pressed():
	if !Global.menuStart:
		$start.play("start")
		$Timer.start(10)
	else:
		get_tree().change_scene_to_file("res://Level/level%s.tscn" % Global.level)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Level/level1.tscn")
	pass


func _on_back():
	$G_menu.show()
	$Settings.hide()
	Global.save_game()
	pass
