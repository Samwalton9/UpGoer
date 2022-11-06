extends Node2D

onready var shuttle = $Shuttle


func _on_WinArea_area_entered(_area):
	print("Win!")
