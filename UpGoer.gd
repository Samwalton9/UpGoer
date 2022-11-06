extends Node2D

onready var timer = $TwentySecondTimer


func _ready() -> void:
	Events.connect("game_over", self, "_on_game_over")


func _process(_delta) -> void:
	Globals.shuttle_fuel_percentage = timer.time_left/timer.wait_time


func _on_game_over():
	print("You are having a bad problem and you will not go to space today.")


func _on_TwentySecondTimer_timeout():
	print("Ran out of fuel, game over.")
