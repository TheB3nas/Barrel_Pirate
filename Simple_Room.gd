extends Node2D
class_name Room_function

@onready var base = $Base

var up_clear: bool
var down_clear: bool
var left_clear: bool
var right_clear: bool

func place_windows():
	base.set_cell(0, Vector2(-3, -4), 0, Vector2(3, 0))
	base.set_cell(0, Vector2(-1, -4), 0, Vector2(3, 0))
	base.set_cell(0, Vector2(1, -4), 0, Vector2(3, 0))

func open_door_up():
	base.set_cell(0, Vector2(-1, -4), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-2, -4), 0, Vector2(1, 4))
	base.set_cell(0, Vector2(0, -4), 0, Vector2(0, 4))
	up_clear = true


func open_door_down():
	base.set_cell(0, Vector2(-1, 2), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-2, 2), 0, Vector2(1, 3))
	base.set_cell(0, Vector2(0, 2), 0, Vector2(0, 3))
	down_clear = true


func open_door_right():
	base.set_cell(0, Vector2(2, -1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, -2), 0, Vector2(0, 4))
	base.set_cell(0, Vector2(2, 0), 0, Vector2(0, 3))
	right_clear = true


func open_door_left():
	base.set_cell(0, Vector2(-4, -1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, -2), 0, Vector2(1, 4))
	base.set_cell(0, Vector2(-4, 0), 0, Vector2(1, 3))
	left_clear = true

var right_big_clear
var left_big_clear

func open_big_door_right():
	base.set_cell(0, Vector2(2, -4), 0, Vector2(1, 0))
	base.set_cell(0, Vector2(2, -3), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, -2), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, -1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, 0), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, 1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(2, 2), 0, Vector2(1, 2))
	right_big_clear = true
	
func open_big_door_left():
	base.set_cell(0, Vector2(-4, -4), 0, Vector2(1, 0))
	base.set_cell(0, Vector2(-4, -3), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, -2), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, -1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, 0), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, 1), 0, Vector2(1, 1))
	base.set_cell(0, Vector2(-4, 2), 0, Vector2(1, 2))
	left_big_clear = true



func _on_up_body_entered(body):
	if up_clear:
		body.queue_free()

func _on_down_body_entered(body):
	if down_clear:
		body.queue_free()

func _on_right_body_entered(body):
	if right_clear:
		body.queue_free()

func _on_left_body_entered(body):
	if left_clear:
		body.queue_free()


func _on_up_area_entered(area):
	if up_clear:
		area.queue_free()


func _on_down_area_entered(area):
	if down_clear:
		area.queue_free()


func _on_right_area_entered(area):
	if right_clear:
		area.queue_free()


func _on_left_area_entered(area):
	if left_clear:
		area.queue_free()


func _on_right_big_room_area_entered(area):
	if area.wall and right_big_clear:
		area.queue_free()


func _on_left_big_room_area_entered(area):
	if area.wall and left_big_clear:
		area.queue_free()
