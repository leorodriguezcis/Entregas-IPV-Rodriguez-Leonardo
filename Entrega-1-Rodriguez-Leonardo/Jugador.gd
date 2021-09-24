extends Sprite

export (int) var velocidad
var movimiento = Vector2()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimiento = Vector2()
	if Input.is_action_pressed("dir_right"):
		movimiento.x += 1
	if Input.is_action_pressed("dir_left"):
		movimiento.x -= 1
	position+= movimiento * delta * velocidad
