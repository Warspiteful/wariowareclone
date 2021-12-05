extends Micro_Game


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	hint_string = "Mash the Browser!"
	time = 10
	

func _process(delta):
	if($ProgressBar.value >= 100):
		game_cleared()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		$ProgressBar.value += 5
