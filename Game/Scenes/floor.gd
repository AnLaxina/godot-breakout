extends Area2D

@onready var lives_text = $"../LivesText"


func _on_body_entered(body):
	# Deduct a life from the player once ball passes paddle
	PlayerData.player_health -= 1
	# Reload the level once the ball passes paddle
	call_deferred("reload_level", body)
	# If the player has no more lives, quit the game (FOR NOW)
	if PlayerData.player_health < 0:
		get_tree().quit()

func reload_level(ball : CharacterBody2D):
	# Use this line to reset the bricks if a player loses a life
	# I personally want the bricks to remain and will only be restarted if all lives reach 0
	#	get_tree().reload_current_scene()
	
	# Gets the paddle from the 'level' scene. This is another way of retrieving another scene
	var paddle = get_tree().get_first_node_in_group("player") as CharacterBody2D
	ball.position = Vector2(300, 664)
	paddle.position = Vector2(296, 728)
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
