extends Node2D

onready var timer = $TwentySecondTimer
onready var gameOver = $GameOver

func _ready() -> void:
	Events.connect("game_over", self, "_on_game_over")
	gameOver.visible = false


func _process(_delta) -> void:
	if Globals.flying:
		Globals.shuttle_fuel_percentage = timer.time_left/timer.wait_time


func _on_game_over(fail_message : String):
	gameOver.visible = true
	get_tree().paused = true

	$GameOver.game_over_text = fail_message


func _on_TwentySecondTimer_timeout():
	Events.emit_signal("game_over", "You ran out of fuel.")


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

	Globals.reset()
	Globals.restarted = true


func _on_StartButton_pressed():
	$StartScreen/Text.visible = false
	$StartScreen/tsgjSprite.visible = false
	$StartScreen/SharpenAnimation.play("FadeIn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeIn":
		$TwentySecondTimer/LaunchTimer.start()
		$StartScreen.visible = false
		Events.emit_signal("game_start")
