extends Sprite

const SHUTTLE_MAX_SPEED = 55
const RANDOM_ROTATION_VARIATION = 0.3
const ROTATION_CORRECTION_STRENGTH = 0.02

const GRAVITY = Vector2(0, 10)

var rotation_strength = 0.0
var rotation_correction = 0.0

var shuttle_velocity = Vector2(0,0)
var shuttle_acceleration = Vector2(0,-10)

var docked = true
var original_position : Vector2

var skipped_first = false


func _ready() -> void:
	original_position = position
	Globals.shuttle = self


func _physics_process(delta) -> void:
	if Globals.flying:
		shuttle_velocity += shuttle_acceleration * delta

		var shuttle_velocity_rotated = shuttle_velocity.rotated(deg2rad(rotation_degrees))
		position += (shuttle_velocity_rotated + GRAVITY) * delta

		# Once the shuttle has overcome gravity, release from the dock.
		if docked and shuttle_velocity_rotated.y > GRAVITY.y:
			docked = false

		if docked:
			# Shuttle is docked while it builds up acceleration
			position.y = min(position.y, original_position.y)

		rotation_degrees += rotation_strength + rotation_correction

		var input_strength = Input.get_axis("rotate_left", "rotate_right")

		rotation_correction += input_strength * ROTATION_CORRECTION_STRENGTH


func _on_BalanceTimer_timeout():
	if skipped_first:
		# Update rotation strength
		rotation_strength = rand_range(
			rotation_strength - RANDOM_ROTATION_VARIATION,
			rotation_strength + RANDOM_ROTATION_VARIATION
			)
	else:
		skipped_first = true
