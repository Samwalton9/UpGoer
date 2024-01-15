extends Control

var ready_to_release = false

@export var release_num : int
@export var release_time : float
@export var button_text : String

func _ready() -> void:
	Events.connect("preflight_success", Callable(self, "_on_preflight_success"))
	$ReleaseTimer.wait_time = release_time
	$ReleaseButton.text = button_text


func _on_ReleaseTimer_timeout():
	$ReleaseHighlight.visible = true
	$ReactionTimer.start()

	ready_to_release = true

	# Boosters
	if release_num == 1:
		Events.emit_signal("out_of_fuel")


func _on_ReactionTimer_timeout():
	# Reduce acceleration drastically if boosters haven't been released.
	Globals.shuttle.acceleration = Vector2(0, -0.5)
	Globals.shuttle.powered = false
	Globals.fail_message = "Didn't release boosters in time."


func _on_ReleaseButton_pressed():
	if ready_to_release:
		$ReleaseHighlight.visible = false
		$ReactionTimer.stop()
	else:
		Globals.shuttle.acceleration = Vector2(0,-0.01)
		Globals.shuttle.powered = false
		Globals.fail_message = "Released boosters too early."

	Events.emit_signal("release_button_pressed", release_num)


func _on_preflight_success():
	$ReleaseTimer.start()
