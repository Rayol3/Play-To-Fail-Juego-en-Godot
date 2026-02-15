extends HScrollBar


@onready var scroll_container = get_parent().get_node("ScrollContainer")

func _ready():
	value_changed.connect(_on_value_changed)

func _on_value_changed(value):
	scroll_container.set_h_scroll(value)
