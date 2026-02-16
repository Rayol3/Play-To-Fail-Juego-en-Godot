extends Node2D

func set_text(text: String, color: Color = Color.WHITE):
	$Label.text = text
	$Label.modulate = color
	
	var tween = create_tween().set_parallel(true)
	# Movimiento hacia arriba con rebote
	tween.tween_property(self, "position", position + Vector2(randf_range(-40, 40), -120), 1.0).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	# Desvanecimiento
	tween.tween_property(self, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	# Escala de impacto
	scale = Vector2(0.5, 0.5)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.3).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
	tween.chain().tween_callback(queue_free)
