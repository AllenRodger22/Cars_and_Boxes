extends Area2D

signal update_door(open)

var sprite = {
	"up": Rect2(64, 64, 32, 64),
	"down": Rect2(96, 64, 32, 64)
}

func _ready():
	$Sprite.set_region_rect(sprite["up"])

func button_down(_body):
	$Sprite.set_region_rect(sprite["down"])
	$Sprite.z_index = -1
	emit_signal("update_door", true)

func button_up(_body):
	$Sprite.set_region_rect(sprite["up"])
	$Sprite.z_index = 0
	emit_signal("update_door", false)
