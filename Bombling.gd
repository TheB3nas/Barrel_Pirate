extends CharacterBody2D

var speed = 250
var direction: Vector2
var can_move: bool = true
var hit_points = 100
var enemy_damage = 50
@onready var animation_tree = $AnimationTree

func _process(_delta):
	if can_move:
		move_and_slide()
	update_animation()

func update_animation():
		if direction != Vector2.ZERO:
			animation_tree["parameters/Idle/blend_position"] = direction
			animation_tree["parameters/Walk - no fire/blend_position"] = direction
			animation_tree["parameters/Hit/blend_position"] = direction
			animation_tree["parameters/Hit - fire/blend_position"] = direction
			animation_tree["parameters/Walk - fire/blend_position"] = direction

func hit(damage):
	hit_points -= damage
	$FSM.current_state.hit()


func _on_explosion_radius_body_entered(body):
	if "hit" in body:
		body.hit(enemy_damage)
