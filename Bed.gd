extends StaticBody2D

var pillow: int = randi_range(1, 51)
var sheet: int = randi_range(1, 10)
var memis: int = randi_range(1, 1000)

var pillow_color = ["Orange", "Blue", "Pink", "White", "White", "White", "White", "White", "White", "White"]
var sheet_color = ["Orange", "Green", "Blue", "Red", "Pink", "White", "White", "White", "White", "White"]
var pillow_rot = randf_range(-15, 15)
var p_color = pillow_color[randi()%len(pillow_color)]
var s_color = sheet_color[randi()%len(sheet_color)]

func _ready():
	if pillow >= 1 and pillow <= 25:
		$"Pillow 1".visible = true
	if pillow >= 26 and pillow <= 50:
		$"Pillow 2".visible = true
	if pillow == 51:
		$"Pillow 3".visible = true
		
	if sheet >= 1 and sheet <= 7:
		$"Sheet 1".visible = true
	if sheet >= 8 and sheet <= 10:
		$"Sheet 2".visible = true
	
	if memis == 1000:
		$Memis.visible = true
	$"Pillow 1".rotation_degrees = pillow_rot
	$"Pillow 2".rotation_degrees = pillow_rot
	if p_color == "White":
		$"Pillow 1".modulate = Color("ffffff")
		$"Pillow 2".modulate = Color("ffffff")
	if p_color == "Orange":
		$"Pillow 1".modulate = Color("e7c3b8")
		$"Pillow 2".modulate = Color("e7c3b8")
	if p_color == "Blue":
		$"Pillow 1".modulate = Color("98a8c2")
		$"Pillow 2".modulate = Color("98a8c2")
	if p_color == "Pink":
		$"Pillow 1".modulate = Color("d296b3")
		$"Pillow 2".modulate = Color("d296b3")

	if s_color == "White":
		$"Sheet 1".modulate = Color("ffffff")
		$"Sheet 2".modulate = Color("ffffff")
	if s_color == "Orange":
		$"Sheet 1".modulate = Color("e7c3b8")
		$"Sheet 2".modulate = Color("e7c3b8")
	if s_color == "Blue":
		$"Sheet 1".modulate = Color("98a8c2")
		$"Sheet 2".modulate = Color("98a8c2")
	if s_color == "Green":
		$"Sheet 1".modulate = Color("9bb677")
		$"Sheet 2".modulate = Color("9bb677")
	if s_color == "Red":
		$"Sheet 1".modulate = Color("c85d4f")
		$"Sheet 2".modulate = Color("c85d4f")
	if s_color == "Pink":
		$"Sheet 1".modulate = Color("d296b3")
		$"Sheet 2".modulate = Color("d296b3")
