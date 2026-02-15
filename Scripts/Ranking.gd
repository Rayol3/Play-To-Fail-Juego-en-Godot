extends Control

@onready var rank_list = $NinePatchRect/VBoxContainer
var quser

func _ready():
	if globalVar.DB == null:
		var connection = DBConnection.new()
		connection.openConnection()
	quser = Quser.new()
	load_rankings()

func load_rankings():
	# Limpiar
	for child in rank_list.get_children():
		child.queue_free()
	
	var rankings = quser.getRankings()
	
	var header = Label.new()
	header.text = "POS | ALIAS | PUNTOS"
	header.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	rank_list.add_child(header)
	
	var i = 1
	for entry in rankings:
		var lbl = Label.new()
		lbl.text = str(i) + ". " + str(entry["alias"]) + " - " + str(entry["total_points"]) + " pts"
		lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		rank_list.add_child(lbl)
		i += 1

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/home/home.tscn")
