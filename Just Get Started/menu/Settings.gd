extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volume(value_changed):
	if value_changed:
		Global.volume = $HSlider.value
		get_parent().get_node("Audio")._set_volume()
	pass # Replace with function body.

func set_value():
	$HSlider.value = Global.volume
	pass


func _on_del_data():
	Global.del_data()
	$Label/AnimationPlayer.play("del")
	pass # Replace with function body.
