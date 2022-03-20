extends Node


var levels := []
var current_level := 0
var path = "res://game/stages/"

onready var screen = Screenwipe.get_node("ColorRect/AnimationPlayer")

func _ready():
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			levels.append(file)
	screen.play("Clear")
	
	dir.list_dir_end()

func load_next_level():
	current_level += 1
	if current_level < levels.size():
		screen.play("Close")
		yield(get_tree().create_timer(.5), "timeout")
		get_tree().change_scene(path+levels[current_level])
		screen.play("Open")
	else:
		current_level = 0
		reload_level()

func reload_level():
	screen.play("Close")
	yield(get_tree().create_timer(.5), "timeout")
	get_tree().change_scene(path+levels[current_level])
	screen.play("Open")


