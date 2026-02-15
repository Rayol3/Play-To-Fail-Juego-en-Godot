extends "res://Scripts/block.gd"

signal diamond_destroyed

func take_damage(damage):
	health -= damage
	if health <= 0:
		emit_signal("diamond_destroyed")
