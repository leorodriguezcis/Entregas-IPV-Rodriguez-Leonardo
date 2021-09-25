extends KinematicBody2D
var FRICTION_WEIGHT = 0.1
var gravity = 20
var max_speed = 200
var acceleration = 1000
var motion = Vector2.ZERO
var jump_speed = -500
onready var cannon:Sprite = $Cannon

var projectile_container:Node


func set_projectile_container(container:Node):
	self.projectile_container = container
	cannon.projectile_container = container

func _physics_process(delta):
	motion.y += gravity
	move_and_slide(motion,Vector2.UP)
# Player movement
	var h_movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if h_movement_direction != 0:
		motion.x = clamp(motion.x + (h_movement_direction * acceleration), -max_speed, max_speed)
	else:
		motion.x = lerp(motion.x, 0, FRICTION_WEIGHT) if abs(motion.x) > 1 else 0
	
	
	motion = move_and_slide(motion)


	var mouse_position:Vector2 = get_global_mouse_position()
	var localPos:Vector2 = to_local(global_position)
	var direccion:Vector2 = (mouse_position - localPos).normalized()
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		cannon.fire()
		
	if Input.is_action_just_pressed("jump"):
		motion.y = jump_speed
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceletarion_):
	motion += Vector2(acceletarion_, 0)
	motion = motion.clamped(max_speed)







