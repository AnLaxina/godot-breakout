extends Node2D

# Initialize variables based on the colour of brick
@onready var yellow_group = get_tree().get_nodes_in_group("yellow")
@onready var green_group = get_tree().get_nodes_in_group("green")
@onready var orange_group = get_tree().get_nodes_in_group("orange")
@onready var red_group = get_tree().get_nodes_in_group("red")

@onready var score_text = $ScoreText
@onready var pause_menu = $PauseMenu

func _ready():
	# Sets the background color to black once the game opens
	# The reason why it's coded in is so that the color in the editor isn't black too.
	RenderingServer.set_default_clear_color("black")
	
	score_text.text = "Score : " + str(PlayerData.player_score)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu.show()
		get_tree().paused = true

# A custom signal that stems from ball.gd
# This signal is emitted whenever the ball hits any physics object
func _on_ball_on_broken_brick(body):                                       
	# Checks if the ball hit any yellow bricks
		if body in yellow_group:
			body.queue_free()
			PlayerData.player_score += 1
		# Checks if ball hit any green bricks
		if body in green_group:
			body.queue_free()
			PlayerData.player_score += 3
		# Checks if ball hit any orange bricks
		if body in orange_group:
			body.queue_free()
			PlayerData.player_score += 5
		# Checks if ball hit any red bricks
		if body in red_group:
			body.queue_free()
			PlayerData.player_score += 7
		
		# Set player score on screen
		score_text.text = "Score : " + str(PlayerData.player_score)
