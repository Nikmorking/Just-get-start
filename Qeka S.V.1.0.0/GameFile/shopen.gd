extends Area2D

@export var scane : String

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ratatuy"):
		get_tree().change_scene_to_file( "res://Платформер.tscn")
	pass # Replace with function body.
