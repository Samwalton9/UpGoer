extends ColorRect

onready var fuelLevel = $FuelLevel

var max_height
var original_position

func _ready() -> void:
	max_height = fuelLevel.rect_size.y
	original_position = fuelLevel.rect_position.y

func _process(_delta):
	var fuel_percentage = Globals.shuttle_fuel_percentage

	var fractional_height = int(fuel_percentage * max_height)
	fuelLevel.rect_size.y = fractional_height
	fuelLevel.rect_position.y = original_position + max_height - fractional_height
