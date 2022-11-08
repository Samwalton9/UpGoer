extends Node

const SHUTTLE_POSITION = 0.0
const SHUTTLE_SPEED = 0
const SHUTTLE_ROTATION = 0
const SHUTTLE_ROTATION_STRENGTH = 0.0
const SHUTTLE_ROTATION_CORRECTION = 0.0

const SHUTTLE_FUEL_PERCENTAGE = 1.0

const PREFLIGHT_SUCCESSFUL = false
const FLYING = false


var shuttle_position
var shuttle_speed

var shuttle_rotation
var shuttle_rotation_strength
var shuttle_rotation_correction

var shuttle_fuel_percentage

var preflight_successful
var flying

var restarted = false

func _ready() -> void:
	randomize()
	reset()


func reset():
	shuttle_position = SHUTTLE_POSITION
	shuttle_speed = SHUTTLE_SPEED

	shuttle_rotation = SHUTTLE_ROTATION
	shuttle_rotation_strength = SHUTTLE_ROTATION_STRENGTH
	shuttle_rotation_correction = SHUTTLE_ROTATION_CORRECTION

	shuttle_fuel_percentage = SHUTTLE_FUEL_PERCENTAGE

	preflight_successful = PREFLIGHT_SUCCESSFUL
	flying = FLYING
