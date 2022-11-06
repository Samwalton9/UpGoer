extends Area2D



func _on_LoseArea_area_entered(_area):
	Events.emit_signal("game_over")
