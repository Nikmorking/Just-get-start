extends CharacterBody2D


@export var SPEED := 250.0
@export var JUMP_VELOCITY = -350.0
var dashKd: bool = true
var dashBlock: bool = false
var direction
var lest = false

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
	if not is_on_floor() and dashKd:
		velocity.y += gravity * delta
	if lest:
		if Input.is_action_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY/3
		else:
			velocity.y = JUMP_VELOCITY/-15
	# Handle jump.
	
	if direction and dashKd:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == 1:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	elif dashKd:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.stop()
	
	
	if Input.is_action_pressed("dash") and (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")) and dashKd and dashBlock:
		velocity.x = 0
		velocity.y = 0
		dashKd = false
		$Timer.start()
	
	
	move_and_slide()


func _on_timer_timeout():
	if dashKd == false:
		dashKd = true
		dashBlock = false
		
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED * 150
		elif Input.is_action_pressed("ui_left"):
			velocity.x = SPEED * -150
			
		move_and_slide()
		$Timer.wait_time = 2
		$Timer.start()
	else:
		$Timer.wait_time = 0.1
		dashBlock = true
	pass # Replace with function body.


func _lest(body):
	if body == self:
		lest = true
	pass # Replace with function body.


func _on_lest(body):
	if body == self:
		lest = false
		velocity.y -= JUMP_VELOCITY/2
	pass # Replace with function body.
