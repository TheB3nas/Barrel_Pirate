extends common_crate

var loot_type

func _ready():
	$AnimatedSprite2D.play("Box")
	$AnimatedSprite2D.scale = Vector2(0.05, 0.05)

func hit(_damage):
	$AnimationPlayer.play("Hit")
	var loot_spawn_pos = $Marker2D.global_position
	for i in randi_range(1, 5):
		var loot_types = ["Copper", "Silver", "Gold"]
		loot_type = loot_types[randi()%len(loot_types)]
		common_crate_broken.emit(loot_spawn_pos, loot_type)
