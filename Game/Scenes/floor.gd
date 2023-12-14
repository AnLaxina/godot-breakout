extends Area2D


@onready var lives_text = $"../LivesText"

func _on_body_entered(body):
	PlayerData.player_health -= 1
	call_deferred("reload_level", body)
	if PlayerData.player_health < 0:
		get_tree().quit()

func reload_level(ball : CharacterBody2D):
	# Use this line to reset the bricks if a player loses a life
	# I personally want the bricks to remain and will only be restarted if all lives reach 0
	#	get_tree().reload_current_scene()
	ball.position = Vector2(300, 664)
	match PlayerData.player_health:
		3:
			lives_text.text = "Lives: ♡♡♡"
		2:
			lives_text.text = "Lives: ♡♡"
		1:
			lives_text.text = "Lives: ♡"
		0:
			lives_text.text = "Lives: "
