extends Sprite

const SHUTTLE_ACCELERATION = 1
const SHUTTLE_MAX_SPEED = 50


func _ready() -> void:
	rotation_degrees = rand_range(0.05,0.1)

func _physics_process(delta) -> void:
	position -= Vector2(0, SHUTTLE_MAX_SPEED).rotated(deg2rad(rotation_degrees)) * delta
	rotation_degrees += 0.05
