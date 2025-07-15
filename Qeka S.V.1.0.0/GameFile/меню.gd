extends Node2D

var s = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_snmjmtart_button_down() -> void:
	get_tree().change_scene_to_file("res://Платформер.tscn")
	pass # Replace with function body.


func _on_exet_brgutton_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func gbgb() -> void:
	get_tree().change_scene_to_file("res://Инфа.tscn")
	pass # Replace with function body.



	
	
