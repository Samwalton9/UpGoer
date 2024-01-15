extends GridContainer

const NUM_PREFLIGHT_CHECKS = 3

@onready var clickDownAudio = $ClickDownAudio
@onready var clickUpAudio = $ClickUpAudio


func _ready():
	var preflight_buttons = get_tree().get_nodes_in_group("PreFlightButtons")
	for button in preflight_buttons:
		button.button.connect("pressed", Callable(self, "_on_button_pressed").bind(button))
		button.button.connect("button_down", Callable(self, "_on_button_down"))
		button.button.connect("button_up", Callable(self, "_on_button_up"))


	for _i in range(NUM_PREFLIGHT_CHECKS):
		var random_choice = randi() % preflight_buttons.size()
		var button = preflight_buttons[random_choice]
		preflight_buttons.pop_at(random_choice)

		button.select()
		button.button.add_to_group("ButtonChecks")


func passed_preflight():
	Globals.preflight_successful = true


func _on_button_pressed(button):
	var intended_buttons = get_tree().get_nodes_in_group("ButtonChecks")
	if intended_buttons.has(button.button):

		button.selected()
		button.button.remove_from_group("ButtonChecks")

		if get_tree().get_nodes_in_group("ButtonChecks").is_empty():
			passed_preflight()
	else:
		Events.emit_signal("game_over", "Toggled an unnecessary pre-flight check.")


func _on_button_down():
	clickDownAudio.play()


func _on_button_up():
	clickUpAudio.play()
