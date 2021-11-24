extends Micro_Game


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var selected = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
		
