class_name DBConnection
extends Node

var db_path = "res://database/dbMultiple.db3"

func openConnection():
	globalVar.DB = SQLite.new()
	globalVar.DB.path = db_path
	globalVar.DB.open_db()




# Método para cerrar la conexión a la base de datos
func closeConnection():
	globalVar.DB.close_db()
