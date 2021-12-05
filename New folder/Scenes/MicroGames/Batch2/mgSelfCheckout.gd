extends Micro_Game

func _ready():
	AudioManager.play_music("mario-tenis-exhibition-court.ogg")

func _init():
	hint_string = "Checkout items!"
	time = 10
	
func _process(delta):
	if(get_tree().get_nodes_in_group("item") == []):
		game_cleared()
		force_microgame_end()

