extends State

var timer: int

func Enter():
	timer = 20
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle_Agro"] = false
	animation_tree["parameters/conditions/Walk_Agro"] = false
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Shoot_Walk"] = true
	var markers = $"../../Flip/Markers"
	var pos: Node2D
	pos = markers.get_child(0)
	entity.fish_bullet_shot.emit(pos.global_position, entity.direction)

func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro_backing off")
func hit():
	Transition.emit(self, "f_hit")
