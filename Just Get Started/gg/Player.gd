extends CharacterBody2D


@export var SPEED := 200.0
@export var JUMP_VELOCITY = -350.0
var dashKd: bool = false
var direction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _input(event):
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	direction = Input.get_axis("ui_left", "ui_right")
	pass



func _ready():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	pass



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == 1:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.stop()
	
	
	if Input.is_action_pressed("dash") and dashKd:
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED * 10
		elif Input.is_action_pressed("ui_left"):
			velocity.x = SPEED * -10
		$Timer2.start()
	
	
	move_and_slide()


func _on_timer_timeout():
	$Timer.stop()
	dashKd = true
	pass # Replace with function body.


func _on_timer_2_timeout():
	$Timer2.stop()
	dashKd = false
	$Timer.start()
	velocity.x = 0
	move_and_slide()
	pass # Replace with function body.
