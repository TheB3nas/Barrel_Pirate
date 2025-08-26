extends Area2D

var speed = 1000
var damage = 25
#var damage = Globals.canon_ball_dmg
var ball_size = Vector2(1, 1)
var direction = Vector2.UP


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", ball_size, 0.2).from(Vector2(0.5, 0.5))


func _process(delta):
	position += direction * speed * delta
	rotation += 50



func _on_destruct_timeout():
	queue_free()



func _on_body_entered(body):
	if "hit" in body:
		body.hit(damage)
	if not body.is_in_group("common_crate"):
		queue_free()
