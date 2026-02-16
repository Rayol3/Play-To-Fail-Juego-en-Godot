extends Node2D

@onready var pet = $Pet
var textSpeed = 0.01

var counter = 1
var messages = []

func _ready():
	pass
	
func _on_next_pressed():
	if (messages.is_empty()) :
		hide()
	else :
		if ( counter < messages.size() ) :
			setMessage(str(messages[counter]))
			counter = counter + 1
		else:
			hide()


func setMessage(TEXT: String) -> void:
	show()
	pet.starPetHappyOne()

	$Control/text.text = "[color=#6E2C00]" + TEXT
	$Control/text.visible_ratio = 0
	
	var tweeDuration = textSpeed * TEXT.length()
	
	#Animation text
	var tween = create_tween()
	tween.tween_property($Control/text, "visible_ratio", 1.0, tweeDuration).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	
	#$Control/AudioStreamPlayer.play(1-tweeDuration)


func arrayMessages(vect: Array) -> void:
	messages = vect
