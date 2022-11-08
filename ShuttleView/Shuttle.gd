extends Sprite

const SHUTTLE_ACCELERATION = 15
const SHUTTLE_MAX_SPEED = 55
const RANDOM_INITIAL_ROTATION = 0.1
const RANDOM_ROTATION_VARIATION = 0.3
const ROTATION_CORRECTION_STRENGTH = 0.02

const GRAVITY = Vector2(0, 10)

var rotation_strength = 0.0
var rotation_correction = 0.0

var docked = true
var original_position : Vector2


func _ready() -> void:
	rotation_degrees = rand_range(-RANDOM_INITIAL_ROTATION, RANDOM_INITIAL_ROTATION)
	original_position = position


func _physics_process(delta) -> void:
	if Globals.flying:
		var shuttle_engine_direction = Vector2(0, -Globals.shuttle_speed).rotated(deg2rad(rotation_degrees))
		position += (shuttle_engine_direction + GRAVITY) * delta

		# Once the shuttle has overcome gravity, release from the dock.
		if docked and -shuttle_engine_direction.y > GRAVITY.y:
			docked = false

		if docked:
			# Shuttle is docked while it builds up acceleration
			position.y = min(position.y, original_position.y)

		rotation_degrees += rotation_strength + rotation_correction

		# Update shuttle stats in use elsewhere
		Globals.shuttle_rotation = rotation_degrees
		Globals.shuttle_rotation_correction = rotation_correction
		Globals.shuttle_rotation_strength = rotation_strength

		Globals.shuttle_speed += SHUTTLE_ACCELERATION * delta

		var input_strength = Input.get_axis("rotate_left", "rotate_right")

		rotation_correction += input_strength * ROTATION_CORRECTION_STRENGTH


func _on_BalanceTimer_timeout():
	# Update rotation strength
	rotation_strength = rand_range(
		rotation_strength - RANDOM_ROTATION_VARIATION,
		rotation_strength + RANDOM_ROTATION_VARIATION
		)
