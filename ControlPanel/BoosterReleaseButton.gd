extends Control

var ready_to_release = false

func _ready() -> void:
	Events.connect("preflight_success", self, "_on_preflight_success")


func _on_ReleaseTimer_timeout():
	$ReleaseHighlight.visible = true
	$ReactionTimer.start()

	ready_to_release = true


func _on_ReactionTimer_timeout():
	# Reduce acceleration drastically if boosters haven't been released.
	Globals.shuttle.shuttle_acceleration = Vector2(0, 20)
	Globals.fail_message = "Didn't release boosters in time."


func _on_ReleaseButton_pressed():
	if ready_to_release:
		$ReleaseHighlight.visible = false
		$ReactionTimer.stop()
	else:
		# TODO: Likewise, could be a rapid deceleration instead.
		Events.emit_signal("game_over", "Released boosters too early.")


func _on_preflight_success():
	$ReleaseTimer.start()
