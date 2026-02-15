extends Node2D

signal remove_ice_diamond

var ice_diamond_pieces = []
var width = 8
var height = 10
var ice_diamond = preload("res://Scenes/ice_diamond.tscn")

func _ready():
	pass 

func make_2d_array():
	var array = []
	for i in range(width):
		array.append([])
		for j in range(height):
			array[i].append(null)
	return array

func _on_grid_make_ice_diamond(board_position):
	if ice_diamond_pieces.size() == 0:
		ice_diamond_pieces = make_2d_array()
	var current = ice_diamond.instantiate()
	add_child(current)
	current.position = Vector2(board_position.x * 64 + 87, -board_position.y * 64 + 837)
	current.connect("diamond_destroyed", Callable(self, "_on_diamond_destroyed").bind(board_position))
	ice_diamond_pieces[board_position.x][board_position.y] = current

func _on_grid_damage_ice_diamond(board_position):
	if ice_diamond_pieces.size() != 0:
		if ice_diamond_pieces[board_position.x][board_position.y] != null:
			ice_diamond_pieces[board_position.x][board_position.y].take_damage(1)
			if ice_diamond_pieces[board_position.x][board_position.y].health <= 0:
				# El objeto se libera por sí mismo o aquí
				ice_diamond_pieces[board_position.x][board_position.y].queue_free()
				ice_diamond_pieces[board_position.x][board_position.y] = null
				emit_signal("remove_ice_diamond", board_position)

func _on_diamond_destroyed(board_position):
	# Incrementar multiplicador
	globalVar.score_multiplier += 1
	print("Diamante destruido! Multiplicador actual: ", globalVar.score_multiplier)
