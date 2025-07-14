extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$Sprite2D.play("jamp")
		print(is_on_floor())
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if (velocity.x > 0 and is_on_floor()):
		$Sprite2D.play("run")
		$Sprite2D.flip_h = false
	if (velocity.x < 0 and is_on_floor()):
		$Sprite2D.flip_h = true
		$Sprite2D.play("run")
	if (velocity.x == 0 and is_on_floor()):
		$Sprite2D.play("idle")

	if(velocity.x > 0):
		$Sprite2D.flip_h = false
	if(velocity.x < 0):
		$Sprite2D.flip_h = true
	move_and_slide()
	
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "uhnhjnmnjmjk,h"):
		queue_free()
