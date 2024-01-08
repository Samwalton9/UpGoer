extends Node2D

const SHUTTLE_MAX_SPEED = 50
const RANDOM_ROTATION_VARIATION = 0.3
const ROTATION_CORRECTION_STRENGTH = 0.02

var rotation_strength = 0.0
var rotation_correction = 0.0

var velocity = Vector2(0,0)
var acceleration = Vector2(0,-1.1)

var original_position : Vector2

var skipped_first = false
var powered = true


func _ready() -> void:
	original_position = position
	Globals.shuttle = self

	Events.connect("gauge_explosion", self, "_on_gauge_explosion")


func _physics_process(delta) -> void:
	if Globals.flying:
		velocity += (acceleration + Globals.GRAVITY) * delta

		if powered:
			var velocity_rotated = velocity.rotated(deg2rad(rotation_degrees))
			position += velocity_rotated
		else:
			position += velocity

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


func _on_gauge_explosion():
	# TODO: Add explosion effect on the relevant side.
	var directions = [-1, 1]
	var random_direction = directions[randi() % 2]

	var explosion_velocity = rand_range(1,2) * random_direction

	velocity.x += explosion_velocity

	rotation_strength += random_direction * RANDOM_ROTATION_VARIATION
