extends Area2D


func _on_LoseArea_area_entered(_area):
	if Globals.fail_message:
		Events.emit_signal("game_over", Globals.fail_message)
	else:
		Events.emit_signal("game_over", "Space shuttles should point up if they want to go to space.")
