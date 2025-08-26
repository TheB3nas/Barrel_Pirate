extends CharacterBody2D

#signals
signal cannon_shot()

#Player stats
var speed = 350
var hit_points = 100
var damage = 10

#Is doing something
var can_shoot = true
var vulnerable = true
#Directions
var direction: Vector2
var shoot_direction: Vector2
@export var can_move = true
#Turn nodes into something simple
@onready var animation_tree = $AnimationTree


func _ready():
	$AnimationTree.active = true #Activate animation / keep for better workflow in player scene
	shoot_direction = Vector2(1, 0)
	update_animation()


func _process(_delta):
	if can_move:
		move_and_slide()
		direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * speed
	shoot_direction = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	update_animation()
	


func update_animation():
		if shoot_direction != Vector2.ZERO:
			animation_tree["parameters/Idle/blend_position"] = shoot_direction
			#animation_tree["parameters/Turn/blend_position"] = shoot_direction
			animation_tree["parameters/Walk/blend_position"] = shoot_direction
			animation_tree["parameters/Shoot/blend_position"] = shoot_direction
			animation_tree["parameters/Hit/blend_position"] = shoot_direction
			animation_tree["parameters/Dead/blend_position"] = shoot_direction

func hit(enemy_damage):
	if vulnerable:
		vulnerable = false
		$Timers/Vulnerable.start()
		hit_points -= enemy_damage
		$FSM.current_state.hit()

func _on_can_shoot_timeout():
	can_shoot = true
func _on_knockback_timeout():
	$FSM/Shooting.knockback = false


func _on_vulnerable_timeout():
	vulnerable = true


func _on_area_2d_body_entered(body):
	if $FSM/Shooting.knockback:
		if "hit" in body and body.is_in_group("common_crate"):
			body.hit(damage)
			


	
	
