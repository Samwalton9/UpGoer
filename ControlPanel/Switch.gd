extends CheckButton


func light_up() -> void:
	$ReactionTimer.start()
	$ColorRect.visible = true


func reset_button() -> void:
	$ReactionTimer.stop()
	$ColorRect.visible = false


func _on_ReactionTimer_timeout():
	# TODO: This could be a custom message per-button, if they all have
	# different text on them.
	Events.emit_signal("game_over", "Failed to react to a button in time.")
