extends Area2D
class_name treasure

var from_crate = false

func _ready():
	$AnimatedSprite2D.play("Rot")
	$AnimationPlayer.play("Float")
	if from_crate:
		var distance = randi_range(50, 80)
		var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		var travel_pos = position + distance * direction
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0, 0))
		tween.tween_property(self, "position", travel_pos, 0.3).from(position)

func coin_from_crate():
	from_crate = true


func _on_body_entered(_body):
	queue_free()
