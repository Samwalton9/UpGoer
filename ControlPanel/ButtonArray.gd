extends Control

var buttons

var active_button = null

func _ready():
	buttons = get_tree().get_nodes_in_group("ReactionButton")
	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed", [button])

	Events.connect("preflight_success", self, "_on_preflight_success")


func _on_ButtonArrayTimer_timeout():
	var random_button = buttons[randi() % buttons.size()]

	random_button.light_up()
	active_button = random_button


func _on_button_pressed(button):
	if active_button:
		if button == active_button:
			button.reset_button()
			active_button = null
		else:
			Events.emit_signal("game_over", "Pressed the wrong button.")


func _on_preflight_success():
	$ButtonArrayTimer.start()
