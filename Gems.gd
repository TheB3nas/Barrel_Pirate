extends Area2D

var from_crate = false

func _ready():
	var random_gem = randi_range(1, 30)
	if random_gem >= 1 and random_gem <= 20:
		$AnimatedSprite2D.play("Blue")
		$Light.play("Blue")
	if random_gem >= 21 and random_gem <= 29:
		$AnimatedSprite2D.play("Purple")
		$Light.play("Purple")
	if random_gem == 30: 
		$AnimatedSprite2D.play("Yellow")
		$Light.play("Yellow")
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
