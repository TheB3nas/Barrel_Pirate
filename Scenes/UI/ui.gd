extends CanvasLayer
var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	max_value()
	$HP/VBoxContainer/AnimatedSprite2D.play("1")

func _process(delta):
	$HP/VBoxContainer/TextureProgressBar.value = player.hit_points
	if player.hit_points <= 80 and player.hit_points > 40:
		$HP/VBoxContainer/AnimatedSprite2D.play("2")
	if player.hit_points <= 40 and player.hit_points > 0:
		$HP/VBoxContainer/AnimatedSprite2D.play("3")

func max_value():
	player.hit_points = $HP/VBoxContainer/TextureProgressBar.max_value

func Death_pop_up() -> void:
	var tween = create_tween()
	tween.parallel()
	tween.tween_property($"Death screen/ColorRect", "color", Color("3b4861"), 1).set_ease(Tween.EASE_IN)
	tween.tween_property($"Death screen/Resparrrwn", "modulate", Color("ffffff"), 1).set_ease(Tween.EASE_IN)
	
func _on_resparrrwn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Lower_deck/dungeon_gen.tscn")
