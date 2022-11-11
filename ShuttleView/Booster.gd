extends Sprite

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var rotation_strength : float = 0.0

var detached : bool = false


func _physics_process(delta):
	if detached:
		velocity += (acceleration + Globals.GRAVITY) * delta
		#var velocity_rotated = velocity.rotated(rotation)

		rotation_degrees += rotation_strength

		position += velocity
