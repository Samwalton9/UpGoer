extends Node

var preflight_successful
const PREFLIGHT_SUCCESSFUL = false

var flying
const FLYING = false

var restarted = false
var fail_message = null
var shuttle

const GRAVITY = Vector2(0,1)

func _ready() -> void:
	randomize()
	reset()


func reset():
	preflight_successful = PREFLIGHT_SUCCESSFUL
	flying = FLYING
	fail_message = null
