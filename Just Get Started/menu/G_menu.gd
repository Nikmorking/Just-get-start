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
	$Start/startButtonOn.stop()
	$Start.scale.x = 3.05
	$Start.scale.y = 3.05
func _on_start_button_up():
	$Start/startButtonOn.stop()
	$Start.scale.x = 3.2
	$Start.scale.y = 3.2

func _on_settings_button_down():
	$Settings/animation.stop()
	$Settings.scale.x = 3.05
	$Settings.scale.y = 3.05
func _on_settings_button_up():
	$Settings/animation.stop()
	$Settings.scale.x = 3.2
	$Settings.scale.y = 3.2

func _on_quit_button_down():
	$Quit/animation.stop()
	$Quit.scale.x = 3.05
	$Quit.scale.y = 3.05
func _on_quit_button_up():
	$Quit/animation.stop()
	$Quit.scale.x = 3.2
	$Quit.scale.y = 3.2
