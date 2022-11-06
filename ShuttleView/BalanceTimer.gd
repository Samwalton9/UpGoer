extends Timer


func _ready():
	Events.connect("preflight_success", self, "_on_preflight_success")

func _on_preflight_success():
	start()
