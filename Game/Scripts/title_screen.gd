extends Control



func _ready():
	# Sets the background color to black once the game opens
	# The reason why it's coded in is so that the color in the editor isn't black too.
	RenderingServer.set_default_clear_color("black")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
