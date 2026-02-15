extends ScrollContainer

var is_dragging = false
var drag_start = Vector2()

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			is_dragging = true
			drag_start = event.position
		elif not event.pressed and is_dragging:
			is_dragging = false
	elif event is InputEventScreenDrag and is_dragging:
		var delta = event.relative
		scroll_horizontal -= delta.x
		scroll_vertical -= delta.y



