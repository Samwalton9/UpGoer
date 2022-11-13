extends AnimatedSprite

export var release_direction : int

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var rotation_strength : float = 0.0

var detached : bool = false


func _ready():
	if frame != 0:
		$FuelParticles.emitting = true

func _physics_process(delta):
	if detached:
		velocity += (acceleration + Globals.GRAVITY) * delta

		rotation_degrees += rotation_strength

		position += velocity
