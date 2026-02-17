extends CanvasLayer

@onready var rect = $ColorRect

func _ready():
	layer = 100
	$ColorRect.color = Color.BLACK
	$ColorRect.modulate.a = 1.0

func fade_out(duration := 0.7):
	var tween = create_tween()
	tween.tween_property(rect, "modulate:a", 1.0, duration)
	await tween.finished

func fade_in(duration := 0.7):
	var tween = create_tween()
	tween.tween_property(rect, "modulate:a", 0.0, duration)
	await tween.finished
