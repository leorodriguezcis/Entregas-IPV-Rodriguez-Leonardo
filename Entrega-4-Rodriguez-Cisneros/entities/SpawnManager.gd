extends Node

export (NodePath) var pathFindifng


func _ready():
	if pathFindifng.is_empty():
		return
	
	var pathfinder:PathfindAstar = get_node(pathFindifng)
	if pathfinder == null:
		return
	
	for child in get_children():
		if child is Turret:
			child.pathFinding = pathfinder
