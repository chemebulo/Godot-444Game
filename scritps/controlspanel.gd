extends Panel

func _ready():
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func toggle():
	visible = !visible
