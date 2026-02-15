extends CanvasLayer

var textSpeed = 0.01

signal button_pressed

func _ready():
	$Control/Button/AnimationPlayer.stop(true)
	$Control/Sprite/AnimationPlayer.stop(true)
	$Control/AudioStreamPlayer.stop()
	
func showDialog(TEXT: String) -> void:
	show()
	starAnimation()

	$Control/Text.text = "[color=#6E2C00]" + TEXT
	$Control/Text.visible_ratio = 0
	
	var tweeDuration = textSpeed * TEXT.length()
	
	#Animation text
	var tween = create_tween()
	tween.tween_property($Control/Text, "visible_ratio", 1.0, tweeDuration).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	
	$Control/AudioStreamPlayer.play(1-tweeDuration)


func _on_Button_pressed():
	hide()
	$Control/Button/AnimationPlayer.stop(true)
	$Control/Sprite/AnimationPlayer.stop(true)
	
	
func starAnimation() -> void:
	$Control/Button/AnimationPlayer.play("NEXT")
	$Control/Sprite/AnimationPlayer.play("motion")
	
