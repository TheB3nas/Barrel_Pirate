extends Area2D

var type = randi_range(1, 2)

func _ready():
	if type == 1:
		$AnimatedSprite2D.play("1")
	if type == 2:
		$AnimatedSprite2D.play("2")
