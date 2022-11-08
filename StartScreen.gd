extends Control


func _ready():
	if Globals.restarted:
		visible = false
