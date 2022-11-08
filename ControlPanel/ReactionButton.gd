extends Button


func light_up() -> void:
	$ReactionTimer.start()
	text = "-- X --"


func reset_button() -> void:
	$ReactionTimer.stop()
	text = ""


func _on_ReactionTimer_timeout():
	# TODO: This could be a custom message per-button, if they all have
	# different text on them.
	Events.emit_signal("game_over", "Failed to react to a button in time.")
