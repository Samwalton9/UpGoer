extends Node

var shuttle_fuel_percentage
const SHUTTLE_FUEL_PERCENTAGE = 1.0

var preflight_successful
const PREFLIGHT_SUCCESSFUL = false

var flying
const FLYING = false

var restarted = false
var fail_message = null
var shuttle

func _ready() -> void:
	randomize()
	reset()


func reset():
	shuttle_fuel_percentage = SHUTTLE_FUEL_PERCENTAGE

	preflight_successful = PREFLIGHT_SUCCESSFUL
	flying = FLYING
	fail_message = null
