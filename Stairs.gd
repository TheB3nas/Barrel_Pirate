extends StaticBody2D


func _on_area_2d_body_entered(_body):
	
	get_tree().change_scene_to_file("res://Scenes/Levels/Lower_deck/dungeon_gen.tscn")
