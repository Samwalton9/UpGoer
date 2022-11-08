extends Control

var ready_to_release = false


func _on_ReleaseTimer_timeout():
	$ReleaseHighlight.visible = true
	$ReactionTimer.start()

	ready_to_release = true


func _on_ReactionTimer_timeout():
	# TODO: This could maybe be a soft fail instead, where you decelerate rapidly?
	Events.emit_signal("game_over", "Didn't release boosters in time.")


func _on_ReleaseButton_pressed():
	if ready_to_release:
		$ReleaseHighlight.visible = false
		$ReactionTimer.stop()
	else:
		# TODO: Likewise, could be a rapid deceleration instead.
		Events.emit_signal("game_over", "Released boosters too early.")
