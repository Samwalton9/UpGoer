extends Node

const SHUTTLE_SPEED = 50
const SHUTTLE_ROTATION = 0
const SHUTTLE_ROTATION_STRENGTH = 0.0
const SHUTTLE_ROTATION_CORRECTION = 0.0

const SHUTTLE_FUEL_PERCENTAGE = 1.0

const PREFLIGHT_SUCCESSFUL = false
const FLYING = false


var shuttle_speed = SHUTTLE_SPEED

var shuttle_rotation = SHUTTLE_ROTATION
var shuttle_rotation_strength = SHUTTLE_ROTATION_STRENGTH
var shuttle_rotation_correction = SHUTTLE_ROTATION_CORRECTION

var shuttle_fuel_percentage = SHUTTLE_FUEL_PERCENTAGE

var preflight_successful = PREFLIGHT_SUCCESSFUL
var flying = FLYING


func _ready() -> void:
	randomize()
	reset()


func reset():
	shuttle_speed = SHUTTLE_SPEED

	shuttle_rotation = SHUTTLE_ROTATION
	shuttle_rotation_strength = SHUTTLE_ROTATION_STRENGTH
	shuttle_rotation_correction = SHUTTLE_ROTATION_CORRECTION

	shuttle_fuel_percentage = SHUTTLE_FUEL_PERCENTAGE

	preflight_successful = PREFLIGHT_SUCCESSFUL
	flying = FLYING
