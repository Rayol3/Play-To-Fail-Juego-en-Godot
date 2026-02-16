extends Control


@onready var settings = get_node("SettingsMenu") #Conexion al SettingsMenu(PopMenu)
@onready var audio_stream_player = $AudioStreamPlayer
@onready var pet = $Pet
@onready var confirmation_layer_ref = $Confirmation
@onready var aliasShow = $Alias/name
@onready var pointShow = $Point/value


var connection = null
var quser = null

func _ready():

	#connect("volume_changed", self, "_on_volume_changed")
	aliasShow.text = "Multiplos" #[color=#CACFD2]" + str(globalVar.ALIAS)
	pointShow.text = "[color=#CACFD2]" + str(globalVar.points) + "[/color]"
	pet.starPet()
	#OpenConnectionDatabase()
	settings.volume_changed.connect(_on_volume_changed)
	


#Control de Audio por BUS	
func _on_volume_changed(bus_idx, volume):
	AudioServer.set_bus_volume_db(bus_idx, volume)
	if volume <= -50:
		AudioServer.set_bus_mute(bus_idx, true)
	else:
		AudioServer.set_bus_mute(bus_idx, false)
			
#func _on_volume_changed(value):
#	audio_stream_player.volume_db = value

func _on_Bttn_Play_pressed():
	#pet.starPetHappy()

	#await get_tree().create_timer(1.4).timeout
	
	# START GAME LEVEL
	get_tree().change_scene_to_file("res://Scenes/niveles/niveles.tscn") 

func _on_Bttn_Ranking_pressed():
	get_tree().change_scene_to_file("res://Scenes/home/Ranking.tscn")

func _on_Bttn_Bonus_pressed():
	get_tree().change_scene_to_file("res://Scenes/home/Bonus.tscn")

func _on_Bttn_Option_pressed():
	$SettingsMenu.popup()
	

func _on_Bttn_Exit_pressed():
	confirmation_layer_ref.visible = true
	# confirmation_layer_ref.connect("choice_made", self, "_on_confirmation_choice") # Already connected in editor or logic if needed, but here it was called every time
	pet.visible = false

func _on_confirmation_choice(choice):
	if choice == "confirm":
		pet.stopPet()
#		ckeckData()
		await get_tree().create_timer(0.3).timeout
		
		#Agregar confirmacion de guardado 
		
		get_tree().quit()
		
	elif choice == "cancel":
		pet.visible = true
		pet.starPet()
		


# ACTUALIZA DATOS DEL USUARIO INGRESADO
#======================================
func OpenConnectionDatabase():
	connection = DbConnection.new()
	# connection.openConnection()
	


func getInformation() -> void :
	quser = Quser.new() 
	# var fk = globalVar.idUSER
	# var result = quser.inventoryAll(fk)
	
	var totalPoints = 0
	var totalCoins = 0
	#var itemsList = []
	
#	for i in range(result.size()):
#		totalPoints +=  result[i]['points']
#		totalCoins += result[i]['coin']
		#itemsList += result[i]['idItems']
		
	globalVar.obtainedPoint = totalPoints
	globalVar.obtainedCoin  = totalCoins
	globalVar.points = totalPoints
	globalVar.coins  = totalCoins



func ckeckData():
	quser = Quser.new() 

	var point = globalVar.points - globalVar.obtainedPoint
	var coin = globalVar.coins - globalVar.obtainedCoin
	var item = "item1"
	var idUser = globalVar.idUSER

	if((point == 0) and (coin == 0)) :
		pass
	else :
		quser.saveInventory(point,coin,item,idUser)

# =================================================
