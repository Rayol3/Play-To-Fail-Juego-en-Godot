extends Node


const SAVEFILE = "user://SAVEFILE.save"

var game_data = {}

func _ready():
	load_data()

func load_data():
	if not FileAccess.file_exists(SAVEFILE):
		game_data={
			"master_vol" : -10.0,
			"music_vol" : -10.0,
			"sfx_vol" : -10.0,
		}
		save_data()
		return

	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if file:
		game_data = file.get_var()
		file.close()

func save_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	if file:
		file.store_var(game_data)
		file.close()
