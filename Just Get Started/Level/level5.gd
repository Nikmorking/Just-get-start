extends Level

var dash = false
var crouch = false

func _ready():
	
	$Black.visible = false
	$Label.visible = false
	
	if Global.dashKd:
		dash = true
	else:
		dash = false
		
	if Global.canCreep:
		$gui.visible = true
		crouch = true
		$Label.visible = true
		$Black.visible = true
		$AnimationPlayer.play("hide")
		$Timer2.start(1)
	else:
		$gui.visible = false
		crouch = false
		
	$Player.visible = true
	start_pos = $Player.position
	Global.save_game()
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level6.tscn")
		Global.level = 5
	pass


func _on_kill_body_entered(body):
	if !dash:
		$Player.visible = false
		Global.dashKd = true
		Global.level = 1
		
		$Black.visible = true
		$Label.visible = true
		$AnimationPlayer.play("show")
		
		$Timer.start(5)
	else:
		$Player.position = start_pos
	pass


func _on_timer_timeout():
	Global.save_game()
	$Black.visible = false
	$Label.visible = false
	get_tree().change_scene_to_file("res://Level/level1.tscn")
	pass # Replace with function body.


func _on_timer_2_timeout():
	$Label.visible = false
	$Black.visible = false
	pass # Replace with function body.
