extends Node2D
class_name Debug_level

var cannonball_scene = preload("res://Scenes/Projectiles/Cannonball/cannonball.tscn")
var enemy_bullet_scene = preload("res://Scenes/Projectiles/Enemy_projectiles/enemy_bullet.tscn")
var gold_scene: PackedScene = preload("res://Scenes/Objects/Treasure/gold_coin.tscn")
var silver_scene: PackedScene = preload("res://Scenes/Objects/Treasure/silver_coin.tscn")
var copper_scene: PackedScene = preload("res://Scenes/Objects/Treasure/copper_coin.tscn")
var gem_scene: PackedScene = preload("res://Scenes/Objects/Treasure/gems.tscn")


func connect_all():
	for common_crates in get_tree().get_nodes_in_group("common_crate"):
		common_crates.connect("common_crate_broken", common_broken)
	for chests in get_tree().get_nodes_in_group("Chests"):
		chests.connect("chest_broken", common_broken)
	for fish_gunner in get_tree().get_nodes_in_group("fish_gunner"):
		fish_gunner.connect("fish_bullet_shot", _on_fish_bullet_shot)
	for player in get_tree().get_nodes_in_group("Player"):
		player.connect("cannon_shot", _on_player_cannon_shot)

func _on_player_cannon_shot(pos, shoot_direction):
	var ball = cannonball_scene.instantiate() as Area2D
	ball.global_position = pos
	ball.direction = shoot_direction
	$Projectiles.add_child(ball)

func _on_fish_bullet_shot(pos, direction):
	var bullet = enemy_bullet_scene.instantiate() as Area2D
	bullet.global_position = pos
	bullet.direction = direction
	$Projectiles.call_deferred("add_child", bullet)

func common_broken(loot_spawn_pos, loot_type):
	var coin
	if loot_type == "Gold":
		coin = gold_scene.instantiate() as Area2D
	if loot_type == "Silver":
		coin = silver_scene.instantiate() as Area2D
	if loot_type == "Copper":
		coin = copper_scene.instantiate() as Area2D
	if loot_type == "Gem":
		coin = gem_scene.instantiate() as Area2D
	coin.position = loot_spawn_pos
	$Treasure.call_deferred("add_child", coin)
	coin.coin_from_crate()
