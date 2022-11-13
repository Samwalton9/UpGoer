extends GridContainer

const NUM_PREFLIGHT_CHECKS = 3

var correct_preflight_checks = 0

onready var clickDownAudio = $ClickDownAudio
onready var clickUpAudio = $ClickUpAudio


func _ready():
	var preflight_buttons = get_tree().get_nodes_in_group("PreFlightButtons")
	for button in preflight_buttons:
		button.connect("pressed", self, "_on_button_pressed", [button])
		button.connect("button_down", self, "_on_button_down")
		button.connect("button_up", self, "_on_button_up")


	for _i in range(NUM_PREFLIGHT_CHECKS):
		var random_choice = randi() % preflight_buttons.size()
		var button = preflight_buttons[random_choice]
		preflight_buttons.pop_at(random_choice)

		button.text = "X"
		button.add_to_group("ButtonChecks")


func passed_preflight():
	Globals.preflight_successful = true


func _on_button_pressed(button):
	var button_checks = get_tree().get_nodes_in_group("ButtonChecks")
	if button_checks.has(button):

		correct_preflight_checks += 1
		button.disabled = true

		if correct_preflight_checks == 3:
			passed_preflight()


func _on_button_down():
	clickDownAudio.play()


func _on_button_up():
	clickUpAudio.play()
