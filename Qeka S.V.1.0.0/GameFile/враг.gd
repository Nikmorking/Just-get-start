extends CharacterBody2D

var direction = 1
@export var speed = 700

func _physics_process(delta):
	
	if (!$Pravo.is_colliding() or !$Levo.is_colliding()):
		direction *= -1
	
	velocity.x = direction * speed * delta
	
	move_and_slide()
	pass
