extends Control

@onready var clickDownAudio = $ClickDownAudio
@onready var clickUpAudio = $ClickUpAudio

func _ready():
	if Globals.restarted:
		visible = false


func _on_StartButton_button_down():
	clickDownAudio.play()


func _on_StartButton_button_up():
	clickUpAudio.play()
