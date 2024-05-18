extends Camera2D

var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 20))


func get_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	
	if player_nodes.size() > 0:
		var player_node = player_nodes[0] as Node2D
		target_position = player_node.global_position
