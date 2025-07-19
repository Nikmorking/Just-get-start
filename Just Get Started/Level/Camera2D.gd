extends Camera2D

@export var shake_duration = 0.5
@export var shake_strength = 10.0

var shake_time_left = 0.0
var original_position

func _ready():
	original_position = position

func start_shake(duration = shake_duration, strength = shake_strength):
	shake_time_left = duration
	shake_strength = strength

func _process(delta):
	if shake_time_left > 0:
		shake_time_left -= delta
		var offset = Vector2(
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0)
		) * shake_strength
		position = original_position + offset
	else:
		position = original_position
