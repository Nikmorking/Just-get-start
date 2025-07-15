extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("appearance")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_settings():
	$G_menu.hide()
	$Settings.show()
	pass # Replace with function body.


func _on_quit():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_pressed():
	$start.play("start")
	$Timer.start(10)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Level/level1/level1.tscn")


func _on_back():
	$G_menu.show()
	$Settings.hide()
	pass # Replace with function body.
