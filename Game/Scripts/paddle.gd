extends CharacterBody2D


@export var paddle_speed : int = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the direction of the paddle based on the input that is pressed
	var direction : int = Input.get_axis("move_left", "move_right")
	# Adjust the built-in velocity in the x-direction based on the speed and direction
	velocity.x = paddle_speed * direction
	# Apply the velocity
	move_and_collide(velocity * delta)
	
