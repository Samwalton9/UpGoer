extends AnimatedSprite2D


func _ready():
	Events.connect("game_start", Callable(self, "_on_game_start"))


func _on_game_start():
	play("clock", -1, true)
