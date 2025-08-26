extends State
class_name Player_Dead

func Enter():
	entity.can_move = false
	animation_tree["parameters/conditions/Idle"] = false
	#animation_tree["parameters/conditions/Turn"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Dead"] = true
	$"../../UI".Death_pop_up()

func hit():
	pass
