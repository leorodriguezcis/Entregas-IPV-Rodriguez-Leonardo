extends Sprite

var speed = 200 #Pixeles
onready var cannon:Sprite = $Cannon

var projectile_container:Node


func set_projectile_container(container:Node):
	self.projectile_container = container
	cannon.projectile_container = container

func _physics_process(delta):
	

	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	position.x += direction_optimized * speed * delta

	var mouse_position:Vector2 = get_global_mouse_position()
	var localPos:Vector2 = to_local(global_position)
	var direccion:Vector2 = (mouse_position - localPos).normalized()
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		cannon.fire()
		
	
