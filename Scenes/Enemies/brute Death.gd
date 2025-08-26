extends State

var timer: int
func Enter():
	timer = 60
	entity.can_move = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Death"] = true
	
	
func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		$"../..".queue_free()

func death():
	pass
