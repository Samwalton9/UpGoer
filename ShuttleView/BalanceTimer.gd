extends Timer


func _ready():
	Events.connect("preflight_success", Callable(self, "_on_preflight_success"))

func _on_preflight_success():
	start()
