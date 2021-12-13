extends Micro_Game

onready var lock = $lock

func _init():
	time = 5
	hint_string = "Unlock your Phone!"
	
func _ready():
	AudioManager.play_music("mario-tenis-exhibition-court.ogg")

func _process(delta):
	if($lock == null):
		game_cleared()
		force_microgame_end()


