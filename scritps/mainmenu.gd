extends Control

func _on_start_pressed():
	GameState.reset()
	get_tree().change_scene_to_file("res://scenes/introslides.tscn")

func _on_exit_pressed():
	get_tree().quit()
