extends CanvasLayer

func _ready():
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_resume_pressed():
	toggle()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
