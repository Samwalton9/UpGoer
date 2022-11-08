extends Timer

onready var launchTimer = $LaunchTimer

func _ready():
	# Reduce 20s wait time by launch timer
	wait_time -= launchTimer.wait_time
	if Globals.restarted:
		launchTimer.start()

func _on_LaunchTimer_timeout():
	if Globals.preflight_successful:
		Globals.flying = true
		start()
	else:
		Events.emit_signal("game_over", "Preflight checks not completed successfully, launch aborted.")
