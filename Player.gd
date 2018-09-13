extends RigidBody2D

var canJump = true
var distance = 0
var speed = 200

func _physics_process(delta):
	
	# init
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	var area = get_node("Area2D")
	var sprite = get_node("Sprite")
	var mousePos = get_node("Camera2D").get_global_mouse_position()
	var direction = (mousePos - self.position).normalized()
	
	# X-axis movement follows cursor
	self.set_axis_velocity(Vector2(direction.x*speed,0))
	
	# Y-axis movement, jump once when click
	if Input.is_action_just_released("click") and canJump:
		self.set_axis_velocity(Vector2(0,-300))
		canJump = false
	
	# Checks if character is on a ledge
	if self.linear_velocity.y < -1:
		area.monitoring = false
	else:
		area.monitoring = true
		if area.get_overlapping_bodies().size() >= 1:
			canJump = true
	
	# calculate score
	if self.linear_velocity.y > 1:
		distance += 1
	elif self.linear_velocity.y < 0 and distance > 0:
		distance -=1
	
	# show if you can jump with color
	if canJump:
		sprite.modulate = Color(1,0,0,1)
	else:
		sprite.modulate = Color(1,1,1,1)
		