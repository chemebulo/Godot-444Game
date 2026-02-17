extends Node2D

@export var starting_room_path: String

func _ready():
	add_to_group("game")
	change_room(starting_room_path)
	$UI/HintLabel.show_hint()

func change_room(room_path: String):
	for child in $CurrentRoom.get_children():
		child.queue_free()

	var scene = load(room_path)

	if scene == null:
		push_error("No se pudo cargar: " + room_path)
		return

	var room = scene.instantiate()
	$CurrentRoom.add_child(room)

func _input(event):
	if event.is_action_pressed("pause"):
		$PauseMenu.toggle()
	
	if event.is_action_pressed("help") and not get_tree().paused:
		$UI/ControlsPanel.toggle()
		$UI/HintLabel.hide_hint()
