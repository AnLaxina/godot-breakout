extends CharacterBody2D
# Initialize variables based on the colour of brick
@onready var yellow_group = get_tree().get_nodes_in_group("yellow")
@onready var green_group = get_tree().get_nodes_in_group("green")
@onready var orange_group = get_tree().get_nodes_in_group("orange")
@onready var red_group = get_tree().get_nodes_in_group("red")

func _ready():
	# Set the initial speed of the ball
	var speed = 600
	# Set the initial direction of the ball to a random angle
	var direction = Vector2.DOWN.rotated(randf_range(PI/3, PI/4))
	# Set the initial velocity of the ball by multiplying the speed and direction
	velocity = speed * direction
	print(yellow_group)
	
	
		
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
		
		# Checks if the ball hit any yellow bricks
		if collided_body in yellow_group:
			collided_body.queue_free()
		# Checks if ball hit any green bricks
		if collided_body in green_group:
			collided_body.queue_free()
		# Checks if ball hit any orange bricks
		if collided_body in orange_group:
			collided_body.queue_free()
		# Checks if ball hit any red bricks
		if collided_body in red_group:
			collided_body.queue_free()
		
