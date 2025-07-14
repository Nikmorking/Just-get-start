extends ParallaxBackground

var speed = 35
var targetPosition = -155
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
				speed = 0
				start = false
		if scroll_offset.x < targetPosition:
			speed -= 0.7
			scroll_offset.x += speed * delta
			$marker.position.x -= speed * delta
			if targetPosition-scroll_offset.x < 4:
				speed = 0
				start = false
	else:
		scroll_offset.x -= speed * delta
		$marker.position.x -= speed * delta
	



func _on_start_button_up():
	
	start = true
