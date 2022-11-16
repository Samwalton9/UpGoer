extends Control

var switches

var active_switch = null

func _ready():
	# Switches should start randomly switched.
	switches = get_tree().get_nodes_in_group("ReactionSwitch")
	for switch in switches:
		switch.connect("pressed", self, "_on_switch_pressed", [switch])

	Events.connect("preflight_success", self, "_on_preflight_success")


func _on_SwitchArrayTimer_timeout():
	var random_switch = switches[randi() % switches.size()]

	random_switch.light_up()
	active_switch = random_switch


func _on_switch_pressed(switch):
	if active_switch:
		if switch == active_switch:
			switch.reset_button()
			active_switch = null
		else:
			Events.emit_signal("game_over", "Flipped the wrong switch.")
	else:
		Events.emit_signal("game_over", "Flipped a switch which didn't need flipping.")


func _on_preflight_success():
	$SwitchArrayTimer.start()
