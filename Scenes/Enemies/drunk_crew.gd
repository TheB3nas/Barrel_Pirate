extends CharacterBody2D

var speed = 150
var direction: Vector2
var can_move: bool = true
var hit_points = 150
var enemy_damage = 25
var can_strike = true
@onready var animation_tree = $AnimationTree

func _process(_delta):
	if can_move:
		move_and_slide()
	update_animation()
	if direction.x < 0:
		$Flip.scale.x = -0.75
	else:
		$Flip.scale.x = 0.75
		

func update_animation():
	if direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Walk/blend_position"] = direction
		animation_tree["parameters/Strike/blend_position"] = direction
		animation_tree["parameters/Hit/blend_position"] = direction
		$Flip/Strikebox/AnimationTree["parameters/Strike_box/blend_position"] = direction


func _on_can_strike_timeout():
	can_strike = true


func _on_strike_body_entered(body):
	if "hit" in body:
		body.hit(enemy_damage)

func hit(damage):
	hit_points -= damage
	$FSM.current_state.hit()
