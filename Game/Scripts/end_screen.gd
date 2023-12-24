extends Control

func _ready():
	$Score.text = "Your score: " + str(PlayerData.player_score)
func _on_again_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	PlayerData.player_health = 3
	PlayerData.player_score = 0


func _on_quit_button_pressed():
	get_tree().quit()
