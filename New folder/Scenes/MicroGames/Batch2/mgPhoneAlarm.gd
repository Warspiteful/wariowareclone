extends Micro_Game

onready var lock = $lock

func _ready():
	AudioManager.play_music("mario-tenis-exhibition-court.ogg")

func _process(delta):
	if($lock == null):
		game_cleared()

