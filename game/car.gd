extends MovableGridObject

export(int, 0, 2, 1) var input_mode
export var region = Rect2(Vector2.ZERO, Vector2(32, 64))

var sheetnumbers = {
	"right": 0,
	"left": 32,
	"up": 64,
	"down": 96
}

onready var sprite = $Sprite/Sprite

func _ready():
	sprite.set_region_rect(region)

func _unhandled_input(event):
	if not movetween.is_active():
		match input_mode:
			0:
				for dir in VECTOR.keys():
					if event.is_action_pressed(dir):
						move(dir)
						sprite.set_region_rect(Rect2(region.position.x + sheetnumbers[dir], region.position.y, region.size.x, region.size.y))
			1:
				for dir in {"right": Vector2.RIGHT,"left": Vector2.LEFT}.keys():
					if event.is_action_pressed(dir):
						move(dir)
			2:
				for dir in {"up": Vector2.UP,"down": Vector2.DOWN}.keys():
					if event.is_action_pressed(dir):
						move(dir)
