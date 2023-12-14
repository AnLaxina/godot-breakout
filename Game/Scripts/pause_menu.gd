extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# if the user presses the Space button, resume
	if Input.is_action_just_pressed("resume"):
		hide()
		get_tree().paused = false
	# if the user presses the `q` button, quit the game
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
		
