extends CanvasLayer

signal choice_made
@onready var pet = $Pet

func _ready():
	pet.starPetSad()


func _on_cancel_pressed():
	choice_made.emit("cancel") # Emitir señal cuando se selecciona el botón de cancelar
	hide()


func _on_acept_pressed():
	choice_made.emit("confirm") # Emitir señal cuando se selecciona el botón de confirmación
