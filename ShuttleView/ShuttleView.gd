extends Node2D

onready var shuttle = $Shuttle
onready var booster_one = $Shuttle/Booster1
onready var booster_two = $Shuttle/Booster2
onready var fuel = $Shuttle/Fuel

var booster_rotation_strength : float = 0.4


func _ready():
	Events.connect("release_button_pressed", self, "_on_release_button_pressed")


func _physics_process(delta):
	for booster in [booster_one, booster_two, fuel]:
		if not booster.detached:
			booster.velocity = shuttle.velocity.rotated(rotation)
			booster.acceleration = shuttle.acceleration



func _on_WinArea_area_entered(_area):
	print("Win!")


func _on_release_button_pressed(num):
	# Booster release
	if num == 1:
		# Reparent - detach from shuttle.
		for booster in [booster_one, booster_two]:
			set_detached_state(booster)

		booster_one.rotation_strength = -booster_rotation_strength
		booster_two.rotation_strength = booster_rotation_strength

	# Fuel release
	elif num == 2:
		set_detached_state(fuel)


func set_detached_state(node):
	var original_global_pos = node.global_position
	reparent_to_self(node)
	node.detached = true
	node.global_position = original_global_pos
	node.acceleration = Vector2.ZERO
	node.rotation = shuttle.rotation


func reparent_to_self(node):
	shuttle.remove_child(node)
	add_child(node)
