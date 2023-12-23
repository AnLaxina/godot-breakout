extends Area2D

@onready var lives_text = $"../LivesText"
@onready var can_move = true
# Gets the paddle & ball from the 'level' scene. 
# This is another way of retrieving another scene.
@onready var player_group = get_tree().get_nodes_in_group("player")
@onready var player_paddle = player_group[0] as CharacterBody2D
@onready var player_ball = player_group[1] as CharacterBody2D

func _on_body_entered(body):
	# Deduct a life from the player once ball passes paddle
	PlayerData.player_health -= 1
	# Reload the level once the ball passes paddle
	call_deferred("reload_level")
	# If the player has no more lives, quit the game (FOR NOW)
	if PlayerData.player_health < 0:
		call_deferred("change_scene", "res://Scenes/end_screen.tscn")

func reload_level():
	# Use this line to reset the bricks if a player loses a life
	# I personally want the bricks to remain and will only be restarted if all lives reach 0
	#	get_tree().reload_current_scene()

	# Resets the paddle & ball to the original position in the 'level' scene
	player_ball.position = Vector2(300, 664)
	player_paddle.position = Vector2(296, 728)
	# Once the ball passes the paddle, both the ball and paddle will be paused
	# They can be moved again once the player hits the 'Space' button
	can_move = false
	player_paddle.set_process(can_move)
	player_ball.set_physics_process(can_move)
	# Checks the player health every time the ball passes the paddle
	match PlayerData.player_health:
		3:
			lives_text.text = "Lives: ♡♡♡"
		2:
			lives_text.text = "Lives: ♡♡"
		1:
			lives_text.text = "Lives: ♡"
		0:
			lives_text.text = "Lives: "

func _input(event):
	if event.is_action_pressed('resume') and not can_move:
		can_move = true
		player_paddle.set_process(can_move)
		player_ball.set_physics_process(can_move)

func change_scene(path):
	get_tree().change_scene_to_file(path)
