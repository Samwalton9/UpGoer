extends ColorRect

onready var rotationLabel = $RotationLabel


func _ready():
	rotationLabel.text = "0"


func _process(_delta):
	rotationLabel.text = str(int(Globals.shuttle.rotation_degrees) % 360)
	$Label/StrengthLabel.text = str(Globals.shuttle.rotation_strength)
	$Label2/CorrectionLabel.text = str(Globals.shuttle.rotation_correction)
