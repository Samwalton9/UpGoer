extends Node2D

onready var shuttle = $Shuttle
onready var booster_one = $LeftBooster
onready var booster_two = $RightBooster
onready var fuel = $Fuel

onready var remote_transform_one = $Shuttle/Booster1RemoteTransform
onready var remote_transform_two = $Shuttle/Booster2RemoteTransform
onready var remote_transform_fuel = $Shuttle/FuelRemoteTransform

var booster_rotation_strength : float = 0.4


func _ready():
	Events.connect("release_button_pressed", self, "_on_release_button_pressed")


func _physics_process(_delta):
	for booster in [booster_one, booster_two, fuel]:
		if not booster.detached:
			# While attached, boosters match velocity and acceleration of the
			# shuttle.
			booster.velocity = shuttle.velocity.rotated(rotation)
			booster.acceleration = shuttle.acceleration

	if Globals.flying:
		$BackgroundTexture.rect_position.y += 1



func _on_WinArea_area_entered(_area):
	# TODO: A real win screen.
	print("Win!")


func _on_release_button_pressed(num):
	# Booster releases
	if num == 1:
		# Reparent - detach from shuttle.
		for booster in [booster_one, booster_two]:
			# Prevent clicking the button multiple times
			if not booster.detached:
				set_detached_state(booster)

		for remote_transform in [remote_transform_one, remote_transform_two]:
			remote_transform.update_position = false
			remote_transform.update_rotation = false

	# Fuel release
	elif num == 2:
		if not fuel.detached:
			fuel.detached = true
			fuel.acceleration = Vector2(0, 1.5).rotated(fuel.rotation)
			remote_transform_fuel.update_position = false
			remote_transform_fuel.update_rotation = false


func set_detached_state(node):
	node.detached = true

	# Boosters will go left or right with speed
	var hori_accel = node.release_direction * 1
	var vert_accel = node.release_direction * -0.6

	node.acceleration = Vector2(hori_accel, vert_accel).rotated(node.rotation)

	# Boosters also spin out left/right, unlike fuel
	node.rotation_strength = booster_rotation_strength * node.release_direction
