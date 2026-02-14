extends CharacterBody2D

@onready var base = $AnimationPlayer
@onready var sprite = $AnimationPlayer/Animation

func _ready():
	pass
	
func starPet():
	base.get_node("Moving").visible = true
	base.get_node("Happy").visible = false
	base.get_node("Sad").visible = false
	sprite.play("moving")

func starPetHappy():
	base.get_node("Happy").visible = true
	base.get_node("Moving").visible = false
	base.get_node("Sad").visible = false
	sprite.play("happy")
	
func starPetSad():
	base.get_node("Sad").visible = true
	base.get_node("Moving").visible = false
	base.get_node("Happy").visible = false
	sprite.play("sad")


func starPetHappyOne():
	base.get_node("Happy").visible = true
	base.get_node("Moving").visible = false
	base.get_node("Sad").visible = false
	sprite.play("happy")
	await get_tree().create_timer(1.4).timeout
	sprite.stop()
	starPet()
