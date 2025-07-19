extends CharacterBody2D


@export var SPEED = 200.0
var direction = 1
var stor = 1


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if stor != 0:
		if $RayCast2D.is_colliding() and stor == -1:
			$Timer.start(5)
			stor = 1
			$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
			$AnimatedSprite2D.play("atack")
			direction = 0
		elif $RayCast2D2.is_colliding() and stor == 1:
			$Timer2.start(5)
			$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
			$AnimatedSprite2D.play("atack")
			direction = 0
			stor = -1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == 1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	pass


func _on_timer_timeout():
	direction = 1
	pass # Replace with function body.




func _on_timer_2_timeout():
	direction = -1
	pass # Replace with function body.
