extends State
class_name Bombling_Hit_Fire
var timer: int

func Enter():
	timer = 8
	entity.can_move = true
	animation_tree["parameters/conditions/Walk_fire"] = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/deagro"] = false
	animation_tree["parameters/conditions/Hit_fire"] = true
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Fuse"] = false
	
func Update(delta):
	if entity.hit_points <= 0:
		Transition.emit(self, "dead")
	elif timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "walk - fire")

func hit():
	#Transition.emit(self, "hit fire")
	pass
