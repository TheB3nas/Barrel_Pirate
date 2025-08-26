extends State
class_name Bombling_Dead

func Enter():
	entity.can_move = false
	animation_tree["parameters/conditions/Dead"] = true
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Hit_fire"] = false

	
func hit():
	pass
