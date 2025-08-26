extends StaticBody2D

var piano: int = randi_range(1, 6)


func _ready():
	$Placeholder.visible = false
	if piano >= 1 and piano <= 3:
		$"Piano 1".visible = true
	if piano >= 4 and piano <= 5:
		$"Piano 2".visible = true
	if piano == 6:
		$"Piano 3".visible = true
