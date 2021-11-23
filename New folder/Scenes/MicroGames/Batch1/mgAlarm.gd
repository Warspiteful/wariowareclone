extends Micro_Game

onready var table = $Table
onready var anim = $HitAnim
onready var hit_point = $HitPoint
onready var hit_area = $LickPoint/Area2D
onready var sfx_hit = AudioManager.get_sound_id("yoshi-tongue.wav")
onready var hand = $Hand

onready var tween = $Tween


var hitting = false
var game_over = false
var alarm = null
func _init():
	time = 10
		
func _ready():
	AudioManager.play_music("fulfilled.ogg")
	#tween.interpolate_property(hand, "position", Vector2(hand.get_position()),Vector2(hand.get_position().x,0), 1)
	#tween.interpolate_callback(force_microgame_end())
	pass

func _on_anim_finished(a):
	anim.play("d")
	if a == "Hit":
		hitting = false
		if alarm != null:
			force_microgame_end()
			alarm.queue_free()
			alarm = null
	
	
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
			if alarm.frame == alarm:
				game_cleared()
			break
		if alarm != null:
			alarm.global_position = hit_point.global_position
