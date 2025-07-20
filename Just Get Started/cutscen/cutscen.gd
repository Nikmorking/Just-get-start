extends Node2D

var number = 1

func _ready():
	AudioPlayer.stop()
	if number == 0:
		_avaria()
		$Timer.start(12)
	elif number == 1:
		_final()
		$Timer.start(10)
	pass

func _avaria():
	$AnimationPlayer.play("roud")
	pass

func _final():
	$AnimationPlayer.play("final")
	pass


func _on_timer_timeout():
	if number == 0:
		AudioPlayer.play()
		get_tree().change_scene_to_file("res://Level/level1.tscn")
		number += 1
	elif number == 1:
		get_tree().change_scene_to_file("res://titri.tscn")
		pass
	pass # Replace with function body.
