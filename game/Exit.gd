extends Area2D

func button_down(body):
	$Sprite.z_index = -1
	body.leave()

func button_up(_body):
	$Sprite.z_index = 0
