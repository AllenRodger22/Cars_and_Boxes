extends Camera2D

var tracking
var level = true

func _process(delta):
	var cars = get_tree().get_nodes_in_group("cars")
	if cars.empty():
		if level: LevelLoad.load_next_level(); level = false
	for i in cars:
		if i.is_active: tracking = i
	
	if tracking != null and is_instance_valid(tracking):
		global_position = tracking.get_node("CollisionShape2D").global_position
