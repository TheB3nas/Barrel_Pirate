extends CharacterBody2D

signal fish_bullet_shot()
var speed = 200
var direction: Vector2
var can_move: bool = true
var hit_points = 75
var can_shoot = true
@onready var animation_tree = $AnimationTree
var player: CharacterBody2D

	
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
		animation_tree["parameters/Death/blend_position"] = direction
		animation_tree["parameters/Hit/blend_position"] = direction
		animation_tree["parameters/Idle_Agro/blend_position"] = direction
		animation_tree["parameters/Walk/blend_position"] = direction
		animation_tree["parameters/Walk_Agro/blend_position"] = direction
		animation_tree["parameters/Shoot_Walk/blend_position"] = direction
		animation_tree["parameters/Shoot/blend_position"] = direction

func hit(damage):
	$FSM.current_state.hit()
	hit_points -= damage


func _on_can_shoot_timeout():
	can_shoot = true
