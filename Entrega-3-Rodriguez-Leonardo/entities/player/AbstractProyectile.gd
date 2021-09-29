extends Sprite



var direction:Vector2

export (float) var speed

signal delete_requested(projectile)

func _ready():
	set_physics_process(false)
	
func set_starting_values(starting_position:Vector2, direction:Vector2):
	global_position= starting_position 
	self.direction = direction
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta):
	position += direction * speed * delta


func _on_Timer_timeout():
	emit_signal("delete_requested",self)


func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("delete_requested",self)
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
	
func _on_Area2D_body_entered(body):
	if body is Player:
		_remove()
		body._destroy()
