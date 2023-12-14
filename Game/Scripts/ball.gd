extends CharacterBody2D

# Create custom_signal that is emitted whenever a brick is destroyed
# Parameter/Argument: The body that the ball hits
signal on_broken_brick(body)

func _ready():
	# Set the initial speed of the ball
	var speed = 600
	# Set the initial direction of the ball to a random angle
	var direction = Vector2.DOWN.rotated(randf_range(PI/3, PI/4))
	# Set the initial velocity of the ball by multiplying the speed and direction
	velocity = speed * direction

		
func _physics_process(delta):
	# Can give us info on how the collision occurred (how it stopped, what body, etc.) 
	var collision_info = move_and_collide(velocity * delta)
	
	# If something is hitting the ball, it is true
	if collision_info:
		# Pushes the ball back in the opposite direction of the body that it hit
		# A normal vector helps us achieve this by returning the oppposite direction
		velocity = velocity.bounce(collision_info.get_normal())
		# Returns the body that the ball collided with
		var collided_body = collision_info.get_collider()
		# Whenever the ball hits a physics object, emit the signal
		on_broken_brick.emit(collided_body)
		
		
		
