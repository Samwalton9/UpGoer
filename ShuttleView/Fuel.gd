extends Node2D

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO

var detached : bool = false


func _physics_process(delta):
	if detached:
		velocity += (acceleration + Globals.GRAVITY) * delta

		position += velocity
