extends CharacterBody2D

var speed = 500
var mouse_position = Vector2()
func _process(delta):
	#if (Input.is_action_pressed("go_up")):
		#position.y -= speed * delta
	#if (Input.is_action_pressed("go_down")):
		#position.y += speed * delta
	#if (Input.is_action_pressed("go_left")):
		#position.x -= speed * delta
	#if (Input.is_action_pressed("go_right")):
		#position.x += speed * delta
	mouse_position = get_global_mouse_position()
	if (mouse_position.y > 0 and mouse_position.y < 620):
		position.y = mouse_position.y
	if (mouse_position.x > 0 and mouse_position.x < 1090):
		position.x = mouse_position.x
pass
