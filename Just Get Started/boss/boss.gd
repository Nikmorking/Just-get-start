extends CharacterBody2D


@export var SPEED = 200.0
var direction = 1
var stor = 1
var chicken
var old = 0
var flag = false
var heals = 10
var pin = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func attack():
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$AnimatedSprite2D.play("atack")
	direction = 0
	chicken = load("res://boss/lava chicken.tscn").instantiate()
	chicken.global_position = position
	chicken.global_position.y += -70
	chicken.rot = stor
	pass



func _input(event):
	if pin:
		if Input.is_action_pressed("e"):
			pin = false
			if heals > 1:
				heals -= 1
				get_parent().load_bar(heals)
			elif heals == 1:
				heals = 0
				get_parent().boss_die()
			else:
				heals = 0
			_on_timer_3_timeout()
	pass


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if stor != 0:
		if $RayCast2D.is_colliding() and stor == -1:
			$Timer.start(5)
			stor = 1
			attack()
		elif $RayCast2D2.is_colliding() and stor == 1:
			$Timer2.start(5)
			stor = -1
			attack()
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



func _on_animated_sprite_2d_animation_finished():
	if chicken:
		get_parent().add_child(chicken)
		chicken = null
	pass # Replace with function body.


func _stop_boss():
	$Timer3.start(5)
	$AnimatedSprite2D.play("nagib")
	$e.show()
	old = direction
	direction = 0
	pass # Replace with function body.


func _on_timer_3_timeout():
	$AnimatedSprite2D.play("pod")
	$Timer4.start(1)
	pass # Replace with function body.


func _on_timer_4_timeout():
	direction = old
	old = 0
	$e.hide()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if old != 0 and !pin:
		pin = true
	pass # Replace with function body.
