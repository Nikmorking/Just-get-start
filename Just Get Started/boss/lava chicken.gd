extends Node2D

@export var speed = 100
var rot = 0
var down = false
var stop =  false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !stop:
		position.x += speed * rot
		if down: position.y += 5
	pass


func _on_timer_timeout():
	down = true
	pass # Replace with function body.




func _on_area_2d_body_entered(body):
	stop = true
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	get_parent().stop_boss()
	$Timer2.start()
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body):
	get_tree().change_scene_to_file("res://Level/level15.tscn")
	pass # Replace with function body.


func _on_timer_2_timeout():
	queue_free()
	pass # Replace with function body.
