extends CharacterBody2D


@export var SPEED = 200.0
var direction = 0
var stor = 1
var chicken
var old = 0
var flag = false
var heals = 10
var pin = false
var chickens

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func attack():
	get_parent().get_node("Camera2D").start_shake(0.3, 5.0)
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
			get_parent().get_node("Player/AnimatedSprite2D").play("pinok")
			get_parent().get_node("Camera2D").start_shake(0.2, 7.0)
			chickens.queue_free()
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
			$Timer.start(3)
			stor = 1
			attack()
		elif $RayCast2D2.is_colliding() and stor == 1:
			$Timer2.start(3)
			stor = -1
			attack()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		get_parent().get_node("Camera2D").start_shake(0.1, 2.0)
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == 1:
			$AnimatedSprite2D.flip_h = true
			$Area2D.position.x = -27
		else:
			$AnimatedSprite2D.flip_h = false
			$Area2D.position.x = 30
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
		chickens = chicken
		chicken = null
	pass # Replace with function body.


func _stop_boss():
	$Timer3.start(5)
	$AnimatedSprite2D.play("nagib")
	$Area2D/e.show()
	old = direction
	direction = 0
	pass # Replace with function body.


func _on_timer_3_timeout():
	$AnimatedSprite2D.play("pod")
	$Timer4.start(1)
	pass # Replace with function body.


func _on_timer_4_timeout():
	direction = stor
	old = 0
	$Area2D/e.hide()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if old != 0 and !pin:
		pin = true
	pass # Replace with function body.


func _on_timer_5_timeout():
	direction = 1
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	if direction:
		get_tree().change_scene_to_file("res://Level/level15.tscn")
	pass # Replace with function body.
