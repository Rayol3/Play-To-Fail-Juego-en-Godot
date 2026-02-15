extends Control

@onready var container = $ScrollContainer/VBoxContainer
var quser

func _ready():
	# Abrir conexión si no está abierta
	if globalVar.DB == null:
		var connection = DBConnection.new()
		connection.openConnection()
	
	quser = Quser.new()
	load_users()

func load_users():
	# Limpiar contenedor
	for child in container.get_children():
		child.queue_free()
	
	var users = quser.getAllUsers()
	for user_data in users:
		var btn = Button.new()
		btn.text = user_data["alias"]
		btn.custom_minimum_size = Vector2(0, 80)
		btn.pressed.connect(_on_user_selected.bind(user_data["alias"]))
		container.add_child(btn)
	
	# Botón para nuevo usuario
	var new_user_btn = Button.new()
	new_user_btn.text = "+ Nuevo Usuario"
	new_user_btn.custom_minimum_size = Vector2(0, 100)
	new_user_btn.modulate = Color(0.2, 1, 0.2) # Verde
	new_user_btn.pressed.connect(_on_new_user_pressed)
	container.add_child(new_user_btn)

func _on_user_selected(alias):
	quser.updateID(alias)
	globalVar.ALIAS = alias
	
	# Cargar información del inventario (puntos, monedas)
	var fk = globalVar.idUSER
	var result = quser.inventoryAll(fk)
	
	var totalPoints = 0
	var totalCoins = 0
	for i in range(result.size()):
		totalPoints += result[i]['points']
		totalCoins += result[i]['coin']
		
	globalVar.obtainedPoint = totalPoints
	globalVar.obtainedCoin  = totalCoins
	globalVar.points = totalPoints
	globalVar.coins  = totalCoins
	
	# Ir al menú principal
	get_tree().change_scene_to_file("res://Scenes/home/home.tscn")

func _on_new_user_pressed():
	# Redirigir al registro existente
	get_tree().change_scene_to_file("res://Scenes/loginRegister/LoginScreen.tscn")
