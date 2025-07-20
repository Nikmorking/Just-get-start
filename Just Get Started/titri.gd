extends Control

var speed = 25

func _process(delta):
	$Camera2D.position.y += speed * delta
	if $Camera2D.position.y > 1237:
		get_tree().change_scene_to_file("res://menu/Menu.tscn")
	pass
