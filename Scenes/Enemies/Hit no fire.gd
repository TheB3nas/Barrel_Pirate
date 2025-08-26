extends State
class_name Bombling_Hit_No_Fire

var timer: int
func Enter():
	timer = 8
	entity.can_move = true
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/deagro"] = false
	animation_tree["parameters/conditions/Hit"] = true
	animation_tree["parameters/conditions/Fuse"] = false
	
func Update(delta):
	if entity.hit_points <= 0:
		Transition.emit(self, "dead")
	elif timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro")

func hit():
	#Transition.emit(self, "hit no fire")
	pass
