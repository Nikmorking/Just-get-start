extends Control

var music = true
var menuState = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if music:
		$music/music.texture_normal = $music/mute.texture_normal
	else:
		$music/music.texture_normal = $music/unmute.texture_normal
	pass
	
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_settings_line_button_up()
	pass


func menu(state):
	$GuiMenu.visible = state
	$continue.visible = state
	$music.visible = state
	$exit.visible = state
	$settings.visible = state
	menuState = state
	get_tree().paused = state
	pass


func _on_texture_button_mouse_entered():
	$continue/Animation.play("on")
	pass
func _on_texture_button_mouse_exited():
	$continue/Animation.play("off")
	pass
func _on_texture_button_button_down():
	$continue/Animation.stop()
	$continue.scale.x = 2
	$continue.scale.y = 2
	pass # Replace with function body.
func _on_texture_button_button_up():
	$continue/Animation.stop()
	$continue.scale.x = 2.15
	$continue.scale.y = 2.15
	_on_settings_line_button_up()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Level/level%s.tscn" % Global.level)

func _on_music_mouse_entered():
	$music/Animation.play("on")
	pass # Replace with function body.
func _on_music_mouse_exited():
	$music/Animation.play("off")
	pass # Replace with function body.
func _on_music_button_down():
	$music/Animation.stop()
	$music/music.scale.x = 2
	$music/music.scale.y = 2
	pass # Replace with function body.
func _on_music_button_up():
	$music/Animation.stop()
	if music:
		music = false
	else:
		music = true
	$music/music.scale.x = 2.15
	$music/music.scale.y = 2.15
	pass # Replace with function body.


func _on_exit_mouse_entered():
	$exit/Animation.play("on")
	pass # Replace with function body.
func _on_exit_mouse_exited():
	$exit/Animation.play("off")
	pass # Replace with function body.
func _on_exit_button_down():
	$exit/Animation.stop()
	$exit.scale.x = 2
	$exit.scale.y = 2
	pass # Replace with function body.
func _on_exit_button_up():
	$exit/Animation.stop()
	$exit.scale.x = 2.15
	$exit.scale.y = 2.15
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/Menu.tscn")
	pass # Replace with function body.


func _on_settings_mouse_entered():
	$settings/Animation.play("on")
	pass
func _on_settings_mouse_exited():
	$settings/Animation.play("off")
	pass # Replace with function body.
func _on_settings_button_down():
	$settings/Animation.stop()
	$settings.scale.x = 2
	$settings.scale.y = 2
	pass # Replace with function body.
func _on_settings_button_up():
	$settings/Animation.stop()
	$settings.scale.x = 2.15
	$settings.scale.y = 2.15
	pass # Replace with function body.


func _on_settings_line_button_up():
	if menuState:
		$AnimationPlayer.play("off")
		$Timer.start(0.6)
		print(menuState)
	else:
		menu(true)
		$AnimationPlayer.play("on")
		print(menuState)
	pass
func _on_timer_timeout():
	menu(false)
	pass # Replace with function body.
