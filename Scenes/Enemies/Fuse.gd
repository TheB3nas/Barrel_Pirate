extends State
class_name Bombling_Fuse


func Enter():
	entity.can_move = false
	animation_tree["parameters/conditions/Walk_fire"] = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit_fire"] = false
	animation_tree["parameters/conditions/Fuse"] = true

func hit():
	pass
