extends Node

# Shuttle variables for display
var shuttle_speed = 50

var shuttle_rotation = 0
var shuttle_rotation_strength = 0.0
var shuttle_rotation_correction = 0.0

var shuttle_fuel_percentage = 1.0

var preflight_successful = false
var flying = false

func _ready() -> void:
	randomize()


func reset():
	# TODO: A way to reset all the variables to their default values.
	# One answer I saw suggested a dictionary format for looping through vars
	pass

