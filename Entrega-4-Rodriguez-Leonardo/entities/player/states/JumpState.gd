extends "res://entities/AbstractState.gd"

# Initialize the state. E.g. change the animation
func enter():
	parent.velocity.y -= parent.jump_speed
	parent.snap_vector = Vector2.ZERO

# Clean up the state. Reinitialize values like a timer
func exit():
	return


func handle_input(event:InputEvent):
	return


func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_deacceleration()
	parent._handle_move_input()
	parent._apply_movement()
	if PlayerData.current_health <= 0:
		emit_signal("finished", "death")
	if parent.is_on_floor():
		if parent.move_direction != 0:
			emit_signal("finished", "walk")
		else:
			emit_signal("finished", "idle")
	

func _on_animation_finished(anim_name:String):
	return
