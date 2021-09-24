extends Node

export (PackedScene) var enemyScene

func spawn():
	var area = $SpawnArea
	var pos = area.rect_position + Vector2(rand_range(0,1) * area.rect_size.x,rand_range(0,1) *  area.rect_size.y)
	$Spawner2.position = pos 
	var enemigo = enemyScene.instance()
	add_child(enemigo)
	enemigo.position = $Spawner2.position
	enemigo.set_values($Player2D, self)
	
func spwanEnemies(cantidad:int):
	for i in range(cantidad):
		spawn()

func _ready():
	$Player2D.set_projectile_container(self)
	spwanEnemies(3)

