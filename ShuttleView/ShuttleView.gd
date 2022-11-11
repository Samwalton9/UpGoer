extends Node2D

onready var shuttle = $Shuttle
onready var booster_one = $Shuttle/Booster1
onready var booster_two = $Shuttle/Booster2

var boosters_attached : bool = true
var booster_rotation_strength : float = 0.4


func _ready():
	Events.connect("release_button_pressed", self, "_on_release_button_pressed")


func _physics_process(delta):
	if boosters_attached:
		for booster in [booster_one, booster_two]:
			booster.velocity = shuttle.velocity.rotated(rotation)
			booster.acceleration = shuttle.acceleration


func _on_WinArea_area_entered(_area):
	print("Win!")


func _on_release_button_pressed(num):
	# Booster release
	if num == 1:
		# Reparent - detach from shuttle.
		for booster in [booster_one, booster_two]:
			var original_global_pos = booster.global_position
			reparent_to_self(booster)
			booster.detached = true
			booster.global_position = original_global_pos
			booster.acceleration = -Globals.GRAVITY/2
			booster.rotation = shuttle.rotation

		boosters_attached = false
		booster_one.rotation_strength = -booster_rotation_strength
		booster_two.rotation_strength = booster_rotation_strength

	# Fuel release
	elif num == 2:
		pass


func reparent_to_self(node):
	shuttle.remove_child(node)
	add_child(node)
