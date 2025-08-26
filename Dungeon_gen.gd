extends Node2D

var room_scene = [
	preload("res://Scenes/Levels/Lower_deck/simple_room_1.tscn"),
	preload("res://Scenes/Levels/Lower_deck/simple_room_2.tscn"),
	preload("res://Scenes/Levels/Lower_deck/simple_room_3.tscn")
	]
var start_room_scene = [
	preload("res://Scenes/Levels/Lower_deck/start_room.tscn")
	]

var stair_room_scene = [
	preload("res://Scenes/Levels/Lower_deck/stair_room_1.tscn")
	]


var cursed_room_scene = [
	preload("res://Scenes/Levels/Lower_deck/curse_room_1.tscn")
	]

var player_scene = preload("res://Scenes/Player/player.tscn")
var boss_scene = preload("res://Scenes/Enemies/drunk_crew.tscn")

enum room_type {START, SIMPLE, TREASURE, CURSED, BOSS, NULL}

var grid = []
var grid_door_up = []
var grid_door_down = []
var grid_door_right = []
var grid_door_left = []

var room
@export var ship_width = 6
@export var ship_height = 3

@export var room_width = 1750
@export var room_height = 1750


func _ready():
	generate_ship_grid()
	generate()
	DebugLevel.connect_all()

func generate_ship_grid():
	for x in range(ship_width):
		grid.append([])
		for y in range(ship_height):
			grid[x].append(room_type.NULL)
	for x in range(ship_width):
		grid_door_up.append([])
		for y in range(ship_height):
			grid_door_up[x].append("")
	for x in range(ship_width):
		grid_door_down.append([])
		for y in range(ship_height):
			grid_door_down[x].append("")
	for x in range(ship_width):
		grid_door_right.append([])
		for y in range(ship_height):
			grid_door_right[x].append("")
	for x in range(ship_width):
		grid_door_left.append([])
		for y in range(ship_height):
			grid_door_left[x].append("")

var ship_size = ship_width * ship_height

func generate():
	var start_x = randi_range(0, 1)
	var start_y = randi_range(0, ship_height-1)
	grid[start_x][start_y] = room_type.START
	ship_size -= 1


	var boss_x = randi_range(ship_width-2, ship_width-1)
	var boss_y = randi_range(0, ship_height-1)
	grid[boss_x][boss_y] = room_type.BOSS
	ship_size -= 1
	grid_door_left[boss_x][boss_y] = "door_left"
	grid_door_right[boss_x-1][boss_y] = "door_right"


	var current_x = start_x
	var current_y = start_y
	while ship_size > 0:
		var direction = randi() % 4

		var next_x = current_x
		var next_y = current_y
		match direction:
			0:   #right
				next_x += 1
			1:   #left
				next_x -=1
			2:   #down
				next_y += 1
			3:   #up
				next_y -= 1
		if next_x >= 0 and next_x < ship_width and next_y >= 0 and next_y < ship_height: #Check if in the grid
			if grid[next_x][next_y] == room_type.BOSS:
				door_logic(direction, current_x, current_y, next_x, next_y)
			var no_door_chance = randi_range(0, 100) < 5
			if no_door_chance and grid[next_x][next_y] != room_type.NULL:
				door_logic(direction, current_x, current_y, next_x, next_y)
			if grid[next_x][next_y] == room_type.NULL:
				door_logic(direction, current_x, current_y, next_x, next_y)
				ship_size -= 1
				if ship_size == ship_size/2:
					grid[next_x][next_y] = room_type.CURSED
				else:
					grid[next_x][next_y] = room_type.SIMPLE
			current_x = next_x
			current_y = next_y
	create_ship()

func door_logic(direction, current_x, current_y, next_x, next_y):
	match direction:
		0:   #right
			var big_door_chance = randi_range(0, 100) < 25
			if big_door_chance:
				grid_door_right[current_x][current_y] = "big_door_right"
				grid_door_left[next_x][next_y] = "big_door_left"
			else:
				grid_door_right[current_x][current_y] = "door_right"
				grid_door_left[next_x][next_y] = "door_left"
		1:   #left
			var big_door_chance = randi_range(0, 100) < 25
			if big_door_chance:
				grid_door_left[current_x][current_y] = "big_door_left"
				grid_door_right[next_x][next_y] = "big_door_right"
			else:
				grid_door_left[current_x][current_y] = "door_left"
				grid_door_right[next_x][next_y] = "door_right"
		2:   #down
			grid_door_down[current_x][current_y] = "door_down"
			grid_door_up[next_x][next_y] = "door_up"
		3:   #up
			grid_door_up[current_x][current_y] = "door_up"
			grid_door_down[next_x][next_y] = "door_down"

func create_ship():
	for x in range(ship_width):
		for y in range(ship_height):
			if grid[x][y] == room_type.START:
				place_room(x, y)
			if grid[x][y] == room_type.BOSS:
				place_room(x, y)
			if grid[x][y] == room_type.SIMPLE:
				place_room(x, y)
			if grid[x][y] == room_type.CURSED:
				place_room(x, y)

func place_room(x, y):
	if grid[x][y] == room_type.START:
		var rand_start_room_index = randi() % start_room_scene.size()
		var rand_start_room_scene = start_room_scene[rand_start_room_index]
		room = rand_start_room_scene.instantiate() as Node2D
	elif grid[x][y] == room_type.BOSS:
		var rand_stair_room_index = randi() % stair_room_scene.size()
		var rand_stair_room_scene = stair_room_scene[rand_stair_room_index]
		room = rand_stair_room_scene.instantiate() as Node2D
	elif grid[x][y] == room_type.CURSED:
		var rand_curse_room_index = randi() % cursed_room_scene.size()
		var rand_curse_room_scene = cursed_room_scene[rand_curse_room_index]
		room = rand_curse_room_scene.instantiate() as Node2D
	else:
		var rand_room_index = randi() % room_scene.size()
		var rand_room_scene = room_scene[rand_room_index]
		room = rand_room_scene.instantiate() as Node2D
	room.position = Vector2(x * room_width, y * room_height)
	$Rooms.add_child(room)
	open_correct_paths(x, y)
	if grid[x][y] == room_type.START:
		#var player = player_scene.instantiate()
		var player = $Player
		player.position = Vector2(x * room_width, y * room_height)
		#add_child(player)
	#if grid[x][y] == room_type.BOSS:
		#var boss = boss_scene.instantiate()
		#boss.position = Vector2(x * room_width, y * room_height)
		#add_child(boss)

func open_correct_paths(x, y):
	if y == 0:
		room.place_windows() 
	if grid_door_up[x][y] == "door_up":
		room.open_door_up()
	if grid_door_down[x][y] == "door_down":
		room.open_door_down()
	if grid_door_right[x][y] == "door_right":
		room.open_door_right()
	if grid_door_left[x][y] == "door_left":
		room.open_door_left()
	if grid_door_right[x][y] == "big_door_right":
		room.open_big_door_right()
	if grid_door_left[x][y] == "big_door_left":
		room.open_big_door_left()
	
