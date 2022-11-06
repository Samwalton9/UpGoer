extends Node

var stage = 1
var shuttle_speed = 50
var shuttle_rotation = 0
var shuttle_rotation_strength = 0.0
var shuttle_rotation_correction = 0.0

func _ready() -> void:
	randomize()
