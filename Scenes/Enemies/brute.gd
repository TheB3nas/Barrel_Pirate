extends CharacterBody2D


var speed = 350
var direction: Vector2
var can_move: bool = true
var hit_points = 300
var enemy_damage = 35
var can_strike = true
var can_slam = false
var LOS: bool
@onready var animation_tree = $AnimationTree
var player
func _ready():
	animation_tree.active = true
	player = get_tree().get_first_node_in_group("Player")
	rotate_ray()

func rotate_ray():
	var tween = create_tween()
	tween.set_loops(100)
	tween.tween_property($Eyeline/RayCast2D, "rotation", rad_to_deg(0), 0.1)
	tween.tween_property($Eyeline/RayCast2D, "rotation", rad_to_deg(-0.003), 0.1)
	tween.tween_property($Eyeline/RayCast2D, "rotation", rad_to_deg(0), 0.1)
	tween.tween_property($Eyeline/RayCast2D, "rotation", rad_to_deg(0.003), 0.1)

func _process(_delta):
	var distance = (player.global_position - global_position)
	if distance.length() < 1000:
		$Eyeline.look_at(player.global_position)
		if $Eyeline/RayCast2D.is_colliding():
			if $Eyeline/RayCast2D.get_collider() == player:
				LOS = true
			else:
				LOS = false
	if can_move:
		move_and_slide()
	update_animation()
	if direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		

func update_animation():
	if direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Walk/blend_position"] = direction
		animation_tree["parameters/Attack/blend_position"] = direction
		#animation_tree["parameters/Slam/blend_position"] = direction
		#animation_tree["parameters/Hit/blend_position"] = direction



func hit(damage):
	hit_points -= damage
	if hit_points <= 0:
		$FSM.current_state.death()
	else:
		$Hitflash.play("Hit_flash")


func _on_timer_timeout():
	can_strike = true


func _on_can_slam_timeout():
	can_slam = true
