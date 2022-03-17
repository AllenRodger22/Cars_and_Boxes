extends Camera2D

var tracking

func _ready():
	pass # Replace with function body.

func _process(delta):
	var cars = get_tree().get_nodes_in_group("cars")
	for i in cars:
		if i.is_active: tracking = i
	
	if tracking != null:
		global_position = lerp(global_position, tracking.get_node("CollisionShape2D").global_position, 2 * delta)
