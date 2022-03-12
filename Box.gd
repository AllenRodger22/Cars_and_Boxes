extends KinematicBody2D
var tile_size = 32
var SPEED = 1
var directions = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func _on_Player_PUSH(dir):
		if dir == 'left':
			position.x -= SPEED * tile_size
		elif dir == 'right':
			position.x += SPEED * tile_size
		elif dir == 'up':
			position.y -= SPEED * tile_size
		elif dir == 'down': # Replace with function body.
			position.y += SPEED * tile_size

