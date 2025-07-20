extends Node2D

func _ready():
	AudioPlayer.stop()
	if Global.number == 0:
		_avaria()
		$Timer.start(10)
	elif Global.number == 1:
		_final()
		$Timer.start(8)
	pass

func _avaria():
	$AnimationPlayer.play("roud")
	pass

func _final():
	$AnimationPlayer.play("final")
	pass


func _on_timer_timeout():
	if Global.number == 0:
		AudioPlayer.play()
		get_tree().change_scene_to_file("res://Level/level1.tscn")
		Global.number += 1
	elif Global.number == 1:

		pass
	pass # Replace with function body.
