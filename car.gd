extends KinematicBody2D

var tile_size = 32
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
	
func _physics_process(delta):
	move()
	
	

func move():
	var dir 
	if Input.is_action_just_pressed("ui_left"):
		dir = 'left'
	elif Input.is_action_just_pressed("ui_right"):
		dir = 'right'
	elif Input.is_action_just_pressed("ui_up"):
		dir = 'up'
	elif Input.is_action_just_pressed("ui_down"):
		dir = 'down'
	if dir != null:
		position += inputs[dir] * tile_size
