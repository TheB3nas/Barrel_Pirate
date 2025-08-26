extends Chest
var loot_type
@export var hp = 100
func hit(damage):
	print("hit")
	if hp > 0:
		hp -= damage
		$AnimationPlayer.play("Hit")
	else:
		$AnimationPlayer.play("Destroy")
		var loot_spawn_pos = global_position
		for i in randi_range(1, 5):
			var loot_types = ["Copper", "Silver", "Gold"]
			loot_type = loot_types[randi()%len(loot_types)]
			chest_broken.emit(loot_spawn_pos, loot_type)
