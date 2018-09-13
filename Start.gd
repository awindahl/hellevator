extends StaticBody2D

func _ready():

	pass

func _physics_process(delta):
	if Input.is_action_just_released("click"):
		self.queue_free()