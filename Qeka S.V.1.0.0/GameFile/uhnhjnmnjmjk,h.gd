extends Area2D

@export var scane : PackedScene

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ratatuy"):
		queue_free()

pass
