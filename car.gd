extends KinematicBody2D

var tile_size = 32
var SPEED = 1
signal PUSH(dir)
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _ready():
	pass
	
	
func _physics_process(delta):
	move()
	
	
func move():
	var dir 
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed('ui_left'):
		dir = 'left'
		velocity = inputs['left'] * SPEED * tile_size
	elif Input.is_action_just_pressed('ui_right'):
		dir = 'right'
		velocity = inputs['right'] * SPEED * tile_size
	elif Input.is_action_just_pressed('ui_up'):
		dir = 'up'
		velocity = inputs['up'] * SPEED * tile_size
	elif Input.is_action_just_pressed('ui_down'):
		dir = 'down'
		velocity = inputs['down'] * SPEED * tile_size
	else:
		velocity = Vector2.ZERO
	var collision = move_and_collide(velocity)
	if collision:
		if collision.collider.name == 'Box':
			emit_signal("PUSH",dir)
