extends Node2D

@export var target_scene: String

var player_in_range:= false

func _ready(): 
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _input(event):
	if player_in_range and event.is_action_pressed("interact"):
		change_room()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func change_room():
	get_tree().change_scene_to_file(target_scene)
