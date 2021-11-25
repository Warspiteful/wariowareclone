extends Micro_Game


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var selected = false;

var rest_nodes = []
var rest_point
func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = null

	
func _physics_process(delta):
	clamp(global_position.y, 0,0);
	if selected:

		global_position = lerp(global_position,Vector2(get_global_mouse_position().x,global_position.y), 25 * delta)




func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			selected = false
			var shortest_dist = 20;
			for child in rest_nodes:

				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					AudioManager.play_sfx_name("correct.wav")
					queue_free()
		
