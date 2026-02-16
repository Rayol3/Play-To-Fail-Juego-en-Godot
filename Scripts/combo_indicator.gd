extends Node2D

func set_text(text):
	if has_node("Label"):
		$Label.text = text
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position", position + Vector2(0, -60), 0.8).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate:a", 0.0, 0.8).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	tween.chain().tween_callback(queue_free)
