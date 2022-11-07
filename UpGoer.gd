extends Node2D

onready var timer = $TwentySecondTimer
onready var gameOver = $GameOver

func _ready() -> void:
	Events.connect("game_over", self, "_on_game_over")
	gameOver.visible = false


func _process(_delta) -> void:
	if Globals.flying:
		Globals.shuttle_fuel_percentage = timer.time_left/timer.wait_time


func _on_game_over():
	print("You are having a bad problem and you will not go to space today.")

	gameOver.visible = true
	get_tree().paused = true


func _on_TwentySecondTimer_timeout():
	print("Ran out of fuel, game over.")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://UpGoer.tscn")
