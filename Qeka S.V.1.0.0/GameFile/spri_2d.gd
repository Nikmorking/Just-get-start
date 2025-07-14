extends Sprite2D

var a = 1
var angle_naklon = 0 
var direction = Vector2(1, 0)
var speed = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angle_naklon = randf_range(0.0, 360.0 )
	direction = direction.rotated(deg_to_rad(angle_naklon))
	print(direction)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	position += direction * speed * delta
	if (position.x >= 1085):
		speed +=5
		direction = direction.rotated(deg_to_rad(randi_range(100, 240)))
		print(direction)
		
	if (position.y >= 610):
		speed +=5
		direction = direction.rotated(deg_to_rad(randi_range(210, 330)))
		print(direction)
			
	if (position.y <= 39):
		direction = direction.rotated(deg_to_rad(randi_range(210, 330)))
		print(direction)
		speed +=5
			
	if (position.x <= 55):
		direction = direction.rotated(deg_to_rad(randi_range(100, 240)))
		print(direction)
		speed +=5
pass
