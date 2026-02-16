extends Node2D
var column: float = 0
var row: float = 0
var vec = Vector2(column, row)

@export var color: String
@export var row_texture: Texture2D
@export var column_texture: Texture2D
@export var adjacent_texture: Texture2D

var is_row_bomb = false
var is_column_bomb = false
var is_adjacent_bomb = false 

var move_tween: Tween = null
var matched = false 
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func move(target):
	#función de la animación de piezas. Aquí también se puede añadir sonido depende al movimiento que se realice.
	if move_tween:
		move_tween.kill()
	move_tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	move_tween.tween_property(self, "position", target, .5)

func make_column_bomb():
	is_column_bomb = true
	$Sprite.texture = column_texture
	$Sprite.modulate = Color(1, 1, 1, 1)

func make_row_bomb():
	is_row_bomb = true
	$Sprite.texture = row_texture
	$Sprite.modulate = Color(1, 1, 1, 1)

func make_adjacent_bomb():
	is_adjacent_bomb = true
	$Sprite.texture = adjacent_texture
	$Sprite.modulate = Color(1, 1, 1, 1)

func dim():
	var sprite = get_node("Sprite")
	sprite.modulate = Color(1, 1, 1, .5)
