extends MovableGridObject

func _ready():
	pass

func _unhandled_input(event):
	if not movetween.is_active():
		for dir in VECTOR.keys():
			if event.is_action_pressed(dir):
				move(dir)
