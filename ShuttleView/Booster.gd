extends Node2D

export var release_direction : int

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var rotation_strength : float = 0.0

var detached : bool = false


func _ready():
	Events.connect("preflight_success", self, "_on_preflight_success")
	Events.connect("out_of_fuel", self, "_on_out_of_fuel")

func _physics_process(delta):
	if detached:
		velocity += (acceleration + Globals.GRAVITY) * delta

		rotation_degrees += rotation_strength

		position += velocity


func _on_out_of_fuel():
	$FuelParticles.out_of_fuel = true


func _on_preflight_success():
	if $Booster.frame != 0:
		$FuelParticles/FuelParticles.emitting = true
