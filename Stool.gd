extends StaticBody2D

var type: int = randi_range(1, 2)
func _ready():
	$"Place holder".visible = false
	if type == 1:
		$Square.visible = true
		$Round.visible = false
	else:
		$Square.visible = false
		$Round.visible = true
