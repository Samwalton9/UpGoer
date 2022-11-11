extends Control

var game_over_text = "" setget set_game_over_text


func set_game_over_text(new_text=""):
	if new_text != "":
		game_over_text = new_text
	else:
		game_over_text = Globals.fail_message

	$Fade/GameOverLabel/SpecificMessageLabel.text = game_over_text
