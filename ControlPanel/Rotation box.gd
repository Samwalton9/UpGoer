extends ColorRect

onready var rotationLabel = $RotationLabel

func _process(_delta):
	rotationLabel.text = str(int(Globals.shuttle_rotation) % 360)
