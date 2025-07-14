extends ParallaxBackground

var speed = 35
var targetPosition = -165
var start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start == true:
		speed = (scroll_offset.x - targetPosition) / 1.25
		if speed < 0:
			speed *= -1
		if scroll_offset.x > targetPosition:
			speed -= 0.7
			scroll_offset.x -= speed * delta
			$marker.position.x -= speed * delta
			if scroll_offset.x-targetPosition < 4:
				stop()
		if scroll_offset.x < targetPosition:
			speed -= 0.7
			scroll_offset.x += speed * delta
			$marker.position.x -= speed * delta
			if targetPosition-scroll_offset.x < 4:
				stop()
	else:
		scroll_offset.x -= speed * delta
		$marker.position.x -= speed * delta
	pass

func stop():
	speed = 0
	start = false
	$ParallaxLayer3/TileMap.hide()
	$ParallaxLayer2/TileMap.hide()
	$ParallaxLayer3/TileMap2/AnimationPlayer.play("F")
	pass

func _on_start_button_up():
	start = true
	pass
