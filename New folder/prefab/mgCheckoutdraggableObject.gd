extends Micro_Game


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var selected = false;
var scanned = false;
var rest_nodes = []
var scanner_node = []
var rest_point
var scanner_point

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	scanner_node = get_tree().get_nodes_in_group("scanner")
	rest_point = null
	scanner_point = null

	
func _physics_process(delta):
	
	if selected:
		global_position = lerp(global_position,get_global_mouse_position(), 25 * delta)



func _on_Area2D_input_event(viewport, event, shape_idx):

	if Input.is_action_just_pressed("click"):
		selected = true
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			selected = false
			var shortest_dist = 20;
			var shortest_dist_scan = 20;
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist && scanned:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					AudioManager.play_sfx_name("correct.wav")
					queue_free()
			for child in scanner_node:
				var distance_scan = global_position.distance_to(child.global_position)
				if distance_scan < shortest_dist:
					child.select()
					scanner_point = child.global_position
					shortest_dist_scan = distance_scan
					scanned = true;
					AudioManager.play_sfx_name("correct.wav")
		
