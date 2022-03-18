extends StaticBody2D

var blocks := []
var is_open = false

func _ready():
	for child in get_child_count():
		blocks.insert(blocks.size(), get_child(child))

func _on_Button_update_door(open):
	if open:
		is_open = true
		for block in blocks:
			var twn = block.get_node("Tween")
			var sprite = block.get_node("Sprite")
			twn.interpolate_property(sprite, "scale:y", null, 0, .5, twn.TRANS_SINE, twn.EASE_IN)
			twn.start()
			yield(get_tree().create_timer(.5), "timeout")
			if is_open: block.set_deferred("disabled", true)
	else:
		is_open = false
		for block in blocks:
			block.set_deferred("disabled", false)
			var twn = block.get_node("Tween")
			var sprite = block.get_node("Sprite")
			twn.interpolate_property(sprite, "scale:y", null, 1, .5, twn.TRANS_SINE, twn.EASE_OUT)
			twn.start()




func _on_Button2_update_door(open):
	pass # Replace with function body.
