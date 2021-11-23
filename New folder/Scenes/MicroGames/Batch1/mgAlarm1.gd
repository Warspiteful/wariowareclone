extends Micro_Game

var speed = 30
var directionRight = true
var hitting = false

	
func _process(_delta):
	if(!hitting):
		if(directionRight):
			position = position.move_toward(Vector2(0,29.427), _delta * speed)
		else:
			position = position.move_toward(Vector2(141,29.427), _delta * speed)
			
		if(position.x < 20):
			directionRight = false
		if(position.x > 130):
			directionRight = true	
	else:
		position = position.move_toward(Vector2(position.x,100), _delta * speed*5)
		
func moveDown():
	hitting = true
	
