extends Node2D


func _ready() -> void:
	Events.connect("game_over", self, "_on_game_over")


func _on_game_over():
	print("You are having a bad problem and you will not go to space today.")
