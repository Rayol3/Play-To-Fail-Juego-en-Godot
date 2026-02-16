extends Control

var quser

func _ready():
	if globalVar.DB == null:
		var connection = DBConnection.new()
		connection.openConnection()
	quser = Quser.new()
	$Label.text = "¡Regalo para " + globalVar.ALIAS + "!"

func _on_claim_pressed():
	# Bono simple: 100 puntos y 5 monedas
	var bonus_points = 100
	var bonus_coins = 5
	
	globalVar.points += bonus_points
	globalVar.coins += bonus_coins
	
	# Guardar en la base de datos
	quser.saveInventory(bonus_points, bonus_coins, "bonus_daily", globalVar.idUSER)
	
	$Label.text = "¡Has reclamado " + str(bonus_points) + " puntos!"
	$Claim.disabled = true
	
	await get_tree().create_timer(2.0).timeout
	_on_back_pressed()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/home/home.tscn")
