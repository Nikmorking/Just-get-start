extends Level

var crouch = false

func _ready():
	Global.dashKd = true
	
	$Black.visible = false
	$Label.visible = false

	
	if Global.canCreep:
		crouch = true
	else:
		crouch = false
		
	$Player.visible = true
	start_pos = $Player.position
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level11.tscn")
		Global.level = 11
	pass


func _on_kill_body_entered(body):
	if !crouch:
		$Player.visible = false
		Global.canCreep = true
		Global.level = 5
		
		Global.labelText = $Label.text
		$Black.visible = true
		$Label.visible = true
		$AnimationPlayer.play("show")
		
		$Timer.start(5)
	else:
		$Player.position = start_pos
	pass


func _on_timer_timeout():
	$Black.visible = false
	$Label.visible = false
	get_tree().change_scene_to_file("res://Level/level1.tscn")
	pass # Replace with function body.

