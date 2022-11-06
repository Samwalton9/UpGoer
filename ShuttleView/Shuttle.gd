extends Sprite

const SHUTTLE_ACCELERATION = 1
const SHUTTLE_MAX_SPEED = 200


func _ready() -> void:
	rotation_degrees = rand_range(-0.1,0.1)

func _physics_process(delta) -> void:
	# During stage one, the shuttle moves on the screen, until reaching
	# the halfway point, then moves again in stage 3.
	if Globals.stage == 1 or Globals.stage == 3:
		position -= Vector2(0, SHUTTLE_MAX_SPEED).rotated(deg2rad(rotation_degrees)) * delta

	# TODO: This is far from ideal, doesn't model things correctly once the shuttle is turning rapidly.
	#rotation_degrees *= 1.01

	# Update shuttle stats in use elsewhere
	# TODO: Temporary, this will accelerate eventually.
	Globals.shuttle_speed = SHUTTLE_MAX_SPEED
