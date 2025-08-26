extends State

func Enter():
	entity.can_move = false
	animation_tree["parameters/conditions/Death"] = true
	animation_tree["parameters/conditions/Hit"] = false
