extends Level

var dash = false
var crouch = false

func _input(event):
	if Input.is_action_just_pressed("e") && door_action:
		get_tree().change_scene_to_file("res://Level/level2.tscn")
		Global.level = 2
	pass

func _process(delta):
	if crouch:
		$gui/crouch.visible = true
		$gui/crouchButton.visible = true
		
		$gui/dash.visible = true
		$gui/q.visible = true
	elif dash:
		$"gui/???".text = "move"
		$gui/dash.visible = true
		$gui/q.visible = true
		
		$gui/crouch.visible = false
		$gui/crouchButton.visible = false
	else:
		$"gui/???".text = "???"
		$gui/dash.visible = false
		$gui/crouch.visible = false
		$gui/crouchButton.visible = false
		$gui/q.visible = false
	pass

func _ready():
	if Global.canCreep:
		crouch = true
	else:
		crouch = false
	if Global.dashKd:
		dash = true
		$AnimationPlayer.play("hide")
		$Timer.start(1)
		$Label.text = Global.labelText
		$Black.visible = true
		$Label.visible = true
	else:
		$Black.visible = false
		$Label.visible = false
		dash = false
	start_pos = $Player.position
	door_x = 717
	door_y = 34
	pass


func _on_timer_timeout():
	$Black.visible = false
	$Label.visible = false
	pass # Replace with function body.
