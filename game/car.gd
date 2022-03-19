extends MovableGridObject

export(int, 0, 2, 1) var input_mode
export var region = Rect2(Vector2.ZERO, Vector2(32, 64))

var sheetnumbers = {
	"right": 0,
	"left": 32,
	"up": 64,
	"down": 96
}

var is_active = false

onready var sprite = $Sprite/Sprite

func _ready():
	sprite.set_region_rect(region)
	$Sprite/Area2D.connect("input_event", self, "_input_event")

func _unhandled_input(event):
	if is_active:
		if not movetween.is_active():
			match input_mode:
				0:
					for dir in VECTOR.keys():
						if event.is_action_pressed(dir):
							move(dir)
							sprite.set_region_rect(Rect2(region.position.x + sheetnumbers[dir], region.position.y, region.size.x, region.size.y))
							if dir == "right" or dir == "left":
								graphical_tween("scale:y", "scale:x")
							else:
								graphical_tween("scale:x", "scale:y")
				1:
					for dir in {"right": Vector2.RIGHT,"left": Vector2.LEFT}.keys():
						if event.is_action_pressed(dir):
							move(dir)
							graphical_tween("scale:y", "scale:x")
				2:
					for dir in {"up": Vector2.UP,"down": Vector2.DOWN}.keys():
						if event.is_action_pressed(dir):
							move(dir)
							graphical_tween("scale:x", "scale:y")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		get_tree().call_group("cars", "deactivate")
		set_deferred("is_active", true)
		
		var twn = $Sprite/Tween
		twn.interpolate_property($Sprite, "scale:y", 0.5, 1.0, 1.0, twn.TRANS_ELASTIC, twn.EASE_OUT)
		twn.start()

func deactivate():
	is_active = false

func graphical_tween(x, y):
	var twn = $Sprite/Tween
	twn.interpolate_property($Sprite, x, .75, 1.0, .2, twn.TRANS_SINE, twn.EASE_OUT)
	twn.start()
	var ytwn = $Sprite/yTween
	ytwn.interpolate_property($Sprite, y, 1.2, 1.0, .2, ytwn.TRANS_SINE, ytwn.EASE_OUT)
	ytwn.start()

func leave():
	var twn = Tween.new()
	add_child(twn)
	twn.interpolate_property(sprite, "modulate", null, Color(1, 1, 1, 0), .25, twn.TRANS_SINE, twn.EASE_OUT)
	twn.start()
	yield(get_tree().create_timer(.25), "timeout")
	queue_free()
