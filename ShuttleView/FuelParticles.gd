extends Node2D

export var out_of_fuel = false


func _physics_process(delta):
	if out_of_fuel:
		# While we can't adjust amount without resetting
		# https://github.com/godotengine/godot/issues/16352
		$FuelParticles.emitting = false
		$OutOfFuelParticles.emitting = true
