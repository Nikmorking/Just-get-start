extends Area2D

var a = 1
var angle_naklon = 0 
var direction = Vector2(1, 0)
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angle_naklon = randf_range(0.0, 360.0 )
	direction = direction.rotated(deg_to_rad(angle_naklon))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position += $RayCast2D.target_position * speed * delta
	if (position.x >= 1085):
		speed +=10
		$RayCast2D.target_position = $RayCast2D.target_position.rotated(deg_to_rad(135))
		
	if (position.y >= 610):
		speed +=10
		$RayCast2D.target_position = $RayCast2D.target_position.rotated(deg_to_rad(135))
			
	if (position.y <= 43):
		speed +=10
		$RayCast2D.target_position = $RayCast2D.target_position.rotated(deg_to_rad(135))
		
	if (position.x <= 55):
		speed +=10
		$RayCast2D.target_position = $RayCast2D.target_position.rotated(deg_to_rad(135))
	pass

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	pass # Replace with function body.
