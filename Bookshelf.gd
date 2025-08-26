extends StaticBody2D

var shelf: int = randi_range(1, 11)

func _ready():
	for child in $Shelfs.get_children():
		shelf = randi_range(1, 11)
		if shelf == 1:
			child.play("Shelf1")
		if shelf == 2:
			child.play("Shelf2")
		if shelf == 3:
			child.play("Shelf3")
		if shelf == 4:
			child.play("Shelf4")
		if shelf == 5:
			child.play("Shelf5")
		if shelf == 6:
			child.play("Shelf6")
		if shelf == 7:
			child.play("Shelf7")
		if shelf == 8:
			child.play("Shelf8")
		if shelf == 9:
			child.play("Shelf9")
		if shelf == 10:
			child.play("Shelf91")
		if shelf == 11:
			child.play("Shelf92")
