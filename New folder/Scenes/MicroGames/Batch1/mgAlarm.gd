extends Micro_Game

onready var table = $Table
onready var anim = $HitAnim
onready var hit_point = $Hand/HitPoint
onready var hit_area = $Hand/HitPoint/Area2D
onready var sfx_hit = AudioManager.get_sound_id("yoshi-tongue.wav")
onready var hand = $Hand

onready var tween = $Tween


var hitting = false
var game_over = false
var alarm = null

func get_hint_string():
	return "Hit the Alarm!"
func _init():
	time = 10
		
func _ready():
	AudioManager.play_music("fulfilled.ogg")
	#tween.interpolate_property(hand, "position", Vector2(hand.get_position()),Vector2(hand.get_position().x,0), 1)
	#tween.interpolate_callback(force_microgame_end())
	pass



func _process(delta):
	if !game_over:
		if !hitting:
			if Input.is_action_just_pressed("a"):
				hand.moveDown()
				hitting = true
				AudioManager.play_sfx(sfx_hit)
		else:
			var areas = hit_area.get_overlapping_areas()
			for a in areas:
				alarm = a.get_parent()
				if alarm.frame == 1:

					game_cleared()
					break
			force_microgame_end()

			if alarm != null:
				alarm.global_position = hit_point.global_position
