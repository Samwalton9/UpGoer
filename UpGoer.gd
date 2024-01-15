extends Node2D

@onready var timer = $TwentySecondTimer


func _on_TwentySecondTimer_timeout():
	Events.emit_signal("game_over", "You ran out of fuel.")


func _on_StartButton_pressed():
	$StartScreen/Text.visible = false
	$StartScreen/tsgjSprite.visible = false
	$StartScreen/SharpenAnimation.play("FadeIn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeIn":
		$TwentySecondTimer/LaunchTimer.start()
		$StartScreen.visible = false
		Events.emit_signal("game_start")
