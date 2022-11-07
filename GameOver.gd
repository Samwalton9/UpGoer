extends Control

var game_over_text = "" setget set_game_over_text


func set_game_over_text(new_text):
	game_over_text = new_text
	$Fade/GameOverLabel/SpecificMessageLabel.text = game_over_text
