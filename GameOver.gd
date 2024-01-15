extends Control

var game_over_text = "": set = set_game_over_text


func _ready() -> void:
	Events.connect("game_over", Callable(self, "_on_game_over"))
	visible = false

func set_game_over_text(new_text=""):
	if new_text != "":
		game_over_text = new_text
	else:
		game_over_text = Globals.fail_message

	$Fade/GameOverLabel/SpecificMessageLabel.text = game_over_text


func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

	Globals.reset()
	Globals.restarted = true


func _on_game_over(fail_message : String):
	visible = true
	get_tree().paused = true

	game_over_text = fail_message
