extends Node2D

@export var starting_room_path: String

func _ready():
	add_to_group("game")
	change_room(starting_room_path)
	$UI/HintLabel.show_hint()

func change_room(room_path: String, spawn_name: String = ""):

	$Player.set_process_input(false)
	await $FadeLayer.fade_out()

	# borrar habitación actual
	for child in $CurrentRoom.get_children():
		child.queue_free()

	var scene = load(room_path)
	if scene == null:
		push_error("No se pudo cargar habitación")
		await $FadeLayer.fade_in()
		return

	var room = scene.instantiate()
	$CurrentRoom.add_child(room)

	# mover player al spawn
	if spawn_name != "":
		var spawn = room.find_child(spawn_name, true, false)
		if spawn:
			$Player.global_position = spawn.global_position

	await $FadeLayer.fade_in()
	$Player.set_process_input(true)

func _input(event):
	if event.is_action_pressed("pause"):
		$PauseMenu.toggle()
	
	if event.is_action_pressed("help") and not get_tree().paused:
		$UI/ControlsPanel.toggle()
		$UI/HintLabel.hide_hint()
