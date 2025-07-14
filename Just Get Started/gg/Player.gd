extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 100
var jump_force = 250

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") && is_on_floor():
		jump(jump_force)
		
	if velocity.y >= 500:
		velocity.y = 500
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		$AnimatedSprite2D.flip_h = (direction == -1)
	velocity.x = direction  * speed 
	move_and_slide()
	update_animations(direction)
	
func jump(force):
	velocity.y = -force
	
	
func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("fall")
