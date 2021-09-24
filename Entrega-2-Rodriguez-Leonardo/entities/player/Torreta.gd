extends Sprite

export (PackedScene) var projectile_scene
var player
var projectile_container:Node
onready var fire_position = $Fire_Position

func set_values(player:KinematicBody2D, container:Node):
	self.player = player
	projectile_container= container
	$Timer.start()

func _on_Timer_timeout():
	fire()

func fire():
	var projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.connect("delete_requested",self, "_on_projectile_delete_requested")

func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
