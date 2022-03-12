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

func move(dir):
	raycast.cast_to = VECTOR[dir] * tile_size
	raycast.force_raycast_update()
	if raycast.is_colliding():
		if raycast.get_collider().has_method("move"):
			if raycast.get_collider().move(dir):
				position += VECTOR[dir] * tile_size
				return true
			else:
				return false
	else:
		position += VECTOR[dir] * tile_size
		return true

