extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_mouse_entered():
	$Start/startButtonOn.play("startButton")
func _on_start_mouse_exited():
	$Start/startButtonOn.play("offButton")

func _on_settings_mouse_entered():
	$Settings/animation.play("on")
func _on_settings_mouse_exited():
	$Settings/animation.play("off")

func _on_quit_mouse_entered():
	$Quit/animation.play("on")
func _on_quit_mouse_exited():
	$Quit/animation.play("off")

func _on_start_button_down():
	$Start.scale.x = 2.95
	$Start.scale.y = 2.95
func _on_start_button_up():
	$Start.scale.x = 3
	$Start.scale.y = 3

func _on_settings_button_down():
	$Settings.scale.x = 2.95
	$Settings.scale.y = 2.95
func _on_settings_button_up():
	$Settings.scale.x = 3
	$Settings.scale.y = 3

func _on_quit_button_down():
	$Quit.scale.x = 2.95
	$Quit.scale.y = 2.95
func _on_quit_button_up():
	$Quit.scale.x = 3
	$Quit.scale.y = 3
