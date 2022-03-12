extends KinematicBody2D

class_name MovableGridObject, "res://game/MovableGridObject.svg"

const tile_size := 32
const VECTOR := {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

onready var raycast = get_node("RayCast2D")
onready var movetween = get_node("Tween")

func move(dir):
	raycast.cast_to = VECTOR[dir] * tile_size
	raycast.force_raycast_update()
	if raycast.is_colliding():
		if raycast.get_collider().has_method("move"):
			if raycast.get_collider().move(dir):
				interpolate("position", position, position + VECTOR[dir] * tile_size)
				return true
			else:
				return false
	else:
		interpolate("position", position, position + VECTOR[dir] * tile_size)
		return true

func interpolate(property, initial, target):
	movetween.interpolate_property(self, property, initial, target, .08, movetween.TRANS_SINE, movetween.EASE_OUT)
	movetween.start()

