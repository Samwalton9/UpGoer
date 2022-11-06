extends Node2D

onready var shuttle = $Shuttle


func _physics_process(_delta):
	# Once the shuttle reaches the half-way mark on the screen, move to stage 2
	if Globals.stage == 1:
		var window_height = ProjectSettings.get_setting("display/window/size/height")
		if shuttle.position.y < window_height/2:
			Globals.stage += 1


func _on_WinArea_area_entered(_area):
	print("Win!")
