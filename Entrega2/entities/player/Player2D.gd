extends KinematicBody2D


var max_speed = 200
var acceleration = 1000
var motion = Vector2.ZERO
onready var cannon:Sprite = $Cannon

var projectile_container:Node


func set_projectile_container(container:Node):
	self.projectile_container = container
	cannon.projectile_container = container

func _physics_process(delta):
	

	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if direction_optimized == 0:
		apply_friction(acceleration*delta)
	else:
		apply_movement(direction_optimized * acceleration * delta)
	motion = move_and_slide(motion)


	var mouse_position:Vector2 = get_global_mouse_position()
	var localPos:Vector2 = to_local(global_position)
	var direccion:Vector2 = (mouse_position - localPos).normalized()
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		cannon.fire()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceletarion_):
	motion += Vector2(acceletarion_,0)
	motion = motion.clamped(max_speed)







