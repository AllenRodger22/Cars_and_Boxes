extends KinematicBody2D

class_name MovableGridObject, "res://game/MovableGridObject.svg"

const tile_size := 32
const VECTOR := {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

onready var movetween = get_node("Tween")

func move(dir):
	var world = get_world_2d().direct_space_state

	var query = Physics2DShapeQueryParameters.new()
	query.set_shape($CollisionShape2D.shape)
	query.set_transform($CollisionShape2D.global_transform * Transform2D(0, VECTOR[dir]*tile_size))
	query.set_margin(-1)
	query.set_exclude([self])
	var array = world.intersect_shape(query)
	
	for result in array.size():
		if array[result].collider.has_method("move"):
			if array[result].collider.move(dir):
				interpolate("position", position, position + VECTOR[dir] * tile_size)
				return true
			else:
				return false
		else:
			return false
	
	interpolate("position", position, position + VECTOR[dir] * tile_size)
	return true



func interpolate(property, initial, target):
	movetween.interpolate_property(self, property, initial, target, .08, movetween.TRANS_SINE, movetween.EASE_OUT)
	movetween.start()

