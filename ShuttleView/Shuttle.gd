extends Sprite

const SHUTTLE_ACCELERATION = 1
const SHUTTLE_MAX_SPEED = 50
const RANDOM_INITIAL_ROTATION = 0.1
const RANDOM_ROTATION_VARIATION = 0.1

var rotation_strength = 0.0
var rotation_correction = 0.0


func _ready() -> void:
	rotation_degrees = rand_range(-RANDOM_INITIAL_ROTATION, RANDOM_INITIAL_ROTATION)

func _physics_process(delta) -> void:
	# During stage one, the shuttle moves on the screen, until reaching
	# the halfway point, then moves again in stage 3.
	if Globals.stage == 1 or Globals.stage == 3:
		position -= Vector2(0, SHUTTLE_MAX_SPEED).rotated(deg2rad(rotation_degrees)) * delta

	# TODO: This is far from ideal, doesn't model things correctly once the shuttle is turning rapidly.
	rotation_degrees += rotation_strength + rotation_correction

	# Update shuttle stats in use elsewhere
	Globals.shuttle_rotation = rotation_degrees
	Globals.shuttle_rotation_correction = rotation_correction
	Globals.shuttle_rotation_strength = rotation_strength

	# TODO: Temporary, this will accelerate eventually.
	Globals.shuttle_speed = SHUTTLE_MAX_SPEED

	var input_strength = Input.get_action_strength("rotate_right") - Input.get_action_strength("rotate_left")

	# This needs work - maybe input determines course correction strength, with the shuttle rotation varying randomly during the course of the game.
	# Need to match the slider to the rotation strength that's occurring. It's constantly moving so you need to correct / match it
	# on a regular basis.
	rotation_correction += input_strength * 0.01


func _on_BalanceTimer_timeout():
	# Update rotation strength
	# TODO: Tweak this - I think it's still feasible to not need to touch rotation controls
	rotation_strength = rand_range(
		rotation_strength - RANDOM_ROTATION_VARIATION,
		rotation_strength + RANDOM_ROTATION_VARIATION
		)
