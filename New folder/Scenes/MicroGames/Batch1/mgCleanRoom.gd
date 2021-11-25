extends Micro_Game

func _ready():
	AudioManager.play_music("mario-tenis-exhibition-court.ogg")

func _process(delta):
	if(get_tree().get_nodes_in_group("trash") == []):

		game_cleared()

