extends Node2D

var direction: Vector2
var player: CharacterBody2D
var vectors: Array = []
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	for axis in $".".get_children():
		var vector = axis.target_position.normalized()
		vectors.append(vector)
	print(vectors)

var intrest: Array
var danger: Array

var max_danger = 5
var min_danger = 2

func _process(delta):
	for axis in $".".get_children():
		var vec = (axis.global_position - axis.target_position).normalized()
		var dot_test = vec.dot(vec)
		print(dot_test)
