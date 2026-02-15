extends Node2D

signal create_goal(max_needed, texture, goal_string)
signal game_won

func _ready():
	setup_goals()

func setup_goals():
	for i in range(get_child_count()):
		var current = get_child(i)
		create_goal.emit(current.max_needed, current.goal_texture, current.goal_string)

func check_goal(goal_type):
	for i in range(get_child_count()):
		get_child(i).check_goal(goal_type)
	check_game_win()
	
func check_game_win():
	if goals_met():
		game_won.emit()

func goals_met():
	for i in range(get_child_count()):
		if !get_child(i).goal_met:
			return false
	return true

func _on_grid_check_goal(goal_type):
	check_goal(goal_type)
