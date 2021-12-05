extends Position2D


func _draw():
	draw_circle(Vector2.ZERO, 20, Color.red)
	
func select():

	modulate = Color.white
	
func deselect():
	modulate = Color.white
	
	
