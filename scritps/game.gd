extends Node2D

func _input(event):
	if event.is_action_pressed("pause"):
		$PauseMenu.toggle()
	
	if event.is_action_pressed("help") and not get_tree().paused:
		$UI/ControlsPanel.toggle()
		$UI/HintLabel.hide_hint()
		
func _ready():
	$UI/HintLabel.show_hint()
