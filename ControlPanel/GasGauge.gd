extends Control

onready var gauge = $GaugeLevel
onready var gauge_fill_timer = $Timer

var max_width
var random_growth_speed
var level = 0
var action_visible : bool = false
var exploded : bool = false

export var gauge_color : Color

func _ready():

	max_width = gauge.rect_size.x

	# Deliberate start speed so gauge is introduced at the right time
	random_growth_speed = 0.15

	# Initialise empty
	gauge.rect_size.x = 0

	gauge.color = gauge_color


func _process(delta):

	if Globals.flying:
		# On every reset, change growth speeds
		if Input.is_action_just_pressed("gauge_reset"):
			level = 0
			random_growth_speed = get_random_growth_speed()
			gauge_fill_timer.stop()
			action_visible = false
			$KeyBox.color = Color(0.5,0.5,0,1)
			$KeyBox/Key.text = ""

		var fractional_width = (level * max_width)
		gauge.rect_size.x = fractional_width

		var growth_amount = random_growth_speed * delta

		var left_until_full = 1 - level

		if left_until_full < (growth_amount * 60):
			$WarningLight.color = Color(1, 0, 0, 1)
		else:
			$WarningLight.color = Color(0, 1, 0, 1)

		if growth_amount > left_until_full:
			growth_amount = 0
			if gauge_fill_timer.is_stopped() and not exploded:
				gauge_fill_timer.start()

		if not action_visible and level > 0.8:
			set_action_visible()

		level += growth_amount


func get_random_growth_speed() -> float:
	return rand_range(0.1,0.3)


func set_action_visible():
	action_visible = true
	$KeyBox.color = Color(1,1,0,1)
	$KeyBox/Key.text = "Space"


func _on_Timer_timeout():
	exploded = true
	Events.emit_signal("gauge_explosion")
	Globals.fail_message = "Pressure was too high."
