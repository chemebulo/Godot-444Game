extends Control

@export var slides: Array[Texture2D]
var index := 0

func _ready():
	if slides.is_empty():
		push_warning("IntroSlides: No hay imágenes cargadas.")
		start_game()
		return
	show_slide()
	
func _input(event):
	if event.is_action_pressed("interact"):
		advance()
		accept_event()
		
func advance():
	index += 1
	if index >= slides.size():
		start_game()
	else:
		show_slide()

func show_slide():
	$TextureRect.texture = slides[index]

func start_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
