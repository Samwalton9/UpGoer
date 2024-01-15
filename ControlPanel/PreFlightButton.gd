extends Control

@onready var button_sprite = $ButtonSprite

@onready var button = $Button


func select() -> void:
	$LEDGlow.visible = true
	$LEDSprite.frame = 1


func selected() -> void:
	$LEDGlow.visible = false
	$LEDSprite.frame = 0


func _on_button_pressed():
	if button_sprite.frame == 0:
		button_sprite.frame = 1
	else:
		button_sprite.frame = 0
