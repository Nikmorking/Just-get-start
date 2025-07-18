extends CharacterBody2D


@export var SPEED := 200.0
@export var JUMP_VELOCITY = -350.0
var timerBlock: bool = true
var dashFlag: bool = false
var shiftFlag: bool = true
var shiftBlock: bool = false
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
	if not is_on_floor():
		velocity.y += gravity * delta
	if lest and timerBlock:
		$AnimatedSprite2D.play("lest")
		if Input.is_action_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY/3
		elif Input.is_action_pressed("ui_down"):
			velocity.y = JUMP_VELOCITY/-3
		else:
			velocity.y = JUMP_VELOCITY/-10
	
	
	if Input.is_action_pressed("shift") and shiftFlag and shiftBlock:
		shiftFlag = false
		$CollisionShape2D.scale.y = $CollisionShape2D.scale.y / 2
		$CollisionShape2D.position = Vector2(-6, -4)
		$AnimatedSprite2D.play("shift_start")
	elif Input.is_action_just_released("shift") and shiftBlock:
		shiftBlock = false
	elif Input.is_action_pressed("shift") and not shiftFlag and not shiftBlock:
		$CollisionShape2D.scale.y = $CollisionShape2D.scale.y * 2
		$CollisionShape2D.position = Vector2(-7, -36)
	elif Input.is_action_just_released("shift"):
		shiftBlock = true

	if direction:
		if not shiftFlag:
			velocity.x = direction * SPEED / 3
		else:
			velocity.x = direction * SPEED
			
		if timerBlock and shiftFlag:
			$AnimatedSprite2D.play("run")
		if direction == 1:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		if not shiftFlag:
			velocity.x = move_toward(velocity.x, 0, SPEED / 3)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if !lest and timerBlock and shiftFlag:
			$AnimatedSprite2D.play("stay")
	
	
	if (Input.is_action_pressed("dash") or dashFlag) and Global.dashKd:
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED * 3
			dashFlag = true
			if timerBlock:
				$AnimatedSprite2D.play("dash")
				$Timer.start()
				timerBlock = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = SPEED * -3
			dashFlag = true
			if timerBlock:
				$AnimatedSprite2D.play("dash")
				$Timer.start()
				timerBlock = false
	
	
	move_and_slide()

func _on_timer_timeout():
	if Global.dashKd:
		dashFlag = false
		timerBlock = true
		Global.dashKd = false
		velocity.x = 0
		move_and_slide()
		$Timer.wait_time = 1
		$Timer.start()
	elif !Global.dashKd:
		$Timer.wait_time = 0.2
		Global.dashKd = true
	pass # Replace with function body.


func _lest(body):
	if body == self:
		lest = true
	pass # Replace with function body.


func _on_lest(body):
	if body == self:
		lest = false
		velocity.y -= JUMP_VELOCITY/2
		$AnimatedSprite2D.stop()
	pass # Replace with function body.

func animation_finished():
	if $AnimatedSprite2D.animation == "shift_start":
		$AnimatedSprite2D.play("shift")
	if $AnimatedSprite2D.animation == "shiftEnd":
		shiftFlag = true
	pass # Replace with function body.
